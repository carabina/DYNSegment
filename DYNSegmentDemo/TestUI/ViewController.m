//
//  ViewController.m
//  UIExample
//
//  Created by huangsy on 17/2/8.
//  Copyright © 2017年 feiyu. All rights reserved.
//

#import "ViewController.h"
#import "DYNSegmentView.h"

@interface ViewController () <DYNSegmentViewDelegate>
- (IBAction)btn0Action:(id)sender;
- (IBAction)btn1Action:(id)sender;
- (IBAction)btn2Action:(id)sender;
- (IBAction)btn3Action:(id)sender;
- (IBAction)btn4Action:(id)sender;
- (IBAction)btn5Action:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DYNSegmentView *segView = [[DYNSegmentView alloc] initWithFrame:self.view.bounds delegate:self];
    [self.view addSubview:segView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - delegate
- (NSInteger)dynSegmentItemCount {
    return 6;
}

- (CGFloat)dynSegmentItemHeight {
    return 50;
}

- (DYNSegmentItem*)dynSegmentItemAtIndex:(NSInteger)index {
    return nil;
}

- (UIViewController*)dynSegmentPageAtIndex:(NSInteger)index {
    return nil;
}

#pragma mark - action

- (IBAction)btn0Action:(id)sender {

}

- (IBAction)btn1Action:(id)sender {

}

- (IBAction)btn2Action:(id)sender {

}

- (IBAction)btn3Action:(id)sender {

}

- (IBAction)btn4Action:(id)sender {

}

- (IBAction)btn5Action:(id)sender {

}

@end
