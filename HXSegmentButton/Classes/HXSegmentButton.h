//
//  HXSegmentButton.h
//  Pods
//
//  Created by 海啸 on 2017/2/20.
//
//

#import <UIKit/UIKit.h>


typedef  void (^ButtonCallBackBlock)(NSUInteger current);
@interface HXSegmentButton : UIView
@property(nonatomic,copy) ButtonCallBackBlock headerIndexBlock;
//Buttons
@property (strong, nonatomic) UIButton *button0;
@property (strong, nonatomic) UIButton *button1;
@property (strong, nonatomic) UIButton *button2;
@property (strong, nonatomic) UIButton *button3;
//Init Titles and Frame
- (id)initWithTitles:(NSArray *)titles x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height ;
//Call Back Block
- (void)returnHeaderIndex:(ButtonCallBackBlock)block;
//Init Button Tag
- (void)initButtonTagWith:(NSInteger )tag;
//Setup Button Color
- (void)setupButtonsNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor ;
//Setup Background Color
- (void)setupBackgroundNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor underLineColor:(UIColor *)underLineColor;
//Setup UnderLine Animation
- (void)setupUnderLineAnimation;
@end
