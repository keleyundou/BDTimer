//
//  BDButton.m
//  BDTimer
//
//  Created by 冰点 on 15/11/23.
//  Copyright © 2015年 冰点. All rights reserved.
//

#import "BDButton.h"

@implementation BDButton

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = (cornerRadius > 0) ? YES : NO;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

@end
