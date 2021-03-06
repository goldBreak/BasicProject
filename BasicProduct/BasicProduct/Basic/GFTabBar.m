//
//  GFTabBar.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "GFTabBar.h"

@implementation GFTabBar


- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self initView];
        
    }
    return self;
}

- (void)initView {
    
    _centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //设置中心按钮！，图片
    UIImage *normalImage = [UIImage imageNamed:@"tab_loan_pre"];
    _centerBtn.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [_centerBtn setImage:normalImage forState:UIControlStateNormal];
    
    //去除选择时高亮
    _centerBtn.adjustsImageWhenHighlighted = NO;
    
    //根据图片调整button的位置(图片中心在tabbar的中间最上部，这个时候由于按钮是有一部分超出tabbar的，所以点击无效，要进行处理)
    _centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImage.size.width) / 2.0, - normalImage.size.height / 2.0, normalImage.size.width, normalImage.size.height);
    
    [self addSubview:_centerBtn];
}

//处理超出区域点击无效的问题,
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        //转换坐标
        CGPoint tempPoint = [self.centerBtn convertPoint:point fromView:self];
        //判断点击的点是否在按钮区域内
        if (CGRectContainsPoint(self.centerBtn.bounds, tempPoint)) {
            //返回按钮
            return _centerBtn;
        }
    }
    return view;
}

@end
