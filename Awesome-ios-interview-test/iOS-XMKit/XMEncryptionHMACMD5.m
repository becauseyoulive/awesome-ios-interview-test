//
//  XMEncryptionHMACMD5.m
//  XMBase
//
//  Created by Patrick Lachat on 1/19/11.
//  Copyright 2011 http://www.xmedia.ch. All rights reserved.
//

#import "XMEncryptionHMACMD5.h"
#import <CommonCrypto/CommonHMAC.h>
#import "NSData+Base64.h"

@implementation XMEncryptionHMACMD5

+ (NSString*)encrypt:(NSString*)key secretDataString:(NSString*)data {
    
	const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
	const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];
    
	unsigned char cHMAC[CC_MD5_DIGEST_LENGTH];
    
	CCHmac(kCCHmacAlgMD5, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
	NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC
										  length:sizeof(cHMAC)];
    
	NSString *encrypted = [HMAC base64EncodedString];
    
	return encrypted;
}

@end