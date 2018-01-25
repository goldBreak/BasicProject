//
//  NSString+Wrapper.m
//  Copyright (c)  All rights reserved.
//

#import "NSString+Wrapper.h"


@implementation NSString (Wrapper)

- (BOOL) isNullOrEmpty {
    
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if (self == nil || self == NULL || [self isEqualToString:@""]) {
        return YES;
    }
    if ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

- (BOOL) isEmpty {
    if (self == nil || [self length] == 0) {
        return YES;
    }
    return NO;
}

- (BOOL) isNULL {
    if ([self isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}


- (NSString *) trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *) replaceAll:(NSString*)origin with:(NSString*)replacement {
    return [self stringByReplacingOccurrencesOfString:origin withString:replacement];
}

- (NSArray *) split:(NSString*) separator {
    return [self componentsSeparatedByString:separator];
}

- (NSString *) toLowerCase {
    return [self lowercaseString];
}

- (NSString *) toUpperCase {
    return [self uppercaseString];
}

- (BOOL) equals:(NSString*) anotherString {
    return [self isEqualToString:anotherString];
}

- (NSString *) substringFromIndex:(int)beginIndex toIndex:(int)endIndex {
    if ([self isNullOrEmpty]) {
        return @"";
    }
    if (beginIndex >= endIndex) {
        return @"";
    }
    NSRange range = NSMakeRange(beginIndex, endIndex - beginIndex);
    return [self substringWithRange:range];
}

- (NSString *)handlePhoneNumber
{
    NSString * string = [NSString stringWithFormat:@"%@****%@",[self substringToIndex:3],[self substringFromIndex:7]];
    return string;
}


- (NSString *)kidStr:(NSString *)kidString blank:(int)blank dir:(int)dir {
    
    NSString *str = [self replaceAll:@" " with:@""];
    
    NSMutableString *mutableStr = [NSMutableString stringWithString:str];
    
    NSInteger length = [mutableStr length];
    
    NSInteger number = [mutableStr length] / blank;
    
    for (NSInteger i = 1; i <= number; i ++) {
        
        NSInteger temp = 0;
        if (dir == 1) {
            //
            temp = i * blank + i - 1;
        } else {
            temp = length - i * blank;
        }
        
        if (temp != 0) {
            [mutableStr insertString:kidString atIndex:temp];
        }
    }
    
    return mutableStr;
}

@end
