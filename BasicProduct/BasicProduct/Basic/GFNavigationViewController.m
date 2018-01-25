//
//  GFNavigationViewController.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "GFNavigationViewController.h"

@interface GFNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation GFNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.interactivePopGestureRecognizer.delegate = self;
    
    [self.navigationBar setTranslucent:NO];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    //关闭主界面的右滑返回
    if (self.viewControllers.count == 1){
        return NO;
    }else{
        return YES;
    }
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.viewControllers.count > 0) {
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    
    //在切换界面的过程中禁止滑动手势，避免界面卡死
    if ([viewController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    [super pushViewController:viewController animated:animated];
}
@end
