//
//  tcpJSONRPC.h
//  ctrlable Remote
//
//  Created by Giovanni Messina on 22/11/12.
//  Copyright (c) 2012 joethefox inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSJSONRPC.h"

@interface tcpJSONRPC : NSObject <NSStreamDelegate> {
    BOOL inCheck;
    DSJSONRPC *jsonRPC;
    NSTimer* heartbeatTimer;
    id notificationObject;
}

- (void)startNetworkCommunicationWithServer:(NSString *)server serverPort:(int)port;
- (void)stopNetworkCommunication;
- (NSStreamStatus)currentSocketInStatus;

@property (nonatomic, strong) id notificationObject;

@end