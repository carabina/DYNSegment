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

@property (nonatomic, weak) id<DYNSegmentViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollerView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) CGFloat itemWidth;

@end

@implementation DYNSegmentView

- (instancetype)initWithFrame:(CGRect)frame delegate:(id<DYNSegmentViewDelegate>)delegate {
    self = [super initWithFrame:frame];
    if (self) {
        _delegate = delegate;
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor redColor];
    
    _scrollerView = [[UIScrollView alloc] init];
    _scrollerView.backgroundColor = [UIColor blueColor];
    _scrollerView.bounces = NO;
    _scrollerView.showsHorizontalScrollIndicator = NO;
    _scrollerView.showsVerticalScrollIndicator = NO;
    [self addSubview:_scrollerView];
    
    for(NSInteger i = 0; i < [_delegate dynSegmentItemCount]; i ++) {
        
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _scrollerView.frameWidth = self.frameWidth;
    _scrollerView.frameHeight = [_delegate dynSegmentItemHeight];
    
    if ([_delegate dynSegmentItemCount] <= 5) {
        _itemWidth = self.frameWidth / [_delegate dynSegmentItemCount];
    } else {
        _itemWidth = self.frameWidth / 5;
    }
    
    _scrollerView.contentSize = CGSizeMake(_itemWidth * [_delegate dynSegmentItemCount], _scrollerView.frameHeight);
}

@end
