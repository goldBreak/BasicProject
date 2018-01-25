//
//  ValidationUtils.h
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidationUtils : NSObject
/**
 *  手机号验证
 *
 *  @param phone 验证的手机号
 *
 *  @return 如果手机号不正常，则返回错误描述，反之返回nil
 */
+ (NSString *)checkPhone:(NSString *)phone;

/**
 *  短信验证码验证
 *
 *  @param smsCode 验证码
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkSmsCode:(NSString *)smsCode;

/**
 *  银行短信验证码验证
 *
 *  @param smsCode 验证码
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkBankSmsCode:(NSString *)smsCode;

/**
 *  密码规则验证
 *
 *  @param password
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkPassword:(NSString *)password;

/**
 *  密码验证
 *
 *  @param password
 *  @param confirmPwd   确认密码
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkPassword:(NSString *)password andConfirmPwd:(NSString *)confirmPwd;

/**
 *  银行卡卡号验证
 *
 *  @param cardNo 银行卡卡号
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkBankCardNo:(NSString *)cardNo;

/**
 *  身份证号码验证
 *
 *  @param idNo 身份证号码
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkIdNo:(NSString *)idNo;

/**
 *  身份证号码后六位验证
 *
 *  @param lastSixIdNo 后六位身份证号码
 *
 *  @return
 */
+ (NSString *)checkLastSixIdNo:(NSString *)lastSixIdNo;

/**
 *  姓名验证
 *
 *  @param userName 姓名
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkUserName:(NSString *)userName;

/**
 *  昵称验证
 *
 *  @param nickName 昵称
 *
 *  @return 正确返回nil，异常返回错误描述
 */
+ (NSString *)checkNickName:(NSString *)nickName;
@end
