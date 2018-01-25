//
//  ValidationUtils.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "ValidationUtils.h"


//验证手机号
static NSString * const REGX_PHONE = @"^(1[3-9][0-9]{9})";
//验证登录密码
static NSString * const REGX_LOGINPWD = @"(?=.*[0-9])(?=.*[a-zA-Z])(?!=.*[^a-zA-Z0-9]).{6,20}";
//身份证校验
static NSString * const REGX_IDENTITYCARD = @"^(\\d{6})(19|20)?(\\d{2})([01]\\d)([0123]\\d)(\\d{3})(\\d|[Xx])?$";
//身份证后六位校验
static NSString * const REGX_LASTSIXIDCARD = @"^[0-9]{5}[0-9xX]{1}$";
//姓名校验
static NSString * const REGX_USERNAME = @"^[\u4e00-\u9fa5]+$";
//中英文混合校验
static NSString * const REGX_NICKNAME_ZY = @"^[\u4e00-\u9fa5a-zA-Z0-9]+$";
//借记银行卡卡号校验
static NSString * const REGX_BANKCARDNO_JJ = @"^(\\d{16}|\\d{19})$";
//信用卡卡号位数校验
static NSString * const REGX_BANKCARDNO_XY = @"^(\\d{15}|\\d{16})$";
//昵称格式校验
static NSString * const REGX_NICKNAME = @"(?=.*[\u4e00-\u9fa5])(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[a-zA-Z0-9])(?=.*[-_])";

@implementation ValidationUtils

+ (NSString *)checkPhone:(NSString *)phone {
    
    if ([StringUtils isNullOrEmpty:phone]) {
        return @"请输入手机号码";
    }
    
    if (![StringUtils verifyString:phone regx:REGX_PHONE]) {
        return @"手机号码有误";
    }
    
    return nil;
}

+ (NSString *)checkSmsCode:(NSString *)smsCode {
    if ([StringUtils isNullOrEmpty:smsCode]) {
        return @"请填写手机动态码";
    }
    
    if (smsCode.length != 4) {
        return @"手机验证码是4位数字";
    }
    return nil;
}

+ (NSString *)checkBankSmsCode:(NSString *)smsCode {
    if ([StringUtils isNullOrEmpty:smsCode]) {
        return @"请填写手机动态码";
    }
    
    if (smsCode.length != 6) {
        return @"手机验证码是6位数字";
    }
    return nil;
}

+ (NSString *)checkPassword:(NSString *)password {
    if ([StringUtils isNullOrEmpty:password]) {
        return @"请输入密码";
    }
    
    if (password.length < 8 || password.length > 20) {
        return @"密码长度为8-20位";
    }
    
    BOOL isCharacter = [StringUtils isIncludeCharacter:password];
    BOOL isNum       = [StringUtils isIncludeNum:password];
    BOOL isSpecial   = [StringUtils isIncludeSpecialCharacter:password];
    
    if ((!isCharacter && !isNum) || (!isCharacter && !isSpecial) || (!isSpecial && !isNum) || (!isCharacter && !isNum && !isSpecial)) {
        return @"密码请包含字母、数字或特殊字符的组合";
    }
    
    return nil;
}

+ (NSString *)checkPassword:(NSString *)password andConfirmPwd:(NSString *)confirmPwd {
    
    if ([StringUtils isNullOrEmpty:confirmPwd]) {
        return @"确认密码不能为空";
    }
    
    if (![password equals:confirmPwd]) {
        return @"确认密码有误";
    }
    
    return nil;
}

+ (NSString *)checkBankCardNo:(NSString *)cardNo {
    
    if ([StringUtils isNullOrEmpty:cardNo]) {
        return @"请填写银行卡号";
    }
    
    if (![StringUtils verifyString:cardNo regx:REGX_BANKCARDNO_JJ]) {
        return @"请输入16-19位银行卡号";
    }
    return nil;
}

+ (NSString *)checkIdNo:(NSString *)idNo {
    
    if ([StringUtils isNullOrEmpty:idNo]) {
        return @"请填写身份证号码";
    }
    
    if (![StringUtils verifyString:idNo regx:REGX_IDENTITYCARD]) {
        return @"身份证信息有误";
    }
    return nil;
}

+ (NSString *)checkLastSixIdNo:(NSString *)lastSixIdNo {
    
    if ([StringUtils isNullOrEmpty:lastSixIdNo]) {
        return @"身份证号码不能为空";
    }
    
    if (![StringUtils verifyString:lastSixIdNo regx:REGX_LASTSIXIDCARD]) {
        return @"身份证号信息有误";
    }
    return nil;
}

+ (NSString *)checkUserName:(NSString *)userName {
    
    if ([StringUtils isNullOrEmpty:userName]) {
        return @"请填写姓名";
    }
    
    if (userName.length < 2) {
        return @"请输入不小于2位的汉字";
    }
    
    if (userName.length > 5) {
        return @"姓名不能超过5个汉字";
    }
    return nil;
}

+ (NSString *)checkNickName:(NSString *)nickName {
    
    if ([StringUtils isNullOrEmpty:nickName]) {
        return @"昵称不能为空";
    }
    
    int strLength = [StringUtils getStringLength:nickName];
    NSLog(@"设置的昵称长度为：%i", strLength);
    if (strLength > 16) {
        return @"支持输入1-16个字符的中文、英文、数字和特殊字符";
    }
    
    return nil;
}

@end
