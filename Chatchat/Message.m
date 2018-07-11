//
//  Message.m
//  Chatchat
//
//  Created by WangRui on 16/6/1.
//  Copyright © 2016年 Beta.Inc. All rights reserved.
//

#import "Message.h"
#import "UserManager.h"

@implementation Message



- (NSDictionary *)toDictionary{
    return @{@"from": self.from,
             @"to"  : self.to,
             @"content" : self.content,
             @"time" : self.time,
             @"type" : self.type,
             @"subtype" : self.subtype
             };
}

- (instancetype)initWithPeerUID : (NSString *)peerUID
                            Type: (NSString *)type
                         SubType: (NSString *)subtype
                         Content: (id)content{
    if (self = [super init]) {
        self.from = [[UserManager sharedManager] localUser].uniqueID;
        self.to = peerUID;
        self.type = type;
        self.subtype = subtype;
        self.content = content;
        self.time = @"";
    }
    
    return self;
}

+ (instancetype)textMessageWithPeerUID : (NSString *)peerUID
                               content : (NSString *)content{
    Message *message = [[Message alloc] init];
    message.type = kMessageType_Text;
    message.subtype = kMessageSubtype_Placeholder;
    message.from = [[UserManager sharedManager] localUser].uniqueID;
    message.to = peerUID;
    message.content = content;
    message.time = @"";
    
    return message;
}


@end
