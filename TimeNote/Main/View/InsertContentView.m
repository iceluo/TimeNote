//
//  InsertContentView.m
//  TimeNote
//
//  Created by Luoliang on 16/6/3.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "InsertContentView.h"
#import "MASViewConstraint.h"

@interface InsertContentView()
@property (nonatomic, strong) NSMutableArray * arrayM;

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


- (instancetype)init
{
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

    UIButton *bt=[self getButton];
    
    [self addSubview:bt];
    [self.arrayM addObject:bt];
    
    [bt mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@30);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        if (lastView) {
            make.top.equalTo(lastView.mas_bottom).offset(0);
        }else{
            make.top.equalTo(@0);
        }
    }];
    
    [self.constraintBottom uninstall];
    [self mas_updateConstraints:^(MASConstraintMaker *make) {
        self.constraintHeight=make.height.mas_equalTo(self.arrayM.count*100).priorityMedium();
        self.constraintBottom= make.bottom.equalTo(bt);
    }];

}


-(UIButton *)getButton{
    UIButton *bt=[UIButton new];
    bt.backgroundColor=[UIColor getRandomColor];
    [bt addTarget:self action:@selector(btClick:) forControlEvents:UIControlEventTouchUpInside];
    return bt;
}

-(void)updateConstraints{
//    NSLog(@"updateConstraints %@",NSStringFromCGRect(self.frame));
//    NSArray *installedConstraints = [MASViewConstraint installedConstraintsForView:self.lastView];
//    for (MASConstraint *constraint in installedConstraints) {
//        [constraint setValue:@50 forKey:@"layoutConstant"];
//    }
//    
//    self.constraintHeight.mas_equalTo(self.arrayM.count*100);
//    [self.constraintBottom uninstall];
    [super updateConstraints];
}


@end
