//
//  XMGuid.h
//  AutoScout24-V3
//
//  Created by Lachat Patrick on 10.01.12.
//  Copyright 2010 http://www.xmedia.ch. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 * A UDID generator class
 */
@interface XMGuid : NSObject

/**
 * Creates, if it doesn't already exist, and returns UDID.
 * This is the preferred way to get a UDID, since it's reused throughout the lifetime of the installed application.
 * The UDID is stored in the keychain. Internally, the key to the UDID is the CFBundleIdentifier
 */
+ (NSString *)uniqueDeviceIdentifier;

/**
 * Creates a new UUID string
 */
+ (NSString *)generateUuidString;

@end
