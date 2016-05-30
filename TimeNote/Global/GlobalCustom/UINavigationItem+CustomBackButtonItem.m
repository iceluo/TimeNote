//
//  UINavigationItem+CustomBackButtonItem.m
//  SKGShop
//
//  Created by Fasa Mo on 15/5/28.
//  Copyright (c) 2015年 LIUX. All rights reserved.
//

#import "UINavigationItem+CustomBackButtonItem.h"
#import <objc/runtime.h>

@implementation UINavigationItem (CustomBackButtonItem)

+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originalMethodImp = class_getInstanceMethod(self, @selector(backBarButtonItem));
        
        Method destMethodImp = class_getInstanceMethod(self, @selector(myCustomBackButtonItem_backBarbuttonItem));
        method_exchangeImplementations(originalMethodImp, destMethodImp);
    });
    
//    UIImage *image = [UIImage imageNamed:@"tempBackButtonItem"];
//    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

static char kCustomBackButtonItemKey;
- (UIBarButtonItem *)myCustomBackButtonItem_backBarbuttonItem{
    UIBarButtonItem *item = [self myCustomBackButtonItem_backBarbuttonItem];
    if (item) {
        return item;
    }
    item = objc_getAssociatedObject(self, &kCustomBackButtonItemKey);
    if (!item) {
        item = [[UIBarButtonItem alloc] initWithTitle:@" " style:UIBarButtonItemStyleBordered target:nil action:NULL];
        objc_setAssociatedObject(self, &kCustomBackButtonItemKey, item, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return item;
}


@end
