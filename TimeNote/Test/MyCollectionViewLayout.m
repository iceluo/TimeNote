//
//  MyCollectionViewLayout.m
//  test01
//
//  Created by Luoliang on 16/5/9.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "MyCollectionViewLayout.h"

@interface MyCollectionViewLayout()
/**
 *  布局信息
 */
@property (nonatomic, strong) NSArray *layoutInfoArr;
/**
 *  内容尺寸
 */
@property (nonatomic, assign) CGSize contentSize;

@end

@implementation MyCollectionViewLayout



- (void)prepareLayout{
    [super prepareLayout];
    NSMutableArray *layoutInfoArr = [NSMutableArray array];
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger item = 0; item < numberOfItems; item++){
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:item inSection:0];
            UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
            [layoutInfoArr addObject:attributes];
        }
    self.layoutInfoArr = [layoutInfoArr copy];
}

- (CGSize)collectionViewContentSize{
    return self.collectionView.superview.frame.size;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *layoutAttributesArr = [NSMutableArray array];
        [self.layoutInfoArr enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if(CGRectIntersectsRect(obj.frame, rect)) {
                [layoutAttributesArr addObject:obj];
            }
        }];
    return layoutAttributesArr;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    CGFloat angle = 2 * M_PI * indexPath.item / numberOfItems;
    CGFloat radius = self.collectionView.frame.size.width / 2 - self.itemSize.width / 2.f;
    CGPoint point = self.collectionView.center;
    CGFloat width = radius * cos(angle);
    CGFloat height = radius * sin(angle);
    attributes.frame = CGRectMake(0,0 , self.itemSize.width, self.itemSize.height);
    attributes.center = CGPointMake(point.x+width, point.y+height);
    return attributes;
}


//当边界更改时是否更新布局
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    CGRect oldBounds = self.collectionView.bounds;
    
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds))
    {
        return YES;
    }
    
    return NO;
}

//通知布局，collection view里有元素即将改变，这里可以收集改变的元素indexPath和action类型。
//-(void)prepareForCollectionViewUpdates:(NSArray *)updateItems
//{
//    [super prepareForCollectionViewUpdates:updateItems];
//    NSMutableArray *indexPaths = [NSMutableArray array];
//    for(UICollectionViewUpdateItem *updateItem in updateItems)
//    {
//        //UICollectionUpdateActionInsert,
//        //UICollectionUpdateActionDelete,
//        //UICollectionUpdateActionReload,
//        //UICollectionUpdateActionMove,
//        //UICollectionUpdateActionNone
//        
//        NSLog(@"before index:%ld,after index:%ld,action:%ld", updateItem.indexPathBeforeUpdate.row,updateItem.indexPathAfterUpdate.row,(long)updateItem.updateAction);
//        
//        switch (updateItem.updateAction) {
//            case UICollectionUpdateActionInsert:
//                [indexPaths addObject:updateItem.indexPathAfterUpdate];
//                break;
//            case UICollectionUpdateActionDelete:
//                [indexPaths addObject:updateItem.indexPathBeforeUpdate];
//                break;
//            case UICollectionUpdateActionMove:
//                [indexPaths addObject:updateItem.indexPathBeforeUpdate];
//                [indexPaths addObject:updateItem.indexPathAfterUpdate];
//                break;
//            default:
//                NSLog(@"unhandled case: %@", updateItem);
//                break;
//        }
//    }
//    
////    self.indexPathsToAnimate = indexPaths;
//}

////当一个元素被插入collection view时，返回它的初始布局，这里可以加入一些动画效果。
- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    
/*
    if (itemIndexPath.row==self.delegate.arrayM.count-1)
    {
    
        attr.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(3,3),M_PI);
        attr.center = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMidY(self.collectionView.bounds));
    }
//*/
    
    return attr;
}


-(UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath{
    
    NSLog(@"%ld",itemIndexPath.row);
    
    UICollectionViewLayoutAttributes *attr = [self layoutAttributesForItemAtIndexPath:itemIndexPath];
    
    if (itemIndexPath.row==0) {
        attr.transform = CGAffineTransformRotate(CGAffineTransformMakeScale(0.3,0.3),M_PI);
        attr.center = CGPointMake(CGRectGetMidX(self.collectionView.bounds), CGRectGetMidY(self.collectionView.bounds));
    }
    
    return attr;
    
}
@end
