//
//  DYNSegmentItem.h
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/28.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DYNViewProtocol.h"

@interface DYNSegmentItem : UIView <DYNViewProtocol>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;

@end
