//
//  MyCollectionViewLayout.h
//  test01
//
//  Created by Luoliang on 16/5/9.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@class ViewController;
@interface MyCollectionViewLayout : UICollectionViewLayout
/**
 *  item大小
 */
@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, weak) ViewController * delegate;

@end
