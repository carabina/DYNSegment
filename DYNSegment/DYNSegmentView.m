//
//  DYNSegmentView.m
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/28.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import "DYNSegmentView.h"
#import "DYNMacro.h"

@interface DYNSegmentView()

@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation DYNSegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor redColor];
    
    _scrollerView = [[UIScrollView alloc] init];
    _scrollerView.bounces = NO;
    _scrollerView.showsHorizontalScrollIndicator = NO;
    _scrollerView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollerView];

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _scrollerView.frameWidth = self.frameWidth;
    _scrollerView.frameHeight = _segmentHeight;
    
    CGFloat itemWidth = 0;
    
    if (_items.count <= 5) {
        itemWidth = _scrollerView.frameWidth / _items.count;
    } else {
        itemWidth = _scrollerView.frameWidth / 5;
    }
    
    _scrollerView.contentSize = CGSizeMake(itemWidth * _items.count, _segmentHeight);
    
    for (DYNSegmentItem *item in _items) {
        item.frameWidth = itemWidth;
        item.frameHeight = _segmentHeight;
        item.frameOriginX = [_items indexOfObject:item] * itemWidth;
        item.frameCenterY = DYNRulerViewHeight(_scrollerView, 0.5);
    }
}

#pragma mark - getter setter
- (void)setItems:(NSArray<DYNSegmentItem *> *)items {
    _items = items;
    for (DYNSegmentItem *item in items) {
        [_scrollerView addSubview:item];
    }
    [self layoutIfNeeded];
}

- (void)setSegmentHeight:(CGFloat)itemHeight {
    _segmentHeight = itemHeight;
    [self layoutIfNeeded];
}

- (void)setSegmentColor:(UIColor *)itemsColor {
    _segmentColor = itemsColor;
    _scrollerView.backgroundColor = itemsColor;
}

@end
