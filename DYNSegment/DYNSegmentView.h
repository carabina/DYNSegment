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

- (NSInteger)dynSegmentView:(DYNSegmentView*)segmentView itemCount:(NSInteger)itemCount;
- (DYNSegmentItem*)dynSegmentView:(DYNSegmentView*)segmentView itemAtIndex:(NSInteger)index;
- (UIViewController*)dynSegmentView:(DYNSegmentView*)segmentView pageAtIndex:(NSInteger)index;

@end

@interface DYNSegmentView : UIView <DYNViewProtocol>

@end
