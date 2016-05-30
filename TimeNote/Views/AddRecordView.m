//
//  AddRecordView.m
//  TimeNote
//
//  Created by Luoliang on 16/5/30.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "AddRecordView.h"

@implementation AddRecordView


-(void)awakeFromNib{
    [super awakeFromNib];
    self.layer.cornerRadius=6;
    self.layer.masksToBounds=YES;
}

+(void)show{
    
    
    AddRecordView *view=[AddRecordView viewFromXib];
//    view.backgroundColor=[UIColor colorWithHexString:@"000011"];

    CGRect rect=[UIScreen mainScreen].bounds;
    UIControl *backGround=[[UIControl alloc]initWithFrame:rect];
    backGround.backgroundColor=[UIColor colorWithWhite:0.7 alpha:0.7];
    [backGround addTarget:view action:@selector(disMiss:) forControlEvents:UIControlEventTouchUpInside];
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    [window addSubview:backGround];
    
    [backGround addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(backGround);
        make.left.equalTo(@30);
        make.right.equalTo(@-30);
    }];
    
}

-(void)disMiss:(UIControl *)sender{
    [sender removeFromSuperview];
}




@end
