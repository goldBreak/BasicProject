//
//  SegmentControl.m
//  products
//
//  Created by xsd on 2017/12/13.
//  Copyright © 2017年 com.shuxuan.fwex. All rights reserved.
//

#import "SegmentControl.h"

#define basicTag 100

@interface SegmentControl()

@property (nonatomic, strong) NSMutableArray *segmentArray;
@property (nonatomic, strong) SegmentCell *lastCell;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation SegmentControl

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.bottomLine];
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray {
    
    _titleArray = titleArray;
    CGFloat autoX = 0.0;
    CGFloat height = self.frame.size.height;
    
    for (int i = 0; i < titleArray.count; i ++) {
        
        SegmentCell *cell = [SegmentCell buttonWithType:UIButtonTypeCustom];//
        
        [cell initWithOriginX:autoX title:titleArray[i] font:self.segmentFont height:height defaultColor:self.defaultColor selectColor:self.hilightColor];
        cell.tag = basicTag + i;
        cell.width = _segmentWidth;
        [cell addTarget:self action:@selector(indexAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cell];
        autoX += cell.frame.size.width;
        [self.segmentArray addObject:cell];
    }
    
    CGSize size = self.frame.size;
    
    size.width = CGRectGetMaxX([[self.segmentArray lastObject] frame]);
    
    self.contentSize = size;
}

- (CGFloat)getIndexButtonOriginX:(int)index {
    
    UIButton *button = self.segmentArray[index];
    return CGRectGetMinX(button.frame);
}

- (CGFloat)getWidthButtonAtIndex:(int)index {
    UIButton *button = self.segmentArray[index];
    return CGRectGetWidth(button.frame);
}


- (void)indexAction:(UIButton *)sender {
    if (sender.selected) {
        return;
    }
    self.lastCell.selected = NO;
   
    sender.selected = !sender.selected;
    
    self.lastCell = (SegmentCell *)sender;
    
    [self scrollRectToVisible:sender.frame animated:YES];
    
    if ([self.segDelegate respondsToSelector:@selector(segmentAction:)]) {
        [self.segDelegate segmentAction:(int)sender.tag - basicTag];
    }
}

- (void)setSelectedIndex:(NSInteger)index {
    
    if (self.lastCell) {
        self.lastCell.selected = NO;
    }
    [self.lastCell setTitleColor:self.defaultColor forState:UIControlStateNormal];
    [self.lastCell setTitleColor:self.hilightColor forState:UIControlStateSelected];
    
    SegmentCell *button = [self viewWithTag:index + basicTag];
    self.lastCell = button;
    
    [self.lastCell setTitleColor:self.defaultColor forState:UIControlStateNormal];
    [self.lastCell setTitleColor:self.hilightColor forState:UIControlStateSelected];
    
    self.lastCell.selected = YES;
    
}

- (void)setIndex:(NSInteger)index color:(UIColor *)color {
   
    SegmentCell *button = [self viewWithTag:index + basicTag];
    button.selected = NO;
    [button setTitleColor:color forState:UIControlStateNormal];
}

#pragma mark - lazy
- (NSMutableArray *)segmentArray {
    
    if (!_segmentArray) {
        _segmentArray = [NSMutableArray array];
    }
    return _segmentArray;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        
        CGRect frame = self.bounds;
        frame.origin.y = frame.size.height - 0.5;
        frame.size.height = 0.5;
        _bottomLine = [[UIView alloc] initWithFrame:frame];
        _bottomLine.backgroundColor = [UIColor blackColor];
    }
    return _bottomLine;
}
@end
