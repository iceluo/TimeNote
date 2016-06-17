//
//  InsertItemView.m
//  TimeNote
//
//  Created by Luoliang on 16/6/2.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "InsertItemView.h"

@interface TimeButton : UIButton

@end
@implementation TimeButton



-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.layer.cornerRadius=self.frame.size.width/2.f;
    
}



@end


@interface InsertItemView ()


@property (nonatomic, strong) UIButton * buttonForTime;
@property (nonatomic, strong) UIButton * buttonForAdd;
@property (nonatomic, strong) UITextField * textField;
@property (nonatomic, strong) CAGradientLayer * gradientLayer;

@property (nonatomic, strong) UIView * contentView;


@property (nonatomic, strong) MASConstraint * leftConstraint;
@property (nonatomic, strong) MASConstraint * rightConstraint;



@end


@implementation InsertItemView

-(UITextField *)textField{
    if (!_textField) {
        _textField=[UITextField new];
        _textField.backgroundColor=[UIColor grayColor];
    }return _textField;
}

-(CAGradientLayer *)gradientLayer{
    if (_gradientLayer==nil) {
        _gradientLayer=[CAGradientLayer layer];
        _gradientLayer.colors=@[(__bridge id)[UIColor blackColor].CGColor,
                                (__bridge id)[UIColor blackColor].CGColor,
                                (__bridge id)[UIColor clearColor].CGColor,
                                (__bridge id)[UIColor clearColor].CGColor
                                ];
        _gradientLayer.locations=@[@(0),@(0.33333333),@(0.666667),@(1)];
        _gradientLayer.startPoint=CGPointMake(0, 0);
        _gradientLayer.endPoint=CGPointMake(1, 0);
    }return _gradientLayer;
}

-(UIView *)contentView{
    if (_contentView==nil) {
        _contentView=[UIView new];
        _contentView.backgroundColor=[UIColor clearColor];
        [_contentView.layer addSublayer:self.gradientLayer];
    }return _contentView;
}

- (instancetype)init{
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

    UIButton *leftBT=[self getButton];
    self.leftBT=leftBT;
    [self addSubview:leftBT];
    [leftBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.width.equalTo(self.mas_height);
        make.height.equalTo(self.mas_height);
    }];
    
    UIButton *rightBT=[self getButton];
    self.rightBT=rightBT;
    [self addSubview:rightBT];
    [rightBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(@0);
        make.top.equalTo(@0);
        make.width.equalTo(self.mas_height);
        make.height.equalTo(self.mas_height);
    }];

    UITextField *textField=[UITextField new];
    [self addSubview:textField];
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftBT.mas_right);
        make.right.equalTo(rightBT.mas_left);
        make.top.bottom.equalTo(@0);
    }];
    
}

-(UIButton *)getButton{
    TimeButton *button=[TimeButton new];
    button.backgroundColor=[UIColor getRandomColor];
    return button;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    [self show];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.layer.cornerRadius=self.frame.size.height/2.f;
    self.layer.masksToBounds=YES;
}
-(void)show{

    self.maskView=self.contentView;
    self.contentView.frame=CGRectMake(-self.bounds.size.width*2, 0, self.bounds.size.width*3, self.bounds.size.height);
    self.gradientLayer.frame=self.contentView.bounds;
    
    [UIView animateWithDuration:2.f animations:^{
        CGRect frame=self.contentView.frame;
        self.contentView.frame=CGRectOffset(frame,2*self.frame.size.width, 0);
    } completion:^(BOOL finished) {
        self.maskView=nil;
    }];
}




@end
