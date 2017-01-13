//
//  SqueezeBoxServer.m
//  ctrlable
//
//  Created by Ronald In 't Velt on 22/10/15.
//  Copyright (c) 2015 WaveSquare. All rights reserved.
//

#import "SqueezeBoxServer.h"
#import "Logger.h"


@implementation SqueezeBoxServer
@synthesize name;
@synthesize localAddress;
@synthesize localPort;
@synthesize remoteAddress;
@synthesize remotePort;

- (id)init
{
    self = [super init];
    if (self)
    {
        MyLog(@"Init SQ server");
        timer = nil;
        
        self.name = nil;
        self.localPort = nil;
        self.localAddress = nil;
        self.remotePort = nil;
        self.remoteAddress = nil;
    }
    return self;
}


- (BOOL)onUdpSocket:(AsyncUdpSocket *)sock didReceiveData:(NSData *)data withTag:(long)tag fromHost:(NSString *)host port:(UInt16)port
{
    NSString *pkt = [NSString stringWithUTF8String:data.bytes];

    MyLog(@"Packet:%@   %@", pkt, host);
    
    if ([host rangeOfString:@"ffff"].location != NSNotFound)
        return NO;  // Ignore broadcast packets
    
    NSRange nameRange = [data rangeOfData:[@"NAME" dataUsingEncoding:NSUTF8StringEncoding] options:0 range:NSMakeRange(0, data.length)];
    NSRange portRange = [data rangeOfData:[@"JSON" dataUsingEncoding:NSUTF8StringEncoding] options:0 range:NSMakeRange(0, data.length)];
    NSRange clientRange = [data rangeOfData:[@"IPAD" dataUsingEncoding:NSUTF8StringEncoding] options:0 range:NSMakeRange(0, data.length)];

    if ((nameRange.location != NSNotFound) && (portRange.location != NSNotFound) && (clientRange.location == NSNotFound))
    {
        // Check bounds of raw data packet on all operations
        if (portRange.location + 4 >= data.length)
        {
            MyLog(@"Port location index out of bounds");
            return NO;
        }
        char length = ((char *)data.bytes)[portRange.location + 4];
        if (portRange.location + 4 + length >= data.length)
        {
            MyLog(@"Port string range out of bounds");
            return NO;
        }
        NSData *jsonPort = [data subdataWithRange:NSMakeRange(portRange.location + 5, length)];

        if (nameRange.location + 4 >= data.length)
        {
            MyLog(@"Name location index out of bounds");
            return NO;
        }
        length = ((char *)data.bytes)[nameRange.location + 4];
        if (nameRange.location + 4 + length >= data.length)
        {
            MyLog(@"Name string range out of bounds");
            return NO;
        }
        NSData *remoteName = [data subdataWithRange:NSMakeRange(nameRange.location + 5, length)];

        
        MyLog(@"len:%i name:%@ port:%@ host:%@", length, [NSString stringWithUTF8String:remoteName.bytes], [NSString stringWithUTF8String:jsonPort.bytes], host);
        
        
        
        if (self.name)
        {
            if ([self.name isEqualToString:[NSString stringWithUTF8String:remoteName.bytes]])
            {
                // Match on name, check if IP needs changing
                if (![host isEqualToString:self.localAddress])
                {
                    self.localPort = [NSString stringWithUTF8String:jsonPort.bytes];
                    self.localAddress = host;
                }
            }
        }
        else
        {
            // New config
            self.name = [NSString stringWithUTF8String:remoteName.bytes];
            self.localPort = [NSString stringWithUTF8String:jsonPort.bytes];
            self.localAddress = host;
        }
        return YES;
    }
    else
    {
        [sock receiveWithTimeout:-1 tag:1];
        return NO;
    }
}


#pragma mark - Discovery

-(void)stopDiscovery
{
    MyLog(@"Stop discovery");
    if (timer)
        [timer invalidate];
}

-(IBAction)startDiscover:(id)sender
{
    MyLog(@"Start discovery");
    AsyncUdpSocket *udpSocket = [[AsyncUdpSocket alloc] initWithDelegate:self];
    NSError *error;
    if (![udpSocket bindToPort:SQ_DISCOVERY_PORT error:&error])
    {
        MyLog(@"Error binding UDP port:%i", SQ_DISCOVERY_PORT);
    }
    [udpSocket enableBroadcast:YES error:&error];
    
    NSData *data;
    data = [NSData dataWithBytes:"eIPAD\0NAME\0JSON\0" length:16];
    
    [udpSocket sendData:data toHost:@"255.255.255.255" port:SQ_DISCOVERY_PORT withTimeout:SQ_DISCOVER_TIMEOUT tag:1];
    [udpSocket receiveWithTimeout:-1 tag:1];
    timer = [NSTimer scheduledTimerWithTimeInterval:SQ_DISCOVER_TIMEOUT target:self selector:@selector(stopDiscovery) userInfo:nil repeats:NO];
}
@end
