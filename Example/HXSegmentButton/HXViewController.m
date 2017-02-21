//
//  HXViewController.m
//  HXSegmentButton
//
//  Created by Insofan on 02/20/2017.
//  Copyright (c) 2017 Insofan. All rights reserved.
//

#import "HXViewController.h"
#import <HXSegmentButton/HXSegmentButton.h>
#import <Masonry/Masonry.h>
@interface HXViewController () <UIScrollViewDelegate>
@property (strong, nonatomic) HXSegmentButton *segmentButton;
@property (strong, nonatomic) UIScrollView         *scrollView;
@property (strong, nonatomic) UILabel *label;

@property (assign, nonatomic) CGFloat screenWidth;
@end

@implementation HXViewController
#pragma mark: Setup UI
//1.Setup SegmentButton
- (HXSegmentButton *)segmentButton {
    if (!_segmentButton) {
        NSArray *array  = @[@"Button0", @"Button1", @"Button2", @"Button3"];
        //1.1 Setup segment button frame
        _segmentButton = [[HXSegmentButton alloc] initWithTitles:array x:0 y:64 width:self.screenWidth height:36];
        //1.2 Setup segment button colors
        [_segmentButton setupButtonsNormalColor:[UIColor whiteColor] selectedColor:[UIColor redColor]];
        //1.3 Setup segment button background colors and underLine color
        [_segmentButton setupBackgroundNormalColor:[UIColor blackColor] selectedColor:[UIColor yellowColor] underLineColor:[UIColor redColor]];
        [self.view addSubview:_segmentButton];
    }
    return _segmentButton;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 110, self.screenWidth, 100)];
        _scrollView.delegate                       = self;
        
        _scrollView.backgroundColor                = [UIColor whiteColor];
        _scrollView.pagingEnabled                  = true;
        _scrollView.showsVerticalScrollIndicator   = false;
        _scrollView.showsHorizontalScrollIndicator = false;
        
        //set content size
        [_scrollView setContentSize:CGSizeMake(self.screenWidth*4, 100)];
        [_scrollView setContentOffset:CGPointMake(0, 0)];
        
        //设置滚动
        [_scrollView scrollRectToVisible:CGRectMake(0, 0, self.screenWidth, 100) animated:false];
        
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
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

- (void)setupScrollViews {
    NSArray *colors = @[[UIColor redColor], [UIColor blueColor], [UIColor yellowColor], [UIColor purpleColor]];
    for (int i = 0; i < 4; i++) {
        UIView *view = [UIView new];
        [self.scrollView addSubview:view];
        view.backgroundColor = colors[i];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(self.screenWidth, 100));
            make.top.mas_equalTo(self.scrollView.mas_top);
            make.left.mas_equalTo(self.scrollView.mas_left).mas_offset(self.screenWidth*i);
        }];
    }
}

- (void)setupUI {
    [self segmentButton];
    [self scrollView];
    [self setupScrollViews];
    [self label];
    [self switchSegmentButton];
    
}

#pragma mark: Logical
//3.Switch Segment Button
- (void)switchSegmentButton {
    //3.1Callback block
    __weak typeof(self) weakSelf = self;
    [_segmentButton returnHeaderIndex:^(NSUInteger current) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%ld", current);
        //3.2 Receive the button tag
        [strongSelf segmentButtonTag:current];
    }];
}

//4.Setup UnderLine Animation
- (void)segmentButtonTag:(NSInteger)tag{
    self.label.text = [NSString stringWithFormat:@"%ld", tag];
    
    [self.segmentButton setupUnderLineAnimation];
    
    //Scroll view
    [self.scrollView scrollRectToVisible:CGRectMake(tag* self.screenWidth, 0, self.screenWidth, 100) animated:false];
    [self.scrollView setContentOffset:CGPointMake(tag * self.screenWidth, 0)];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger currentPage = floor(scrollView.contentOffset.x / self.screenWidth);
    if (currentPage == 0) {
        [self switchSegmentButton];
        [self.segmentButton initButtonTagWith:0];
        
    } else if (currentPage == 1) {
        [self.segmentButton initButtonTagWith:1];
    } else if (currentPage == 2) {
        [self.segmentButton initButtonTagWith:2];
    } else {
        [self.segmentButton initButtonTagWith:3];
    }
}

#pragma mark: Life Cycle
//2 Init button tag
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        self.screenWidth = screenWidth;
        //2.1 Init button tag
        [self.segmentButton initButtonTagWith:0];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

@end
