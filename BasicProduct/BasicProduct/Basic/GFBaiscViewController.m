//
//  GFBaiscViewController.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "GFBaiscViewController.h"


@interface GFBaiscViewController ()

@end

@implementation GFBaiscViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//检验登录
- (void)checkLoginPush:(UIViewController *)viewController animated:(BOOL)animated {
    
}

//返回上一页面时需要do something 请重写该方法
- (void)doBack {
    
}



#pragma mark - cyc life
- (void)dealloc {
    
    NSLog(@"dealloced- VC name is = %@",[self class]);
}

@end
