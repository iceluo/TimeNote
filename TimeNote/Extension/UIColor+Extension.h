//
//  UIColor+Extension.h
//  TimeNote
//
//  Created by Luoliang on 16/5/30.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
+(UIColor *)getRandomColor;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithRGBHex:(UInt32)hex;

@end
