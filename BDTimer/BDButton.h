//
//  BDButton.h
//  BDTimer
//
//  Created by 冰点 on 15/11/23.
//  Copyright © 2015年 冰点. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface BDButton : UIButton

@property (nonatomic) IBInspectable CGFloat cornerRadius;

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;

@end
