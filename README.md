# DYNSegment

## Version

0.0.3

## Description

A iOS segment page, that page can slide left or right and it's flag can slide follow the page. It is easy to use.

## How to use

Installation with CocoaPods：`pod ''`

```
#import <>
```

```
@interface ViewController () <DYNSegmentPageDelegate>
```

```
DYNSegmentItem *item0 = [[DYNSegmentItem alloc] init];
item0.title = @"00000";

DYNSegmentItem *item1 = [[DYNSegmentItem alloc] init];
item1.title = @"11111";

DYNSegmentItem *item2 = [[DYNSegmentItem alloc] init];
item2.title = @"2222";

DYNSegmentItem *item3 = [[DYNSegmentItem alloc] init];
item3.title = @"3333";

DYNSegmentItem *item4 = [[DYNSegmentItem alloc] init];
item4.title = @"44444";

DYNSegmentItem *item5 = [[DYNSegmentItem alloc] init];
item5.title = @"55555";

DYNSegmentItem *item6 = [[DYNSegmentItem alloc] init];
//    item6.titleColor = [UIColor redColor];
item6.title = @"6666";
    
DYNSegmentItem *item7 = [[DYNSegmentItem alloc] init];
//    item7.titleFont = [UIFont systemFontOfSize:10];
item7.title = @"77777";
    
DYNSegmentItem *item8 = [[DYNSegmentItem alloc] init];
//    item8.backgroundColor = [UIColor lightGrayColor];
item8.title = @"8888";

NSArray *items = @[item0, item1, item2, item3, item4, item5, item6, item7, item8];

DYNSegmentPage *segmentPage = [[DYNSegmentPage alloc] initWithFrame:self.view.bounds items:items delegate:self];
//    segmentPage.segmentHeight = 50;
//    segmentPage.segmentColor = [UIColor whiteColor];
//    segmentPage.currentItemIndex = 5;
//    segmentPage.flagColor = [UIColor blueColor];

[self.view addSubview:segmentPage];    
```

```
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
```