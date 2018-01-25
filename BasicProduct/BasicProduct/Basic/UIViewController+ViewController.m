//
//  UIViewController+ViewController.m
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import "UIViewController+ViewController.h"
#import <MBProgressHUD.h>
#import "CustomAlertView.h"

@implementation UIViewController (ViewController)

- (void)showAlertWithTitle:(NSString *)title
                   content:(NSString *)content
                   btnList:(NSArray *)btnLists
                   actions:(NSArray *)actions {
    
    UIAlertController *actionVC = [UIAlertController alertControllerWithTitle:title message:content preferredStyle:UIAlertControllerStyleAlert];
    
    //cancleBtn
    UIAlertAction *cancleAction;//
    int index = 0;
    if (btnLists.count == actions.count) {
        index = 1;
        cancleAction = [UIAlertAction actionWithTitle:btnLists[0] style:UIAlertActionStyleCancel handler:actions[0]];
    } else {
        index = 0;
        cancleAction = [UIAlertAction actionWithTitle:btnLists[0] style:UIAlertActionStyleCancel handler:nil];
    }
    
    [actionVC addAction:cancleAction];
    
    for (int i = 1; i < btnLists.count; i ++,index ++) {
        //
        UIAlertAction *tempAction = [UIAlertAction actionWithTitle:btnLists[i] style:UIAlertActionStyleDefault handler:actions[index]];
        [actionVC addAction:tempAction];
    }
    
    [self presentViewController:actionVC animated:YES completion:nil];
    
}

/**
 一个按钮弹出框
 
 @param title 标题
 @param content 内容
 @param cancleBtn 按钮标题
 @param handle 对应的操作方法
 */
- (void)showAlertWithTitle:(NSString *)title
                   content:(NSString *)content
                 cancleBtn:(NSString *)cancleBtn
                 cancleAct:(void(^)(UIAlertAction *action))handle {
    
    [self showAlertWithTitle:title content:content btnList:@[cancleBtn] actions:@[handle]];
}


/**
 一个按钮弹出框
 
 @param content 内容
 @param cancleBtn 按钮标题
 @param handle 对应的操作方法
 */
- (void)showAlertWithcontent:(NSString *)content
                   cancleBtn:(NSString *)cancleBtn
                   cancleAct:(void(^)(UIAlertAction *action))handle {
    
    [self showAlertWithTitle:@"温馨提示" content:content btnList:@[cancleBtn] actions:@[handle]];
}

/**
 一个按钮弹出框
 
 @param content 内容
 @param cancleBtn 按钮标题
 */
- (void)showAlertWithcontent:(NSString *)content
                   cancleBtn:(NSString *)cancleBtn {
    
    [self showAlertWithTitle:@"温馨提示" content:content btnList:@[cancleBtn] actions:nil];
}

//错误消息提示框
- (void)showToastWithMessage:(NSString *)message {
    CustomAlertView *alertView = [[CustomAlertView alloc] initWithToastMessage:message delegate:nil];
    [alertView showAlertViewOn:self.navigationController.view];
}

//TODO: 隐藏菊花
- (void)hideProgress {
    
    //关闭网络状态指示
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    // 所以需要隐藏所有的菊花！
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

//TODO: 显示菊花
- (void)showProgress {
    
    //开启网络状态指示
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    //显示菊花
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
@end
