//
//  UIView+UIView.h
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView)


/**
 返回view的宽度

 @return 宽度
 */
- (CGFloat) width;


/**
 返回view的高度

 @return 高度
 */
- (CGFloat) height;


/**
 返回view的最小的x

 @return origin.x
 */
- (CGFloat) minX;


/**
 返回view的最小的y

 @return origin.y
 */
- (CGFloat) minY;


/**
 返回view的最大的x

 @return origin.x+size.width
 */
- (CGFloat) maxX;


/**
 返回view的最大的y

 @return origin.y + size.height
 */
- (CGFloat) maxY;


@end
