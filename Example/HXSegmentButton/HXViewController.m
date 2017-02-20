//
//  HXViewController.m
//  HXSegmentButton
//
//  Created by Insofan on 02/20/2017.
//  Copyright (c) 2017 Insofan. All rights reserved.
//

#import "HXViewController.h"
#import <HXSegmentButton/HXSegmentButton.h>
#import "Masonry.h"
@interface HXViewController ()
@property (strong, nonatomic) HXSegmentButton *segmentControl;
@property (strong, nonatomic) UILabel *label;
@end

@implementation HXViewController
//setup segmentControl
- (HXSegmentButton *)segmentControl {
    if (!_segmentControl) {
        NSArray *array  = @[@"Button0", @"Button1", @"Button2", @"Button3"];
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        _segmentControl = [[HXSegmentButton alloc] initWithTitles:array x:0 y:64 width:screenWidth height:36];
        [_segmentControl setupButtonsNormalColor:[UIColor whiteColor] selectedColor:[UIColor redColor]];
        [_segmentControl setupBackgroundNormalColor:[UIColor blackColor] selectedColor:[UIColor yellowColor] underLineColor:[UIColor redColor]];
        [self.view addSubview:_segmentControl];
    }
    return _segmentControl;
}

- (UILabel*)label {
    if (!_label) {
        _label = [UILabel new];
        [self.view addSubview:_label];
        _label.backgroundColor = [UIColor whiteColor];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.mas_equalTo(self.view);
            make.size.mas_equalTo(CGSizeMake(100, 60));
        }];
    }
    return _label;
}

//Switch Segment Button
- (void)switchSegmentButton {
    //防止循环引用
    __weak typeof(self) weakSelf = self;
    [_segmentControl returnHeaderIndex:^(NSUInteger current) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%ld", current);
        [strongSelf segmentButtonTag:current];
    }];
}

- (void)segmentButtonTag:(NSInteger)tag{
    self.label.text = [NSString stringWithFormat:@"%ld", tag];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self segmentControl];
    }
    return self;
}

- (void)setupUI {
    [self switchSegmentButton];
    [self.segmentControl initButtonTagWith:0];
    [self label];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

@end
