//
//  DYNSegmentItem.h
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/31.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 定义标签的样式
 */
@interface DYNSegmentItem : NSObject

/// 标题文字
@property (nonatomic, copy) NSString *title;
/// 标题字体
@property (nonatomic, strong) UIFont *titleFont;
/// 标题颜色
@property (nonatomic, strong) UIColor *titleColor;
/// 标签背景颜色
@property (nonatomic, strong) UIColor *backgroundColor;

@end
