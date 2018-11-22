//
//  DYNSegmentItem.m
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/31.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import "DYNSegmentItem.h"
#import <DYNCore/DYNMacro.h>

@implementation DYNSegmentItem

- (NSString *)title {
    return DYNStrClearNil(_title);
}

- (UIFont *)titleFont {
    return _titleFont ? : [UIFont systemFontOfSize:15];
}

- (UIColor *)titleColor {
    return _titleColor? : DYNColorBlack;
}

- (UIColor *)backgroundColor {
    return _backgroundColor? : DYNColorWhite;
}

@end
