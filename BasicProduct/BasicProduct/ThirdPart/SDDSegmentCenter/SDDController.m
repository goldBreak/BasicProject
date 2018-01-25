//
//  SDDController.m
//  products
//
//  Created by xsd on 2017/12/13.
//  Copyright © 2017年 com.shuxuan.fwex. All rights reserved.
//

#import "SDDController.h"
#import "SegmentControl.h"
#import "UIColor+UIColor.h"

@interface SDDController()
<
    UIPageViewControllerDelegate,
    UIPageViewControllerDataSource,
    UIScrollViewDelegate,
    segmentDidAct
>

//滑动信息
@property (nonatomic, strong) SegmentControl *segmentControl;
@property (nonatomic, strong) UIPageViewController *controller;

@property (nonatomic, assign) CGRect lastFrame;
@property (nonatomic, assign) CGPoint startOffsetPoint;

//控制信息
@property (nonatomic, assign) BOOL animationed;

@end

@implementation SDDController

#pragma mark - control

- (void)initUI {
    //----- 顶头控制信息 -----
    self.segmentControl.defaultColor = self.defaultColor;
    self.segmentControl.hilightColor = self.hilightColor;
    self.segmentControl.shaderLineColor = self.shaderLineColor;
    self.segmentControl.segmentFont = self.segmentFont;
    self.segmentControl.hightLightFont = self.hightLightFont;
    self.segmentControl.blankSpace = self.blankSpace;
    if (_segmentWidth) {
        self.segmentControl.segmentWidth = _segmentWidth;
    } else {
        self.segmentControl.segmentWidth = kScreenWidth / 2.;
    }
    self.segmentControl.titleArray = self.titleArray;
    [self.segmentControl addSubview:self.shaderLine];
    [self.bigViewController.view addSubview:self.segmentControl];
    
    //----- 下面滑动页面 ------
    _controller = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    _controller.delegate = self;
    _controller.dataSource = self;
    [_controller setViewControllers:@[self.childVCArray[0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    CGRect frame = self.bigViewController.view.frame;
    frame.origin.y = CGRectGetMaxY(self.segmentControl.frame);
    frame.size.height = frame.size.height - frame.origin.y;
    _controller.view.frame = frame;
    
    //----------  获取scrollView的delegate --------
    for (UIView *subView in self.controller.view.subviews) {
        //!--subViews
        if ([subView isKindOfClass:[UIScrollView class]]) {
            [(UIScrollView *)subView setDelegate:self];
        }
    }
    
    //---------- 添加到控制页面上面 --------------
    [self.bigViewController addChildViewController:_controller];
    [self.bigViewController.view addSubview:self.controller.view];
    
    //----------  初始化状态 -----------
    self.shaderLine.backgroundColor = self.shaderLineColor;
    [self.segmentControl setSelectedIndex:0];
    [self segmentAction:-1];
}

#pragma mark - setting & getting
- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
}

- (UIView *)shaderLine {
    if (!_shaderLine) {
        _shaderLine = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.segmentControl.frame) - self.shaderLineHight, 100.0, self.shaderLineHight)];
    }
    return _shaderLine;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
  
    if (!_animationed) {
        return;
    }
    //按照目前的状态走起来！
    double progress = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (progress == 1) {
        //恢复了状态，这个时候不能走流程！
        return;
    }
    if (progress < 1) {
        
        if (self.fromIndex == 0) {
            return;
        }
    } else if(progress > 1) {
        if (self.fromIndex == self.childVCArray.count - 1) {
            return;
        }
    }
    [self addAnimationProgress:progress];
}

- (void)addAnimationProgress:(CGFloat)progress {
    //表示向右
    CGFloat tarGetProgress = progress - 1.0;
    
    //---------- 获取初始状态
    CGRect originFrame = self.shaderLine.frame;
    originFrame.origin.x = [self.segmentControl getIndexButtonOriginX:(int)self.fromIndex];
    originFrame.size.width = [self.segmentControl getWidthButtonAtIndex:(int)self.fromIndex];
    
    //---------- 获取目标状态增量
    CGFloat targetWidth = [self.segmentControl getWidthButtonAtIndex:(int)self.targetIndex];
    CGFloat offsetWidth = (targetWidth - originFrame.size.width) * fabs(tarGetProgress);
    CGFloat width = originFrame.size.width + offsetWidth;
    
    //---------- 目标状态
    if (progress > 1) {
        originFrame.origin.x += originFrame.size.width * tarGetProgress;
    } else {
        originFrame.origin.x += targetWidth * tarGetProgress;
    }
    
    originFrame.size.width = width;
    
    self.shaderLine.frame = originFrame;
    
    //颜色！
    UIColor *currentColor = [self setColorValue:self.hilightColor processColor:self.defaultColor progress:tarGetProgress];
    UIColor *targetColor = [self setColorValue:self.defaultColor processColor:self.hilightColor progress:tarGetProgress];
    
    [self.segmentControl setIndex:self.fromIndex color:currentColor];
    [self.segmentControl setIndex:self.targetIndex color:targetColor];
}

- (void)setTargetStatue {
    
    CGRect targetFrame = self.shaderLine.frame;
    targetFrame.origin.x = [self.segmentControl getIndexButtonOriginX:(int)self.targetIndex];
    targetFrame.size.width = [self.segmentControl getWidthButtonAtIndex:(int)self.targetIndex];
    [UIView animateWithDuration:0.1 animations:^{
        self.shaderLine.frame = targetFrame;
    }];
}

#pragma mark - segmentDidAct
- (void)segmentAction:(int)tag {
    if (self.fromIndex == tag) {
        return;
    }
    _animationed = NO;
    if (tag == -1) {
        tag = 0;
    }
    [self.segmentControl setSelectedIndex:tag];
    //!--,--!
    UIPageViewControllerNavigationDirection direct = 0;
    if (self.fromIndex < tag) {
        direct = UIPageViewControllerNavigationDirectionForward;
    } else {
        direct = UIPageViewControllerNavigationDirectionReverse;
    }
    
    __weak __typeof(self) weakSelf = self;
    [self.controller setViewControllers:@[self.childVCArray[tag]] direction:direct animated:YES completion:^(BOOL finished) {
        weakSelf.fromIndex = tag;
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        CGRect frame = self.shaderLine.frame;
        frame.origin.x = [self.segmentControl getIndexButtonOriginX:tag];
        frame.size.width = [self.segmentControl getWidthButtonAtIndex:tag];
        self.shaderLine.frame = frame;
    }];
    
    if ([self.delegate respondsToSelector:@selector(segmentControl:)]) {
        [self.delegate segmentControl:tag];
    }
}

#pragma mark - UIPageViewControllerDelegate,UIPageViewControllerDataSource
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    //
    NSInteger index = [self.childVCArray indexOfObject:viewController];
    if (index > 0) {
        return self.childVCArray[index-1];
    }
    return nil;
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.childVCArray indexOfObject:viewController];
    if (index + 1 < self.childVCArray.count) {
        return self.childVCArray[index+1];
    }
    return nil;
}


- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    //
    self.targetIndex = [self.childVCArray indexOfObject:[[pageViewController viewControllers] firstObject]];
    self.fromIndex = [self.childVCArray indexOfObject:[previousViewControllers firstObject]];
    
    //
    if (completed) {
        //没有完成转场动作，恢复
        [self setTargetStatue];
        self.fromIndex = self.targetIndex;
    }
    //配置最终结果
    [self.segmentControl setSelectedIndex:self.targetIndex];
    
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    _animationed = YES;
    //向着目标VC运行！
    self.targetIndex = [self.childVCArray indexOfObject:[pendingViewControllers firstObject]];

}


#pragma mark - inline method
- (UIColor *)setColorValue:(UIColor *)defaultColor processColor:(UIColor *)processColor progress:(CGFloat)progress {
    
    progress = fabs(progress);
    //获取新的RGB
    float rValue = defaultColor.red + (processColor.red - defaultColor.red)*progress ;
    float gValue = defaultColor.green + (processColor.green - defaultColor.green)*progress;
    float bValue = defaultColor.blue + (processColor.blue - defaultColor.blue)*progress;
    float aValue = defaultColor.alpha + (processColor.alpha - defaultColor.alpha)*progress;
    
    UIColor *color = [UIColor colorWithRed:rValue green:gValue blue:bValue alpha:aValue];
    
    return color;
}

- (SegmentControl *)segmentControl {
    
    if (!_segmentControl) {
        _segmentControl = [[SegmentControl alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
        _segmentControl.segDelegate = self;
    }
    return _segmentControl;
}

@end
