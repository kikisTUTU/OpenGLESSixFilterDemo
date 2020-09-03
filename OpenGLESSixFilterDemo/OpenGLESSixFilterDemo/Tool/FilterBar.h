//
//  FilterBar.h
//  滤镜分屏特效
//
//  Created by 图图 on 2020/8/11.
//  Copyright © 2020 图图. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FilterBar;

@protocol FilterBarDelegate <NSObject>
-(void)selectBar:(FilterBar *)bar didScrollToIndex:(NSInteger)index;
@end

@interface FilterBar : UIView
@property (nonatomic, copy)NSArray *dataSource;
@property (nonatomic, weak)id<FilterBarDelegate> delegate;
@end

