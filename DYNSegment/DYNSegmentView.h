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

@class DYNSegmentView;

@protocol DYNSegmentViewDelegate

//- (NSInteger)dynSegmentItemCount;
//- (CGFloat)dynSegmentItemHeight;
//- (DYNSegmentItem*)dynSegmentItemAtIndex:(NSInteger)index;
- (UIViewController*)dynSegmentPageAtIndex:(NSInteger)index;

@end

@interface DYNSegmentView : UIView <DYNViewProtocol>

@property (nonatomic, copy) NSArray<DYNSegmentItem*> *items;
@property (nonatomic, assign) CGFloat segmentHeight;
@property (nonatomic, strong) UIColor *segmentColor;
@property (nonatomic, weak) id<DYNSegmentViewDelegate> delegate;

//- (instancetype)initWithFrame:(CGRect)frame delegate:(id<DYNSegmentViewDelegate>)delegate;

@end
