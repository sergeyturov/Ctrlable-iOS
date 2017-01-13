//
//  MediaGateway.m
//  ctrlable
//
//  Created by Ronald In 't Velt on 04/11/15.
//  Copyright © 2015 WaveSquare. All rights reserved.
//

#import "MediaGateway.h"
#import "Logger.h"

@implementation MediaGateway

@synthesize name;
@synthesize localAddress;
@synthesize localPort;
@synthesize remoteAddress;
@synthesize remotePort;
@synthesize macAddress;
@synthesize id;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.name = nil;
        self.localPort = nil;
        self.localAddress = nil;
        self.remotePort = nil;
        self.remoteAddress = nil;
        self.id = nil;
        self.macAddress = nil;
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.localAddress forKey:@"GWY_localAddress"];
    [coder encodeObject:self.remoteAddress forKey:@"GWY_remoteAddress"];
    [coder encodeObject:self.localPort forKey:@"GWY_localPort"];
    [coder encodeObject:self.remotePort forKey:@"GWY_remotePort"];
    [coder encodeObject:self.macAddress forKey:@"GWY_mac"];
    [coder encodeObject:self.id forKey:@"GWY_id"];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [self init];
    self.localAddress = [coder decodeObjectForKey:@"GWY_localAddress"];
    self.remoteAddress = [coder decodeObjectForKey:@"GWY_remoteAddress"];
    self.localPort = [coder decodeObjectForKey:@"GWY_localPort"];
    self.remotePort = [coder decodeObjectForKey:@"GWY_remotePort"];
    self.macAddress = [coder decodeObjectForKey:@"GWY_mac"];
    self.id = [coder decodeObjectForKey:@"GWY_id"];
    
    return self;
}

@end
