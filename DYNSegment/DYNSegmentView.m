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
@property (nonatomic, strong) UIView *symbolView;
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

    _symbolView = [[UIView alloc] init];
    _symbolView.backgroundColor = DYNColorBlue;
    [_scrollerView addSubview:_symbolView];
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
    
    _symbolView.frameWidth = itemWidth;
    _symbolView.frameHeight = 10;
    _symbolView.frameEndY = DYNRulerViewHeight(_scrollerView, 1);
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

- (void)updateSymbol {
    DYNWeakSelf(weakSelf)
    
    // 移动标志
    
    CGFloat symbolOriginX = self.itemWidth * self.currentItemIndex;
    
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.symbolView.frameOriginX = symbolOriginX;
    }];
    
    // 移动scrollview
    
    CGFloat symbolCenterX = symbolOriginX + (self.itemWidth / 2);
    CGFloat scrollerCenterX = DYNRulerViewWidth(_scrollerView, 0.50);
    
    CGFloat maxOffsetX = _scrollerView.contentSize.width - _scrollerView.frameWidth;
    
    CGFloat symbolOffsetX = symbolCenterX - scrollerCenterX;
    
    CGFloat leftOffsetX = _scrollerView.contentOffset.x;
    CGFloat rightOffsetX = maxOffsetX - leftOffsetX;
    
    if (symbolOffsetX > 0) {
        if (rightOffsetX >= fabs(symbolOffsetX)) {
            [_scrollerView setContentOffset:CGPointMake(leftOffsetX + fabs(symbolOffsetX), 0) animated:YES];
        }
    } else if (symbolOffsetX < 0) {
        if (leftOffsetX >= fabs(symbolOffsetX)) {
            [_scrollerView setContentOffset:CGPointMake(leftOffsetX - fabs(symbolOffsetX), 0) animated:YES];
        }
    }
    
    
//    NSLog(@"symbolOffsetX=%f", symbolOffsetX);
//    NSLog(@"offsetX=%f", offsetX);
//    NSLog(@"maxOffsetX=%f", maxOffsetX);
//    if (fabs(offsetX) > 0 && fabs(offsetX) >= maxOffsetX) {
//        [_scrollerView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
//    }
    
    
//    CGFloat x = _scrollerView.contentOffset.x;
//    CGFloat y = _scrollerView.contentOffset.y;
//    NSLog(@"x=%f", x);
//    NSLog(@"y=%f", y);
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

- (void)setSymbolColor:(UIColor *)symbolColor {
    _symbolColor = symbolColor;
    _symbolView.backgroundColor = symbolColor;
}

- (void)setCurrentItemIndex:(NSInteger)currentItemIndex {
    if (currentItemIndex < 0) {
        _currentItemIndex = 0;
    } else if (currentItemIndex < _items.count) {
        _currentItemIndex = currentItemIndex;
    } else if (currentItemIndex >= _items.count) {
        _currentItemIndex = _items.count - 1;
    }
    [self setNeedsLayout];
    
    [self updateSymbol];
}

#pragma mark - action
- (void)itemTap:(UITapGestureRecognizer*)tap {
    UIView *itemView = tap.view;
    self.currentItemIndex = itemView.tag;
    NSLog(@"%ld", itemView.tag);
}

@end
