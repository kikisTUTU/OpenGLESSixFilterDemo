//
//  CollectionViewCell.h
//  滤镜分屏特效
//
//  Created by 图图 on 2020/8/11.
//  Copyright © 2020 图图. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) BOOL isSelect;
@end

NS_ASSUME_NONNULL_END
