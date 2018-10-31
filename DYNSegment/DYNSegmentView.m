//
//  DYNSegmentView.m
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/10/28.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import "DYNSegmentView.h"
#import "DYNMacro.h"
#import "DYNSingleLabel.h"

@interface DYNSegmentView()

@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSMutableArray<UIView*> *itemViews;

@end

@implementation DYNSegmentView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _itemViews = [[NSMutableArray alloc] initWithCapacity:3];
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
    
    for (UIView *itemView in _itemViews) {
        itemView.frameWidth = itemWidth;
        itemView.frameHeight = _segmentHeight;
        itemView.frameOriginX = [_itemViews indexOfObject:itemView] * itemWidth;
        itemView.frameCenterY = DYNRulerViewHeight(_scrollerView, 0.5);
        
        for (UIView *label in itemView.subviews) {
            if ([label isKindOfClass:[DYNSingleLabel class]]) {
                label.frameCenterX = DYNRulerViewWidth(itemView, 0.5);
                label.frameCenterY = DYNRulerViewHeight(itemView, 0.5);
            }
        }
    }
}

#pragma mark - private
- (UIView*)itemView:(DYNSegmentItem*)item {
    
    UIView *itemView = [[UIView alloc] init];
    itemView.backgroundColor = item.backgroundColor;
    
    DYNSingleLabel *label = [[DYNSingleLabel alloc] init];
    [label keepCenterWithTextString:item.title];
    label.font = item.titleFont;
    label.textColor = item.titleColor;
    
    [itemView addSubview:label];
    
    return itemView;
}

#pragma mark - getter setter
- (void)setItems:(NSArray<DYNSegmentItem *> *)items {
    _items = items;
    for (DYNSegmentItem *item in items) {
        UIView *itemView = [self itemView:item];
        [_itemViews addObject:itemView];
        [_scrollerView addSubview:itemView];
    }
    [self setNeedsLayout];
}

- (void)setSegmentHeight:(CGFloat)itemHeight {
    _segmentHeight = itemHeight;
    [self setNeedsLayout];
}

- (void)setSegmentColor:(UIColor *)itemsColor {
    _segmentColor = itemsColor;
    _scrollerView.backgroundColor = itemsColor;
}

@end
