//
//  HXSegmentButton.m
//  Pods
//
//  Created by 海啸 on 2017/2/20.
//
//

#define NormalFont [UIFont systemFontOfSize:14]
#define SelectedFont [UIFont systemFontOfSize:16]
#define NormalColor [UIColor blackColor]
#define SelectedColor [UIColor blueColor]
#define ScreenWidth [[UIScreen mainScreen]  bounds].size.width
#import "HXSegmentButton.h"
#import <Masonry/Masonry.h>
@interface HXSegmentButton()
@property (assign, nonatomic) NSUInteger currentIndex;
@property (assign, nonatomic) NSUInteger number;
@property (assign, nonatomic) CGFloat    selfWidth;

@property (strong, nonatomic) UIView     *underLine;
//Set Buttons Color
@property (strong, nonatomic) UIColor *buttonNormalColor;
@property (strong, nonatomic) UIColor *buttonSelectedColor;
//Set Background Color
@property (strong, nonatomic) UIColor *backgroundNormalColor;
@property (strong, nonatomic) UIColor *backgroundSelectedColor;
@property (strong, nonatomic) UIColor *underLineColor;
@end
@implementation HXSegmentButton

- (id)initWithTitles:(NSArray *)titles x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height {
    self = [super initWithFrame:CGRectMake(x, y, width, height)];
    if (self) {
        self.selfWidth = width;
        self.number = titles.count;
        //Lazy button
        [self setupAllButtonsWithTitles:titles width:width];
        self.backgroundColor = self.buttonNormalColor;
        //Set UnderLine
        UIView  *underLine = [[UIView alloc] init];
        [self addSubview:underLine];
        underLine.backgroundColor = [UIColor whiteColor];
        
        [underLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(width/titles.count);
            make.height.mas_equalTo(5);
            make.bottom.mas_equalTo(self);
            make.left.mas_equalTo(self.mas_left);
        }];
        self.underLine = underLine;
    }
    return self;
}

//Lazy button0

- (UIButton *)button0 {
    if (!_button0) {
        _button0                 = [[UIButton alloc] init];
        [self addSubview:_button0];
        _button0                 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button0 setTitle:@"Button0" forState: UIControlStateNormal];
        [_button0 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
        
        _button0.titleLabel.font = [UIFont systemFontOfSize:14];
        _button0.tag             = 0;
        [_button0 addTarget:self action:@selector(buttonClickWith:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button0;
}

//lazy button1
- (UIButton *)button1 {
    if (!_button1) {
        _button1                 = [[UIButton alloc] init];
        [self addSubview:_button1];
        _button1                 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button1 setTitle:@"Button1" forState: UIControlStateNormal];
        _button1.titleLabel.font = [UIFont systemFontOfSize:14];
        
        _button1.tag             = 1;
        [_button1 addTarget:self action:@selector(buttonClickWith:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

//lazy button2
- (UIButton *)button2 {
    if (!_button2) {
        _button2                 = [[UIButton alloc] init];
        [self addSubview:_button2];
        _button2                 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button2 setTitle:@"Button2" forState: UIControlStateNormal];
        _button2.titleLabel.font = [UIFont systemFontOfSize:14];
        
        _button2.tag             = 2;
        [_button2 addTarget:self action:@selector(buttonClickWith:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}
//lazy button3
- (UIButton *)button3 {
    if (!_button3) {
        _button3                 = [[UIButton alloc] init];
        [self addSubview:_button3];
        _button3                 = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button3 setTitle:@"Button3" forState: UIControlStateNormal];
        _button3.titleLabel.font = [UIFont systemFontOfSize:14];
        
        _button3.tag             = 3;
        [_button3 addTarget:self action:@selector(buttonClickWith:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button3;
}

//setup button frame
- (void)setupButtonWith:(UIButton *)button number:(NSUInteger )number width:(CGFloat )width{
    [self addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width / number);
        make.centerY.height.mas_equalTo(self);
        make.left.mas_equalTo(self).mas_offset(button.tag *  width/ number);
    }];
}

//setup all buttons
- (void)setupAllButtonsWithTitles:(NSArray *)titles width:(CGFloat )width{
    switch (titles.count) {
        case 2:
            [self setupButtonWith:self.button0 number:titles.count width:width];
            [self setupButtonWith:self.button1 number:titles.count width:width];
            
            [self.button0 setTitle:titles[0] forState:UIControlStateNormal];
            [self.button1 setTitle:titles[1] forState:UIControlStateNormal];
            
            break;
        case 3:
            [self setupButtonWith:self.button0 number:titles.count width:width];
            [self setupButtonWith:self.button1 number:titles.count width:width];
            [self setupButtonWith:self.button2 number:titles.count width:width];
            
            [self.button0 setTitle:titles[0] forState:UIControlStateNormal];
            [self.button1 setTitle:titles[1] forState:UIControlStateNormal];
            [self.button2 setTitle:titles[2] forState:UIControlStateNormal];
            break;
            
        default:
            [self setupButtonWith:self.button0 number:titles.count width:width];
            [self setupButtonWith:self.button1 number:titles.count width:width];
            [self setupButtonWith:self.button2 number:titles.count width:width];
            [self setupButtonWith:self.button3 number:titles.count width:width];
            
            [self.button0 setTitle:titles[0] forState:UIControlStateNormal];
            [self.button1 setTitle:titles[1] forState:UIControlStateNormal];
            [self.button2 setTitle:titles[2] forState:UIControlStateNormal];
            [self.button3 setTitle:titles[3] forState:UIControlStateNormal];
            break;
    }
}

//Setup Button Colors
- (void)setupButtonsNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    self.buttonNormalColor = normalColor;
    self.buttonSelectedColor = selectedColor;
}

//Setup Background Colors
- (void)setupBackgroundNormalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor underLineColor:(UIColor *)underLineColor {
    self.backgroundNormalColor = normalColor;
    self.backgroundSelectedColor = selectedColor;
    self.underLineColor = underLineColor;
}

//Setup UnderLine Animation
- (void)setupUnderLineAnimation{
    [UIView animateWithDuration:0.3 animations:^{
        [self.underLine mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(_currentIndex*self.selfWidth/self.number);
        }];
        [self layoutIfNeeded];
    }];
}

//Click button
- (void)buttonClickWith:(UIButton *)button {
    [self initButtonTagWith:button.tag];
}

//Swipe button
- (void)initButtonTagWith:(NSInteger )tag {
    
    self.underLine.backgroundColor = self.underLineColor;
    switch (tag) {
        case  0:
            _currentIndex = 0;
            
            _button0.backgroundColor = SelectedColor;
            _button1.backgroundColor = NormalColor;
            _button2.backgroundColor = NormalColor;
            _button3.backgroundColor = NormalColor;
            
            _button0.titleLabel.font = SelectedFont;
            _button1.titleLabel.font = NormalFont;
            _button2.titleLabel.font = NormalFont;
            _button3.titleLabel.font = NormalFont;
            
            //Button Title Color
            [_button0 setTitleColor:self.buttonSelectedColor forState:UIControlStateNormal];
            [_button1 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button2 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button3 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            
            //Button Background Color
            _button0.backgroundColor = self.backgroundSelectedColor;
            _button1.backgroundColor = self.backgroundNormalColor;
            _button2.backgroundColor = self.backgroundNormalColor;
            _button3.backgroundColor = self.backgroundNormalColor;
            break;
            
        case 1:
            _currentIndex = 1;
            
            _button0.backgroundColor = NormalColor;
            _button1.backgroundColor = SelectedColor;
            _button2.backgroundColor = NormalColor;
            _button3.backgroundColor = NormalColor;
            
            _button0.titleLabel.font = NormalFont;
            _button1.titleLabel.font = SelectedFont;
            _button2.titleLabel.font = NormalFont;
            _button3.titleLabel.font = NormalFont;
            
            [_button0 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button1 setTitleColor:self.buttonSelectedColor forState:UIControlStateNormal];
            [_button2 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button3 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            
            //Button Background Color
            _button0.backgroundColor = self.backgroundNormalColor;
            _button1.backgroundColor = self.backgroundSelectedColor;
            _button2.backgroundColor = self.backgroundNormalColor;
            _button3.backgroundColor = self.backgroundNormalColor;
            break;
            
        case 2:
            _currentIndex = 2;
            
            _button0.backgroundColor = NormalColor;
            _button1.backgroundColor = NormalColor;
            _button2.backgroundColor = SelectedColor;
            _button3.backgroundColor = NormalColor;
            
            _button0.titleLabel.font = NormalFont;
            _button1.titleLabel.font = NormalFont;
            _button2.titleLabel.font = SelectedFont;
            _button3.titleLabel.font = NormalFont;
            
            
            [_button0 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button1 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button2 setTitleColor:self.buttonSelectedColor forState:UIControlStateNormal];
            [_button3 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            
            //Button Background Color
            _button0.backgroundColor = self.backgroundNormalColor;
            _button1.backgroundColor = self.backgroundNormalColor;
            _button2.backgroundColor = self.backgroundSelectedColor;
            _button3.backgroundColor = self.backgroundNormalColor;
            break;
            
        case 3:
            _currentIndex = 3;
            
            _button0.backgroundColor = NormalColor;
            _button1.backgroundColor = NormalColor;
            _button2.backgroundColor = NormalColor;
            _button3.backgroundColor = SelectedColor;
            
            _button0.titleLabel.font = NormalFont;
            _button1.titleLabel.font = NormalFont;
            _button2.titleLabel.font = NormalFont;
            _button3.titleLabel.font = SelectedFont;
            
            [_button0 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button1 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button2 setTitleColor:self.buttonNormalColor forState:UIControlStateNormal];
            [_button3 setTitleColor:self.buttonSelectedColor forState:UIControlStateNormal];
            
            //Button Background Color
            _button0.backgroundColor = self.backgroundNormalColor;
            _button1.backgroundColor = self.backgroundNormalColor;
            _button2.backgroundColor = self.backgroundNormalColor;
            _button3.backgroundColor = self.backgroundSelectedColor;
            break;
        default:
            break;
    }
    
    if (_headerIndexBlock) {
        _headerIndexBlock(_currentIndex);
    }
    
}

- (void)returnHeaderIndex:(ButtonCallBackBlock)block {
    self.headerIndexBlock = block;
}
@end
