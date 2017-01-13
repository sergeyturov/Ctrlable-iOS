//
//  MediaGateway.h
//  ctrlable
//
//  Created by Ronald In 't Velt on 04/11/15.
//  Copyright © 2015 WaveSquare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MediaGateway : NSObject
{
    NSString *localAddress;
    NSString *remoteAddress;
    NSString *localPort;
    NSString *remotePort;
    NSString *name;
    NSString *macAddress;
    NSString *id;
}

@property(nonatomic, strong) NSString *localAddress;
@property(nonatomic, strong) NSString *remoteAddress;
@property(nonatomic, strong) NSString *localPort;
@property(nonatomic, strong) NSString *remotePort;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *macAddress;
@property(nonatomic, strong) NSString *id;

@end
