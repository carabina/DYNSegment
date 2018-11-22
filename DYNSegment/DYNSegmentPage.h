//
//  DYNSegmentView.h
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/28.
//  Copyright © 2018年 devyuan. All rights reserved.
//
// 0.0.2
// 2018.11.18
// 代码初版完成
// 0.0.3
// 2018.11.22
// 修改初始化方法
#define DYNSegmentPageVersion @"0.0.3"

#import <UIKit/UIKit.h>
#import "DYNViewProtocol.h"
#import "DYNSegmentItem.h"

@class DYNSegmentPage;

@protocol DYNSegmentPageDelegate

/**
 定义要显示的页面，滑动或点击 index 位置时显示

 @param index 位置
 @return 要显示的页面
 */
- (UIViewController*)dynSegmentPageAtIndex:(NSInteger)index;

@end


/**
 自定义的可滑动的标签页；
 此标签页包含标签和页面；
 */
@interface DYNSegmentPage : UIView <DYNViewProtocol>

/// 定义标签的高度，默认 50
@property (nonatomic, assign) CGFloat segmentHeight;
/// 定义标签的背景颜色，默认白色
@property (nonatomic, strong) UIColor *segmentColor;
/// 定义标签的标志颜色，默认红色
@property (nonatomic, strong) UIColor *flagColor;
/// 当前标签页
@property (nonatomic, assign) NSInteger currentItemIndex;

- (instancetype)initWithFrame:(CGRect)frame items:(NSArray<DYNSegmentItem*> *)items delegate:(id<DYNSegmentPageDelegate>)delegate;

@end
