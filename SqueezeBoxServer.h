//
//  SqueezeBoxServer.h
//  ctrlable
//
//  Created by Ronald In 't Velt on 22/10/15.
//  Copyright (c) 2015 WaveSquare. All rights reserved.
//

#define SQ_DISCOVER_TIMEOUT 15
#define SQ_NETWORK @"local."
#define SQ_DISCOVERY_PORT 3483
//#define SQ_DISCOVERY_PORT 3999

#import <Foundation/Foundation.h>
#import "AsyncUdpSocket.h"

@interface SqueezeBoxServer : NSObject
<AsyncUdpSocketDelegate>
{
    NSTimer *timer;
    NSString *localAddress;
    NSString *remoteAddress;
    NSString *localPort;
    NSString *remotePort;
    NSString *name;
}

-(IBAction)startDiscover:(id)sender;


@property(nonatomic, strong) NSString *localAddress;
@property(nonatomic, strong) NSString *remoteAddress;
@property(nonatomic, strong) NSString *localPort;
@property(nonatomic, strong) NSString *remotePort;
@property(nonatomic, strong) NSString *name;

@end
