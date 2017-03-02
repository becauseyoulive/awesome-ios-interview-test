//
//  ApiClient.h
//  Awesome-ios-interview-test
//
//  Created by Nam Nguyen on 3/2/17.
//  Copyright © 2017 Nam Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMGuid.h"

@interface ApiClient : NSObject

@property (nonatomic, readonly) NSString *apiKey;
@property (nonatomic, readonly) NSString *apiVersion;
@property (nonatomic, readonly) NSString *sharedSecret;

+ (ApiClient *)sharedApiClient;

// Use to generate X-Token
- (NSString *)createToken:(NSString *)dateString udid:(NSString *)udid apiKey:(NSString *)apiKey sharedSecret:(NSString *)sharedSecret;

// Request data string
- (NSString *)httpHeaderDateStringFromDate:(NSDate *)date;

@end
