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
@property (nonatomic, strong) UIView *flagView;
@property (nonatomic, assign) CGFloat itemWidth;

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

    _flagView = [[UIView alloc] init];
    _flagView.backgroundColor = DYNColorBlue;
    [_scrollerView addSubview:_flagView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _scrollerView.frameWidth = self.frameWidth;
    _scrollerView.frameHeight = _segmentHeight;
    
    CGFloat itemWidth = self.itemWidth;
    
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
    
    _flagView.frameWidth = itemWidth;
    _flagView.frameHeight = 5;
    _flagView.frameEndY = DYNRulerViewHeight(_scrollerView, 1);
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

- (CGFloat)itemWidth {
    if (_items.count <= 5) {
        _itemWidth = _scrollerView.frameWidth / _items.count;
    } else {
        _itemWidth = _scrollerView.frameWidth / 5;
    }
    return _itemWidth;
}

- (void)updateflag {
    DYNWeakSelf(weakSelf)
    
    // 移动标志
    
    CGFloat flagOriginX = self.itemWidth * self.currentItemIndex;
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.flagView.frameOriginX = flagOriginX;
    }];
    
    // 移动scrollview
    
    CGPoint flagPoint = [_scrollerView convertPoint:CGPointMake(flagOriginX + (self.itemWidth / 2), 0) toView:self];
    CGFloat flagCenterX = flagPoint.x;
    
    CGFloat scrollerCenterX = DYNRulerViewWidth(_scrollerView, 0.50);
    CGFloat flagOffsetX = flagCenterX - scrollerCenterX;
    
    CGFloat maxOffsetX = _scrollerView.contentSize.width - _scrollerView.frameWidth;
    
    CGFloat leftOffsetX = _scrollerView.contentOffset.x;
    CGFloat rightOffsetX = maxOffsetX - leftOffsetX;
    
    CGFloat offsetX = 0;
    
    if (flagOffsetX > 0) {
        if (rightOffsetX >= fabs(flagOffsetX)) {
            offsetX = leftOffsetX + fabs(flagOffsetX);
        } else {
            offsetX = leftOffsetX + rightOffsetX;
        }
    } else if (flagOffsetX < 0) {
        if (leftOffsetX >= fabs(flagOffsetX)) {
            offsetX = leftOffsetX - fabs(flagOffsetX);
        }
    } else {
        offsetX = leftOffsetX;
    }
    
    [_scrollerView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    // 缩放 item view
    
    for (UIView *itemView in _itemViews) {
        if (_itemViews.count > _currentItemIndex && itemView == _itemViews[_currentItemIndex]) {
            for (UIView *subView in itemView.subviews) {
                if ([subView isKindOfClass:[DYNSingleLabel class]]) {
                    subView.layer.transform = CATransform3DMakeScale(1.3, 1.3, 1);
                }
            }
            continue;
        }
        
        for (UIView *subView in itemView.subviews) {
            if ([subView isKindOfClass:[DYNSingleLabel class]]) {
                subView.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1);
            }
        }
    }
}

#pragma mark - getter setter
- (void)setItems:(NSArray<DYNSegmentItem *> *)items {
    _items = items;
    for (DYNSegmentItem *item in items) {
        UIView *itemView = [self itemView:item];
        itemView.tag = [items indexOfObject:item];
        
        // 添加点击事件
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemTap:)];
        [itemView addGestureRecognizer:tap];
        
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

- (void)setFlagColor:(UIColor *)flagColor {
    _flagColor = flagColor;
    _flagView.backgroundColor = flagColor;
}

- (void)setCurrentItemIndex:(NSInteger)currentItemIndex {
    if (currentItemIndex < 0) {
        _currentItemIndex = 0;
    } else if (currentItemIndex < _items.count) {
        _currentItemIndex = currentItemIndex;
    } else if (currentItemIndex >= _items.count) {
        _currentItemIndex = _items.count - 1;
    }
    
    [self layoutIfNeeded];
    
    [self updateflag];
}

#pragma mark - action
- (void)itemTap:(UITapGestureRecognizer*)tap {
    UIView *itemView = tap.view;
    self.currentItemIndex = itemView.tag;
    NSLog(@"%ld", itemView.tag);
}

@end
