//
//  AddRecordSectionView.m
//  TimeNote
//
//  Created by Luoliang on 16/6/1.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "AddRecordItemView.h"
@interface AddRecordItemView()
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (nonatomic, weak) UIView * lastView;

@end

@implementation AddRecordItemView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self  setUI];
    }
    return self;
}

-(void)setUI{
    
//    两个按钮
//    一个输入框
    
    
    
}

- (IBAction)buttonClick:(id)sender {
    
    
    
    
}

-(void)addLine{
    
    UIButton *bt=[UIButton new];
    bt.backgroundColor=[UIColor getRandomColor];
    
    [self addSubview:bt];
    
    
    
}


@end
