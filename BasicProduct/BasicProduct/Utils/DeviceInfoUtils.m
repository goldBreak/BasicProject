//
//  DeviceInfoUtils.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "DeviceInfoUtils.h"

#import <sys/utsname.h>

const char* jailbreak_tool_pathes[] = {
    "/Applications/Cydia.app",
    "/Library/MobileSubstrate/MobileSubstrate.dylib",
    "/bin/bash",
    "/usr/sbin/sshd",
    "/etc/apt"
};
#define ARRAY_SIZE(a) sizeof(a)/sizeof(a[0])

@implementation DeviceInfoUtils
#pragma mark - 获取UUID
+ (NSString *)randomUUIDdString
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString *)uuid_string_ref];
    CFRelease(uuid_ref);
    CFRelease(uuid_string_ref);
    return [uuid lowercaseString];
}

#pragma mark - 获取UUID
+ (NSString *)UUIDString
{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

#pragma mark - 获取设备系统版本
+ (float)systemVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

+ (NSString *)systemVersionStr
{
    return [[UIDevice currentDevice] systemVersion];
}

#pragma mark - 应用版本号
+ (NSString *)appVersion
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

#pragma mark - 应用Bundle
+ (NSString *)bundleVersion
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return version;
}

#pragma mark - 版本更新
+ (BOOL)ifNeedUpdateWithCurrentVersion:(NSString *)cVersion
{
    
    return NO;
}

+ (NSString*) getVersionFromAppstore {
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://itunes.apple.com/lookup?id=1125869444"]];
    [request setHTTPMethod:@"post"];
    NSHTTPURLResponse *urlResponse = nil;
    NSError *error = nil;
    NSData *recervedData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *results = [[NSString alloc] initWithBytes:[recervedData bytes] length:[recervedData length] encoding:NSUTF8StringEncoding];
    NSData* pData = [results dataUsingEncoding: NSUTF8StringEncoding];
    NSError *pError;
    
    id iObject = [NSJSONSerialization JSONObjectWithData:pData options:NSJSONReadingMutableContainers error:&pError];
    
    NSDictionary *dic = iObject;
    
    NSArray *infoArray = [dic objectForKey:@"results"];
    if (infoArray && infoArray.count > 0) {
        NSDictionary *releaseInfo = [infoArray objectAtIndex:0];
        NSString *lastVersion = [releaseInfo objectForKey:@"version"];
        return lastVersion;
    }
    return @"";
}

+ (BOOL)isiPhoneX {
    
    return NO;
}

#pragma mark - 判断设备真机类型
+ (BOOL)deviceIsRealEquipment
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString * platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"iPhone1,1"] || [platform isEqualToString:@"iPhone1,2"] || [platform isEqualToString:@"iPhone2,1"] || [platform isEqualToString:@"iPhone3,1"] || [platform isEqualToString:@"iPhone3,2"] || [platform isEqualToString:@"iPhone3,3"] || [platform isEqualToString:@"iPhone4,1"] || [platform isEqualToString:@"iPhone5,1"] || [platform isEqualToString:@"iPhone5,2"] || [platform isEqualToString:@"iPhone5,3"] || [platform isEqualToString:@"iPhone5,4"] || [platform isEqualToString:@"iPhone6,1"] || [platform isEqualToString:@"iPhone6,2"] || [platform isEqualToString:@"iPhone7,1"] || [platform isEqualToString:@"iPhone7,2"] || [platform isEqualToString:@"iPhone8,1"] || [platform isEqualToString:@"iPhone8,2"] || [platform isEqualToString:@"iPhone8,3"] || [platform isEqualToString:@"iPhone8,4"] || [platform isEqualToString:@"iPhone9,1"] ||
        [platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,5"] ||
        [platform isEqualToString:@"iPhone10,2"] || [platform isEqualToString:@"iPhone10,4"] ||
        [platform isEqualToString:@"iPhone9,2"] || [platform isEqualToString:@"iPod1,1"] || [platform isEqualToString:@"iPod2,1"] || [platform isEqualToString:@"iPod3,1"] || [platform isEqualToString:@"iPod4,1"] || [platform isEqualToString:@"iPod5,1"] || [platform isEqualToString:@"iPod7,1"] || [platform isEqualToString:@"iPad1,1"] || [platform isEqualToString:@"iPad1,2"] || [platform isEqualToString:@"iPad2,1"] || [platform isEqualToString:@"iPad2,2"] || [platform isEqualToString:@"iPad2,3"] || [platform isEqualToString:@"iPad2,4"] || [platform isEqualToString:@"iPad2,5"] || [platform isEqualToString:@"iPad2,6"] || [platform isEqualToString:@"iPad2,7"] || [platform isEqualToString:@"iPad3,1"] || [platform isEqualToString:@"iPad3,2"] || [platform isEqualToString:@"iPad3,3"] || [platform isEqualToString:@"iPad3,4"] || [platform isEqualToString:@"iPad3,5"] || [platform isEqualToString:@"iPad3,6"] || [platform isEqualToString:@"iPad4,1"] || [platform isEqualToString:@"iPad4,2"] || [platform isEqualToString:@"iPad4,3"] || [platform isEqualToString:@"iPad4,4"] || [platform isEqualToString:@"iPad4,5"] || [platform isEqualToString:@"iPad4,6"] || [platform isEqualToString:@"iPad4,7"] || [platform isEqualToString:@"iPad4,8"] || [platform isEqualToString:@"iPad4,9"] || [platform isEqualToString:@"iPad5,1"] || [platform isEqualToString:@"iPad5,2"] || [platform isEqualToString:@"iPad5,3"] || [platform isEqualToString:@"iPad5,4"] || [platform isEqualToString:@"iPad6,3"] || [platform isEqualToString:@"iPad6,4"] || [platform isEqualToString:@"iPad6,7"] || [platform isEqualToString:@"iPad6,8"] || [platform isEqualToString:@"AppleTV2,1"] || [platform isEqualToString:@"AppleTV3,1"] || [platform isEqualToString:@"AppleTV3,2"]) {
        return YES;
    }
    return NO;
}

#pragma mark - 判断设备是否被越狱
+ (BOOL)isJailBreak
{
    for (int i=0; i<ARRAY_SIZE(jailbreak_tool_pathes); i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:jailbreak_tool_pathes[i]]]) {
            NSLog(@"The device is jail broken!");
            return YES;
        }
    }
    
    return NO;
}
@end
