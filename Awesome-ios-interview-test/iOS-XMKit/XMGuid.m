//
//  XMGuid.m
//  AutoScout24-V3
//
//  Created by Lachat Patrick on 10.01.12.
//  Copyright (c) 2012 Xmedia AG. All rights reserved.
//

#import "XMGuid.h"

@implementation XMGuid

#pragma mark -
#pragma mark Singleton


+ (NSString *)uniqueDeviceIdentifier {
    static NSString *_udid = nil;
    static dispatch_once_t udidPredicate;
    dispatch_once(&udidPredicate, ^{
        CFUUIDRef   uuid;
        CFStringRef uuidStr;
        
        uuid = CFUUIDCreate(NULL);
        assert(uuid != NULL);
        
        uuidStr = CFUUIDCreateString(NULL, uuid);
        assert(uuidStr != NULL);
        _udid = [NSString stringWithFormat:@"%@", uuidStr];
    });
    
    return _udid;
}

// return a new autoreleased UUID string
+ (NSString *)generateUuidString {
    // create a new UUID which you own
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    
    // create a new CFStringRef (toll-free bridged to NSString)
    // that you own
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
    
    // release the UUID
    CFRelease(uuid);
    
    return uuidString;
}


@end
