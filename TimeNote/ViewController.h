//
//  ViewController.h
//  TimeNote
//
//  Created by Luoliang on 16/4/29.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddRecordView.h"
#import "MyCollectionViewLayout.h"
#import "CollectionViewCell.h"
#import "MyCell.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *text;

@property (weak, nonatomic) IBOutlet UILabel *lonLabel;
@property (weak, nonatomic) IBOutlet UILabel *latLabel;
@end

