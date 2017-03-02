//
//  XMEncryptionHMACMD5.h
//  XMBase
//
//  Created by Patrick Lachat on 1/19/11.
//  Copyright 2011 http://www.xmedia.ch. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface XMEncryptionHMACMD5 : NSObject {
    
}

+ (NSString*)encrypt:(NSString*)key secretDataString:(NSString*)data;


@end