//
//  UINavigationBar+CustomNavigationBar.m
//  SKGShop
//
//  Created by Fasa Mo on 15/5/28.
//  Copyright (c) 2015年 LIUX. All rights reserved.
//

#import "UINavigationBar+CustomNavigationBar.h"

@implementation UINavigationBar (CustomNavigationBar)

+ (void)load
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    
    
    if (navigationBar) {
//        navigationBar.barTintColor = GlobalMainRedColor;
        navigationBar.titleTextAttributes = @{ NSForegroundColorAttributeName : [UIColor whiteColor] , NSFontAttributeName : [UIFont boldSystemFontOfSize:20]};
        navigationBar.tintColor = [UIColor whiteColor];
        
        [navigationBar setBackgroundImage:[UIImage makePureColorImageWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64) forClor:[UIColor getRandomColor]] forBarMetrics:UIBarMetricsDefault];

//        navigationBar 
        
    }
    

    
    
    
    
    
    
    
}

@end
