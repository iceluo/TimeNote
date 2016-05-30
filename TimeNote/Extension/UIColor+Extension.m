//
//  UIColor+Extension.m
//  TimeNote
//
//  Created by Luoliang on 16/5/30.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)
+(UIColor *)getRandomColor{
    int x = arc4random() % 255;
    int y = arc4random() % 255;
    int z = arc4random() % 255;
    
    UIColor *color=[UIColor colorWithRed:x/255.f
                                   green:y/255.f blue:z/255.f alpha:1];
    return color;
}


+ (UIColor *)colorWithRGBHex:(UInt32)hex {
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}


+ (UIColor *)colorWithHexString:(NSString *)stringToConvert {
    
    NSScanner *scanner = [NSScanner scannerWithString:stringToConvert];
    
    
    
    unsigned hexNum;
    if (![scanner scanHexInt:&hexNum]) return nil;
    
    return [UIColor colorWithRGBHex:hexNum];
}
@end
