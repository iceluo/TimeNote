//
//  InsertContentView.m
//  TimeNote
//
//  Created by Luoliang on 16/6/3.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "InsertContentView.h"
#import "MASViewConstraint.h"
#import "UIView+Extension.h"
#define btHeght 60

@interface InsertContentView()
@property (nonatomic, strong) NSMutableArray<UIControl *> * arrayM;

@property (nonatomic, strong) MASConstraint * constraintHeight;
@property (nonatomic, strong) MASConstraint * constraintBottom;

@property (nonatomic, strong) UIView * lastView;



@end
@implementation InsertContentView
-(NSMutableArray *)arrayM{
    if (_arrayM==nil) {
        _arrayM=[NSMutableArray new];
    }return _arrayM;
}
-(UIControl *)getButton{
    InsertItemView *bt=[InsertItemView new];
    bt.backgroundColor=[UIColor getRandomColor];
    [bt.leftBT addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
    [bt.rightBT addTarget:self action:@selector(removeClick:) forControlEvents:UIControlEventTouchUpInside];

    return bt;
}
- (instancetype)init{
    self = [super init];
    if (self) {
        [self setUI];
    }
    return self;
}

-(void)setUI{
    
    [self btClick:nil];
}

-(IBAction)btClick:(UIButton *)sender{
    NSLog(@"btClick");
    UIView *lastView=[self.arrayM lastObject];
    self.lastView=lastView;
    UIControl *bt=[self getButton];
    [self addSubview:bt];
    [self.arrayM addObject:bt];
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
//        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.width.equalTo(self.mas_width).offset(-20);
        make.height.equalTo(@btHeght);
        if (lastView) {
            make.top.equalTo(lastView.mas_bottom).offset(0);
        }else{
            make.top.equalTo(@0);
        }
    }];
    
    [self updateViewHeight];
    
}

-(IBAction)removeClick:(UIControl *)sender{
    
    UIControl *clickControl=(UIControl *)[sender superview];
    
    NSInteger i=[self.arrayM indexOfObject:clickControl];
    
    if (self.arrayM.lastObject==clickControl) {
        //最后一个  删除自己 更新高
        
    }else if (self.arrayM.firstObject==clickControl){
        // 第一个 删除自己 更第二个的高 更新高
        UIControl *nextControl=[self.arrayM objectAtIndex:i+1];
        [nextControl removeConstraintByType:NSLayoutAttributeTop];
        [nextControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@0);
        }];
    }else{
        //中间的
        UIControl *nextControl=[self.arrayM objectAtIndex:i+1];
        UIControl *preControl=[self.arrayM objectAtIndex:i-1];
        [nextControl removeConstraintByType:NSLayoutAttributeTop];
        [nextControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(preControl.mas_bottom);
        }];
//       不是第一个 而且也不是最后一个 三处
    }
    
    [clickControl removeFromSuperview];
    [self.arrayM removeObject:clickControl];
    [self updateViewHeight];
}

-(void)updateViewHeight{
    
    [self.constraintBottom uninstall];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.arrayM.count*btHeght).priorityMedium();
        if (self.arrayM.lastObject)
      self.constraintBottom=  make.bottom.equalTo(self.arrayM.lastObject.mas_bottom);
    }];
    
}



@end
