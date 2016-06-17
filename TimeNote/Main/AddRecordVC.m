//
//  HomePageVC.m
//  TimeNote
//
//  Created by Luoliang on 16/6/1.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "AddRecordVC.h"

@interface AddRecordVC ()
@property (weak, nonatomic) IBOutlet UIView *tableView;

@property (nonatomic, weak) UIView * lastView;



@end

@implementation AddRecordVC

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor orangeColor];
    
    [self setUI];
    
}
- (void)setUI{
    
    InsertItemView *view=[InsertItemView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        make.top.equalTo(@100);
        make.height.equalTo(@60);
    }];
    
    [view addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    InsertContentView *contentView=[InsertContentView new];
    [self.view addSubview:contentView];
    contentView.backgroundColor=[UIColor colorWithHexString:@"dddddd"];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_bottom).offset(10);
        make.left.right.equalTo(@0);
        make.bottom.lessThanOrEqualTo(self.view).offset(-100);
//        make.height.equalTo(@140);
    }];
}
#pragma mark - 界面
#pragma mark - getters and setters
#pragma mark - 系统delegate
#pragma mark - 自定义delegate
#pragma mark - 共有方法
#pragma mark - 私有方法
#pragma mark - 事件响应方法
-(IBAction)move:(UIControl *)sender{
//    sender.frame=CGRectOffset(sender.frame, 0, 10);

//    static int i=0;
//    i++;
//    if (i%2==1) {
//        [sender mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(300  , 44));
//            make.center.equalTo(self.view);
//        }];
//    }else if (i%2==0){
//        [sender mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(200, 88));
//            make.left.top.equalTo(@19);
//        }];
//
//    }
    
   
    
}
@end
