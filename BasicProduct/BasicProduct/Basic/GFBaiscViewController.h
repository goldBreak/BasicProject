//
//  GFBaiscViewController.h
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+ViewController.h"

@interface GFBaiscViewController : UIViewController

//检验登录
- (void)checkLoginPush:(UIViewController *)viewController animated:(BOOL)animated;

//返回上一页面时需要do something 请重写该方法
- (void)doBack;


@end
