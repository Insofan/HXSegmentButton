# HXSegmentButton

[![CI Status](http://img.shields.io/travis/Insofan/HXSegmentButton.svg?style=flat)](https://travis-ci.org/Insofan/HXSegmentButton)
[![Version](https://img.shields.io/cocoapods/v/HXSegmentButton.svg?style=flat)](http://cocoapods.org/pods/HXSegmentButton)
[![License](https://img.shields.io/cocoapods/l/HXSegmentButton.svg?style=flat)](http://cocoapods.org/pods/HXSegmentButton)
[![Platform](https://img.shields.io/cocoapods/p/HXSegmentButton.svg?style=flat)](http://cocoapods.org/pods/HXSegmentButton)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HXSegmentButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "HXSegmentButton"
```

## ScreenShot

![CTuwV.gif](http://storage1.imgchr.com/CTuwV.gif)

## Usage

##### 1.Setup SegmentButton

```
//1.Setup SegmentButton
- (HXSegmentButton *)segmentButton {
    if (!_segmentButton) {
        NSArray *array  = @[@"Button0", @"Button1", @"Button2", @"Button3"];
        CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
        //1.1 Setup segment button frame
        _segmentButton = [[HXSegmentButton alloc] initWithTitles:array x:0 y:64 width:screenWidth height:36];
        //1.2 Setup segment button colors
        [_segmentButton setupButtonsNormalColor:[UIColor whiteColor] selectedColor:[UIColor redColor]];
        //1.3 Setup segment button background colors and underLine color
        [_segmentButton setupBackgroundNormalColor:[UIColor blackColor] selectedColor:[UIColor yellowColor] underLineColor:[UIColor redColor]];
        [self.view addSubview:_segmentButton];
    }
    return _segmentButton;
}
```

##### 2.Init button tag

```
 [self.segmentButton initButtonTagWith:0];
```

##### 3. Receive the callback value

```
 //3.1Callback block
    __weak typeof(self) weakSelf = self;
    [_segmentButton returnHeaderIndex:^(NSUInteger current) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSLog(@"%ld", current);
        //3.2 Receive the button tag
        [strongSelf segmentButtonTag:current];
    }];
```

##### 4.Setup UnderLine Animation

```
[self.segmentButton setupUnderLineAnimation];
```

## Author

Insofan, insofan3156@gmail.com

## License

HXSegmentButton is available under the MIT license. See the LICENSE file for more info.
