//
//  FileUtils.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "FileUtils.h"

@implementation FileUtils

+ (NSString *)getDocumentsDirectory {
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    return documentsPath;
}

+ (NSString *)getCacheDirectory {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    //    NSLog(@"getCacheDirectory: %@", cachePath);
    return cachePath;
}

+ (BOOL)cacheFileExists:(NSString *)fileName {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *cachePath = [[self getCacheDirectory] stringByAppendingPathComponent:fileName];
    return [fileManager fileExistsAtPath:cachePath];
}

+ (BOOL)removeFileAtPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    return [fileManager removeItemAtPath:filePath error:&error];
}
@end
