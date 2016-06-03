//
//  ViewController.m
//  TimeNote
//
//  Created by Luoliang on 16/4/29.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

#define itemWidth [UIScreen mainScreen].bounds.size.width/5.f-60/5.f

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate,CLLocationManagerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UICollectionView * collectionView;
@property (strong, nonatomic) CLLocationManager *locManager;
@property (nonatomic, strong) NSArray * arrayForRecordStyle;
@end

@implementation ViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
   [super viewDidLoad];
   self.view.backgroundColor=[UIColor whiteColor];
   self.edgesForExtendedLayout=UIRectEdgeTop;
   
   [self.locManager startUpdatingLocation];
   
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   return 11;
}

- (MyCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
   MyCell *cell=(MyCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCell"];
   if (cell==nil) {
      cell=[MyCell viewFromXib];
   }
   return cell;
}



- (void)dealloc {
   //停止定位服务
   [self.locManager stopUpdatingLocation];
}
#pragma mark - 界面
#pragma mark - getters and setters
-(UICollectionView *)collectionView{
   if (_collectionView==nil) {
      
      UICollectionViewFlowLayout *layout2=[[UICollectionViewFlowLayout alloc] init];
      [layout2 setScrollDirection:UICollectionViewScrollDirectionHorizontal];
      
      layout2.itemSize=CGSizeMake(itemWidth, itemWidth);
      layout2.minimumLineSpacing=10;
      layout2.minimumInteritemSpacing=10;
      layout2.sectionInset=UIEdgeInsetsMake(0,(10+itemWidth)*2+10, 0, (10+itemWidth)*2+10);
      
      _collectionView=[[UICollectionView alloc]initWithFrame:self.view.frame collectionViewLayout:layout2];
      
      _collectionView.backgroundColor=[UIColor whiteColor];
      _collectionView.decelerationRate=UIScrollViewDecelerationRateFast;
      NSLog(@"UIScrollViewDecelerationRateNormal is %f UIScrollViewDecelerationRateFast is  %f",UIScrollViewDecelerationRateNormal,UIScrollViewDecelerationRateFast);
      _collectionView.showsVerticalScrollIndicator=NO;
      _collectionView.showsHorizontalScrollIndicator=NO;
      
      UINib *nib=[UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
      [_collectionView registerNib:nib forCellWithReuseIdentifier:NSStringFromClass([CollectionViewCell class])];
      _collectionView.delegate=self;
      _collectionView.dataSource=self;
      
   }
   return _collectionView;
}
-(CLLocationManager *)locManager{
   if (_locManager==nil) {
      _locManager = [[CLLocationManager alloc] init];
      _locManager.delegate = self;
      _locManager.desiredAccuracy = kCLLocationAccuracyBest; //控制定位精度,越高耗电量越大。
      _locManager.distanceFilter =1; //控制定位服务更新频率。单位是“米”
      [_locManager startUpdatingLocation];
      if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
         [_locManager requestWhenInUseAuthorization];  //调用了这句,就会弹出允许框了.
   }return _locManager;
   
}
-(NSArray *)arrayForRecordStyle{
   if (_arrayForRecordStyle==nil) {
      _arrayForRecordStyle=@[@"运动",@"学习",@"娱乐",@"休息",@"运动",@"学习",@"娱乐",@"休息"];
   }return _arrayForRecordStyle;
}
#pragma mark - 系统delegate
//scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
   //   NSLog(@"contentSize is %@",NSStringFromCGSize(scrollView.contentSize));
   //   NSLog(@"contentOffset is %@",NSStringFromCGPoint(scrollView.contentOffset));
   
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
   
   NSLog(@"开始了scrollViewWillBeginDecelerating %f",scrollView.decelerationRate);
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   NSLog(@"开始了scrollViewDidEndDecelerating");
   [self setOffset:scrollView];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
   NSLog(@"is decelerate %@ ",decelerate?@"yes":@"no");
   
   if (decelerate) {
      
   }else{
      [self setOffset:scrollView];
   }
   
}
//collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
   return self.arrayForRecordStyle.count;
}
- (CollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
   CollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CollectionViewCell class]) forIndexPath:indexPath];
   cell.contentView.backgroundColor=[UIColor getRandomColor];
   cell.titleLabel.text=self.arrayForRecordStyle[indexPath.row];
   return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
   
   //   CollectionViewCell *cell=(CollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
   //   NSLog(@"%@ NSStringFromCGRect is %@ ",cell.titleLabel.text,NSStringFromCGRect(cell.frame));
   
   UICollectionViewLayoutAttributes *attribute=[collectionView.collectionViewLayout layoutAttributesForItemAtIndexPath:indexPath];
   NSLog(@"%@",NSStringFromCGRect(attribute.frame));
   
   ;
//   if (collectionView.contentSize.width<=collectionView.frame.size.width)return;
   CGFloat offsetX=CGRectGetMidX(attribute.frame);
   CGFloat halfWidth=[UIScreen mainScreen].bounds.size.width/2.f;
   CGFloat maxWidth=collectionView.contentSize.width;
   
   if (offsetX>halfWidth && (offsetX+halfWidth)<maxWidth) {
      [collectionView setContentOffset:CGPointMake(offsetX-halfWidth, 0) animated:YES];
   }else if(offsetX<=halfWidth){
      [collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
   }else if((offsetX+halfWidth)>=maxWidth){
      [collectionView setContentOffset:CGPointMake(maxWidth-collectionView.frame.size.width, 0) animated:YES];
   }
   
   
   
}
//地图
//协议中的方法，作用是每当位置发生更新时会调用的委托方法
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
   //结构体，存储位置坐标
   CLLocationCoordinate2D loc = [newLocation coordinate];
   float longitude = loc.longitude;
   float latitude = loc.latitude;
   self.lonLabel.text = [NSString stringWithFormat:@"%f",longitude];
   self.latLabel.text = [NSString stringWithFormat:@"%f",latitude];
   
}
//当位置获取或更新失败会调用的方法
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
   NSString *errorMsg = nil;
   if ([error code] == kCLErrorDenied) {
      errorMsg = @"访问被拒绝";
   }
   if ([error code] == kCLErrorLocationUnknown) {
      errorMsg = @"获取位置信息失败";
   }
   
   UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Location"
                                                      message:errorMsg delegate:self cancelButtonTitle:@"Ok"otherButtonTitles:nil, nil];
   [alertView show];
}
#pragma mark - 自定义delegate
#pragma mark - 共有方法
#pragma mark - 私有方法
- (IBAction)dismiss:(UIControl *)sender{
   [sender removeFromSuperview];
}
- (void)setOffset:(UIScrollView *)scrollView{
   CGPoint offset=scrollView.contentOffset;
   CGFloat xOffset=offset.x;
   CGFloat x=fmod(xOffset,itemWidth+10);
   CGFloat midx=(itemWidth+10)/2.f;
   
   if (x>midx) {
      CGFloat toLocation=offset.x+itemWidth-x+10;
      [scrollView setContentOffset:CGPointMake(toLocation, 0) animated:YES];
   }else if(x<=midx){
      [scrollView setContentOffset:CGPointMake(offset.x-x, 0) animated:YES];
      
   }
}
#pragma mark - 事件响应方法
- (IBAction)checkRecord:(id)sender {
   //   防止重复
   [self.collectionView.superview removeFromSuperview];
   //   添加选项
   UIControl *backGround=[UIControl new];
   backGround.backgroundColor=[UIColor colorWithWhite:0 alpha:0.7];
   [backGround addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
   [self.view addSubview:backGround];
   [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
      make.edges.equalTo(backGround.superview);
   }];
   [backGround addSubview:self.collectionView];
   [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
      make.top.equalTo(@64);
      make.left.right.equalTo(self.collectionView.superview);
      make.height.equalTo(@100);
   }];
   
}
- (IBAction)addRecord:(id)sender {
   self.view.backgroundColor=[UIColor whiteColor];
}
@end
