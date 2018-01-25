//
//  UIViewController+ViewController.h
//  BasicProduct
//
//  Created by xsd on 2018/1/25.
//  Copyright © 2018年 com.GF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ViewController)

/**
 alert 弹出框
 
 @param title 标题
 @param content 内容
 @param btnLists 按钮数组
 @param actions 对应的操作方法
 */
- (void)showAlertWithTitle:(NSString *)title
                   content:(NSString *)content
                   btnList:(NSArray *)btnLists
                   actions:(NSArray *)actions;


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
                 cancleAct:(void(^)(UIAlertAction *action))handle;


/**
 一个按钮弹出框
 
 @param content 内容
 @param cancleBtn 按钮标题
 @param handle 对应的操作方法
 */
- (void)showAlertWithcontent:(NSString *)content
                   cancleBtn:(NSString *)cancleBtn
                   cancleAct:(void(^)(UIAlertAction *action))handle;


/**
 一个按钮弹出框
 
 @param content 内容
 @param cancleBtn 按钮标题
 */
- (void)showAlertWithcontent:(NSString *)content
                   cancleBtn:(NSString *)cancleBtn;


//错误消息提示框
- (void)showToastWithMessage:(NSString *)message;

//TODO: 隐藏菊花
- (void)hideProgress;

//TODO: 显示菊花
- (void)showProgress;

@end
