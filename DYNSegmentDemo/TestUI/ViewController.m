//
//  ViewController.m
//  UIExample
//
//  Created by huangsy on 17/2/8.
//  Copyright © 2017年 feiyu. All rights reserved.
//

#import "ViewController.h"
#import "DYNSegmentItem.h"
#import "DYNSegmentPage.h"
#import "ViewController1.h"

@interface ViewController () <DYNSegmentPageDelegate>
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
    
    DYNSegmentItem *item0 = [[DYNSegmentItem alloc] init];
    item0.title = @"00000";
    item0.titleFont = [UIFont systemFontOfSize:10];
    
    DYNSegmentItem *item1 = [[DYNSegmentItem alloc] init];
    item1.title = @"11111";
    item1.titleFont = [UIFont systemFontOfSize:10];
    
    DYNSegmentItem *item2 = [[DYNSegmentItem alloc] init];
    item2.title = @"2222";
    
    DYNSegmentItem *item3 = [[DYNSegmentItem alloc] init];
    item3.title = @"3333";
    
    DYNSegmentItem *item4 = [[DYNSegmentItem alloc] init];
    item4.title = @"44444";
    item4.titleColor = [UIColor redColor];
    
    DYNSegmentItem *item5 = [[DYNSegmentItem alloc] init];
    item5.title = @"55555";
    
    DYNSegmentItem *item6 = [[DYNSegmentItem alloc] init];
    item6.title = @"6666";
    
    DYNSegmentItem *item7 = [[DYNSegmentItem alloc] init];
    item7.title = @"77777";
    
    DYNSegmentItem *item8 = [[DYNSegmentItem alloc] init];
    item8.title = @"8888";
    
    DYNSegmentPage *sv = [[DYNSegmentPage alloc] initWithFrame:self.view.bounds];
    sv.delegate = self;
    sv.items = @[item0, item1, item2, item3, item4, item5, item6, item7, item8];
    sv.segmentHeight = 50;
    sv.segmentColor = [UIColor whiteColor];
    sv.currentItemIndex = 10;
    [self.view addSubview:sv];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - delegate
- (UIViewController*)dynSegmentPageAtIndex:(NSInteger)index {
    ViewController1 *vc = [[ViewController1 alloc] init];
    vc.desc = [NSString stringWithFormat:@"页面%ld", index];
    if ((index % 2) == 0) {
        vc.view.backgroundColor = [UIColor cyanColor];
    } else {
        vc.view.backgroundColor = [UIColor magentaColor];
    }
    return vc;
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
