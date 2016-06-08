//
//  UIView+Extension.m
//  TimeNote
//
//  Created by Luoliang on 16/5/30.
//  Copyright © 2016年 Luoliang. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

+(instancetype)viewFromXib{
    NSLog(@"%@",NSStringFromClass([self class]));
    UINib *nib=[UINib nibWithNibName:ViewXibString bundle:nil];
    NSArray *array2=[nib instantiateWithOwner:self options:nil];
    if (array2.count>0) {
        __block id view;
        [array2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:[self class]]) {
                view=obj;
                *stop=YES;
            }
        }];
        return view;
    }else{
        return nil;
    }
}

-(void)removeConstraintByType:(NSLayoutAttribute )type{
    
    NSArray *installedConstraints = [MASViewConstraint installedConstraintsForView:self];
    for (MASViewConstraint *constraint in installedConstraints) {
        //        [constraint uninstall];
        id obj=[constraint valueForKeyPath:@"firstViewAttribute.layoutAttribute"];
        NSLayoutAttribute attribute=[obj integerValue];
        if (attribute==type) {
            [constraint uninstall];
            break;
        }
        
    }
}


@end
