//
//  GFBasicViewController.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "GFBasicTabViewController.h"
#import "GFTabBar.h"

//可以设置凸按钮，
@interface GFBasicTabViewController ()<UITabBarControllerDelegate>

@end

@implementation GFBasicTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.delegate = self;
    
    
    //利用KVC 将自己的tabbar赋给系统tabBar
    //[self setValue: forKeyPath:@"tabBar"];
    
    
}

#pragma mark - 工厂式设置tab
- (void)addChildrenViewController:(UIViewController *)childVC andTitle:(NSString *)title andImageName:(NSString *)imageName andSelectImage:(NSString *)selectedImage{
    
    childVC.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectedImg = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = selectedImg;
    
    childVC.title = title;
    
    UINavigationController *baseNav = [[UINavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:baseNav];
}

@end
