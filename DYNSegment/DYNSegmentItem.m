//
//  DYNSegmentItem.m
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/28.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import "DYNSegmentItem.h"
#import "DYNMacro.h"
#import "DYNSingleLabel.h"

@interface DYNSegmentItem()

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) DYNSingleLabel *titleLabel;

@end

@implementation DYNSegmentItem

#pragma mark - public

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    _contentView = [[UIView alloc] init];
    [self addSubview:_contentView];
    
    _titleLabel = [[DYNSingleLabel alloc] init];
    _titleLabel.textColor = DYNColorBlack;
    _titleLabel.textSize = DYNLableSize5;
    [_contentView addSubview:_titleLabel];
}

#pragma mark - private

#pragma mark - override

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _contentView.frame = self.bounds;
    
    _titleLabel.frameCenterX = DYNRulerViewWidth(_contentView, 0.5);
    _titleLabel.frameCenterY = DYNRulerViewHeight(_contentView, 0.5);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

#pragma mark - getter setter
- (void)setTitle:(NSString *)title {
    _title = title;
    [_titleLabel keepCenterWithTextString:title];
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    _titleLabel.font = titleFont;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    _titleLabel.textColor = titleColor;
}

@end
