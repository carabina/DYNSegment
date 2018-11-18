//
//  DYNSegmentView.h
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/28.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYNViewProtocol.h"
#import "DYNSegmentItem.h"

@class DYNSegmentPage;

@protocol DYNSegmentViewDelegate

/**
 定义滑动到 index 位置时要显示的页面

 @param index 位置
 @return 要显示的页面
 */
- (UIViewController*)dynSegmentPageAtIndex:(NSInteger)index;

@end

@interface DYNSegmentPage : UIView <DYNViewProtocol>

/// 
@property (nonatomic, assign) CGFloat segmentHeight;
@property (nonatomic, strong) UIColor *segmentColor;
@property (nonatomic, strong) UIColor *flagColor;
@property (nonatomic, weak) id<DYNSegmentViewDelegate> delegate;
@property (nonatomic, copy) NSArray<DYNSegmentItem*> *items;
@property (nonatomic, assign) NSInteger currentItemIndex;

@end
