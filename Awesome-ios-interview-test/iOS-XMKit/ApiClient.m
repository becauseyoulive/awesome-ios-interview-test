//
//  ApiClient.m
//  Awesome-ios-interview-test
//
//  Created by Nam Nguyen on 3/2/17.
//  Copyright © 2017 Nam Nguyen. All rights reserved.
//

#import "ApiClient.h"
#import "XMEncryptionHMACMD5.h"

@implementation ApiClient

+ (ApiClient *)sharedApiClient {
    static ApiClient *_sharedApiClient = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedApiClient = [[self alloc] init];
    });
    return _sharedApiClient;
}

- (NSString *)apiKey {
    return @"6a81c2d9-743d-2a1c-62bf-2545382fe7e1";
}

- (NSString *)apiVersion {
    return @"1.0";
}

- (NSString *)sharedSecret {
    return @"jdai4*c52kl";
}

- (NSString *)createToken:(NSString *)dateString udid:(NSString *)udid apiKey:(NSString *)apiKey sharedSecret:(NSString *)sharedSecret {
    NSString *secretData = [NSString stringWithFormat:@"%@-%@-%@", udid, apiKey, sharedSecret];
    NSString *token = [XMEncryptionHMACMD5 encrypt:dateString secretDataString:secretData];
    return token;
}

- (NSString *)httpHeaderDateStringFromDate:(NSDate *)date {
    NSDateFormatter *httpHeaderDateFormatter = [[NSDateFormatter alloc] init];
    httpHeaderDateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    httpHeaderDateFormatter.dateFormat = @"EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'";
    //As the textual parts must be english (see RFC 1123 for all the wording), I add
    httpHeaderDateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    return [httpHeaderDateFormatter stringFromDate:date];
}

@end
