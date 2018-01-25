//
//  UIView+UIView.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "UIView+UIView.h"

@implementation UIView (UIView)

- (CGFloat) width {
    return CGRectGetWidth(self.frame);
}

- (CGFloat) height {
    return CGRectGetHeight(self.frame);
}

- (CGFloat) minX {
    return CGRectGetMinX(self.frame);
}

- (CGFloat) minY {
    return CGRectGetMinY(self.frame);
}

- (CGFloat) maxX {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat) maxY {
    return CGRectGetMaxY(self.frame);
}

@end
