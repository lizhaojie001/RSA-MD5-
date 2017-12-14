//
//  QDRSAHandler.h
//  MDMSDK
//
//  Created by thundersoft on 2017/11/6.
//  Copyright © 2017年 Quarkdata. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, KeyType) {
    KeyTypePublic = 0,
    KeyTypePrivate,
};

@interface QDRSAHandler : NSObject

+ (instancetype)shareRSAHandler;

- (BOOL)importKeyWithType:(KeyType)type andPath:(NSString*)path;
- (BOOL)importKeyWithType:(KeyType)type andkeyString:(NSString *)keyString;

//验证签名 Sha1 + RSA
- (BOOL)verifyString:(NSString *)string withSign:(NSString *)signString;
//验证签名 md5 + RSA
- (BOOL)verifyMD5String:(NSString *)string withSign:(NSString *)signString;

- (NSString *)signString:(NSString *)string;

- (NSString *)signMD5String:(NSString *)string;


- (NSString *) encryptWithPublicKey:(NSString*)content;
- (NSString *) decryptWithPrivatecKey:(NSString*)content;

@end
