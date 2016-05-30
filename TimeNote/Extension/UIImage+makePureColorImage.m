//
//  UIImage+makePureColorImage.m
//  SKGShop
//
//  Created by luoliang on 15/6/9.
//  Copyright (c) 2015年 LIUX. All rights reserved.
//

#import "UIImage+makePureColorImage.h"

@implementation UIImage (makePureColorImage)


+(UIImage *)makePureColorImageWithFrame:(CGRect)frame forClor:(UIColor *)color{
    CGSize imageSize =frame.size;
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    
    UIImage *pressedColorImg1 = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return pressedColorImg1;
}
@end
