//
//  NSString+Wrapper.h

//  Copyright (c)All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Wrapper)

/**
 *  验证字符串是否为空
 *
 *  @return true/false
 */
- (BOOL) isNullOrEmpty;

/**
 *  验证字符串是否为字符串空
 *
 *  @return bool
 */
- (BOOL) isEmpty;

/**
 *  验证字符串是否为NULL
 *
 *  @return bool
 */
- (BOOL) isNULL;

/**
 *  移除字符串首尾空格
 *
 *  @return 移除首尾空格后的字符串
 */
- (NSString *) trim;

/**
 *  替换原字符串
 *
 *  @param origin      原字符串
 *  @param replacement 替换的字符串
 *
 *  @return 替换后的字符串
 */
- (NSString *) replaceAll:(NSString*)origin with:(NSString*)replacement;

/**
 *  按指定字符分割字符串
 *
 *  @param separator 指定字符串
 *
 *  @return array
 */
- (NSArray *) split:(NSString*) separator;

- (NSString *) toLowerCase;

- (NSString *) toUpperCase;

- (BOOL) equals:(NSString*) anotherString;

- (NSString *) substringFromIndex:(int)beginIndex toIndex:(int)endIndex;

//手机号码中间4位打星号 ****
- (NSString *)handlePhoneNumber;


/**
 字符串 隔着blank个字符串
 
 @param kidString 要加的数据
 @param blank 数
 @param dir 0默认的，是从右边开始，1是从左边
 @return 替换后的字符串
 */
- (NSString *)kidStr:(NSString *)kidString blank:(int)blank dir:(int)dir;


@end
