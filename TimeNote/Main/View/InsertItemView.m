//
//  InsertItemView.m
//  TimeNote
//
//  Created by Luoliang on 16/6/2.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "InsertItemView.h"

@interface InsertItemView ()


@property (nonatomic, strong) UIButton * buttonForTime;
@property (nonatomic, strong) UIButton * buttonForAdd;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) CAGradientLayer * gradientLayer;



@property (nonatomic, strong) MASConstraint * leftConstraint;
@property (nonatomic, strong) MASConstraint * rightConstraint;



@end


@implementation InsertItemView

-(UIButton *)buttonForTime{
    if (!_buttonForTime) {
        _buttonForTime=[UIButton new];
        _buttonForTime.backgroundColor=[UIColor getRandomColor];
        [_buttonForTime setTitle:@"9:00" forState:UIControlStateNormal];
        _buttonForTime.alpha=0.0;
    }return _buttonForTime;
}

-(UIButton *)buttonForAdd{
    if (!_buttonForAdd) {
        _buttonForAdd=[UIButton new];
        _buttonForAdd.backgroundColor=[UIColor redColor];
        [_buttonForAdd setTitle:@"➕" forState:UIControlStateNormal];
        [_buttonForAdd addTarget:self action:@selector(buttonForAddClick:) forControlEvents:UIControlEventTouchUpInside];
    }return _buttonForAdd;
}


-(UITextField *)textField{
    if (!_textField) {
        _textField=[UITextField new];
        _textField.backgroundColor=[UIColor grayColor];

    }return _textField;

}

-(CAGradientLayer *)gradientLayer{
    if (_gradientLayer==nil) {
        _gradientLayer=[CAGradientLayer layer];
        _gradientLayer.backgroundColor=[UIColor greenColor].CGColor;
        _gradientLayer.frame=self.bounds;
        _gradientLayer.colors=@[(__bridge id)[UIColor blackColor].CGColor,
                                (__bridge id)[UIColor clearColor].CGColor
                                ];
        _gradientLayer.locations=@[@(0),@(1)];
        _gradientLayer.startPoint=CGPointMake(0, 0);
        _gradientLayer.endPoint=CGPointMake(1, 0);
    }return _gradientLayer;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self setUI];
    }
    return self;
}

- (void)setUI{
    
    self.backgroundColor=[UIColor orangeColor];
    
    //    一个输入框
    [self addSubview:self.textField];
    //    两个按钮
    [self addSubview:self.buttonForTime];
    [self addSubview:self.buttonForAdd];
    [self.layer addSublayer:self.gradientLayer];
    
//    两个按钮的位置
    
}

-(void)layoutSubviews{
    self.gradientLayer.frame=self.bounds;

    [super layoutSubviews];

}


-(void)updateConstraints{
    [super updateConstraints];
}

-(IBAction)buttonForAddClick:(UIControl*)sender{
   
    [UIView animateWithDuration:0.35 animations:^{
        if (sender.tag==0) {
            [self.rightConstraint uninstall];
            [self.leftConstraint install];

            self.buttonForTime.alpha=0.f;
            [self.buttonForAdd setTitle:@"➕" forState:UIControlStateNormal];
            sender.tag=1;
        }else{
            [self.leftConstraint uninstall];
            [self.rightConstraint install];
            self.buttonForTime.alpha=1;
            [self.buttonForAdd setTitle:@"➖" forState:UIControlStateNormal];

            sender.tag=0;
        }
        [self layoutIfNeeded];
    }];
    
}

@end
