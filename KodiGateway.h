//
//  KodiGateway.h
//  ctrlable
//
//  Created by Ronald In 't Velt on 05/10/15.
//  Copyright (c) 2015 WaveSquare. All rights reserved.
//

#import "Gateway.h"
#import "DSJSONRPC.h"
#import "tcpJSONRPC.h"

@protocol KodiGatewayDelegate
- (void)connectionOk;
- (void)connectionFailedWithReason:(NSString *)reason;
@end

@interface KodiGateway : Gateway
{
    NSString *serverPort;
    NSString *tcpPort;
    NSString *mac;
    bool preferTvPosters;
    tcpJSONRPC *tcpJSONRPCconnection;
}

- (void)testConnectionForDelegate:(id) delegate;

@property (nonatomic, strong) NSString *serverPort;
@property (nonatomic, strong) NSString *tcpPort;
@property (nonatomic, strong) NSString *mac;
@property (nonatomic) bool preferTvPosters;
@property (strong, nonatomic) tcpJSONRPC *tcpJSONRPCconnection;

@end
