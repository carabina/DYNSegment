//
//  ViewController1.m
//  DYNSegmentDemo
//
//  Created by huangsy on 2018/11/2.
//  Copyright © 2018年 devyuan. All rights reserved.
//

#import "ViewController1.h"
#import "DYNSingleLabel.h"
#import "DYNMacro.h"

@interface ViewController1 ()

@property (nonatomic, strong) DYNSingleLabel *descLabel;

@end

@implementation ViewController1

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.descLabel.frameCenterX = DYNRulerViewWidth(self.view, 0.50);
    self.descLabel.frameCenterY = DYNRulerViewHeight(self.view, 0.50);
    [self.view addSubview:self.descLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (DYNSingleLabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [[DYNSingleLabel alloc] init];
    }
    return _descLabel;
}

- (void)setDesc:(NSString *)desc {
    _desc = desc;
    [self.descLabel keepCenterWithTextString:desc];
}

@end
