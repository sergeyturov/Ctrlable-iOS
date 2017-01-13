//
//  KodiGateway.m
//  ctrlable
//
//  Created by Ronald In 't Velt on 05/10/15.
//  Copyright (c) 2015 WaveSquare. All rights reserved.
//

#import "KodiGateway.h"

@implementation KodiGateway
@synthesize serverPort;
@synthesize tcpPort;
@synthesize mac;
@synthesize preferTvPosters;
@synthesize tcpJSONRPCconnection;

- (id)init
{
    self = [super init];
    if (self)
    {
//        self.gatewayType = GatewayTypeKodi;
        
        serverPort = nil;
        tcpPort = nil;
        mac = nil;
        preferTvPosters = false;
        self.tcpJSONRPCconnection = [[tcpJSONRPC alloc] init];
        self.tcpJSONRPCconnection.notificationObject = self;
    }
    return self;
}

- (void)testConnectionForDelegate:(id) delegate
{
    [self.tcpJSONRPCconnection startNetworkCommunicationWithServer:self.localAddress serverPort:[self.tcpPort intValue]];
}




- (void)encodeWithCoder:(NSCoder *)coder
{
    [super encodeWithCoder:coder];
    [coder encodeObject:self.serverPort forKey:@"GWY_serverPort"];
    [coder encodeObject:self.tcpPort forKey:@"GWY_tcpPort"];
    [coder encodeObject:self.mac forKey:@"GWY_mac"];
    [coder encodeBool:self.preferTvPosters forKey:@"GWY_preferTvPosters"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    
    self.serverPort = [coder decodeObjectForKey:@"GWY_serverPort"];
    self.tcpPort = [coder decodeObjectForKey:@"GWY_tcpPort"];
    self.mac = [coder decodeObjectForKey:@"GWY_mac"];
    self.preferTvPosters = [coder decodeBoolForKey:@"GWY_preferTvPosters"];
    
    return self;
}

@end
