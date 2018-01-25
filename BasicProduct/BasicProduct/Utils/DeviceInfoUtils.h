//
//  DeviceInfoUtils.h
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceInfoUtils : NSObject

/**
 *  获取设备随机的UUID
 *
 *  @return uuid
 */
+ (NSString *)randomUUIDdString;

+ (NSString *)UUIDString;

/**
 *  获取设备系统版本号
 *
 *  @return 系统版本号
 */
+ (float)systemVersion;

+ (NSString *)systemVersionStr;

+ (NSString *)appVersion;

+ (NSString *)bundleVersion;

+ (NSString*) getVersionFromAppstore;

//是否越狱
+ (BOOL)deviceIsRealEquipment;


/**
 判断是否是iPhoneX
 
 @return 判断结果
 */
+ (BOOL)isiPhoneX;
@end
