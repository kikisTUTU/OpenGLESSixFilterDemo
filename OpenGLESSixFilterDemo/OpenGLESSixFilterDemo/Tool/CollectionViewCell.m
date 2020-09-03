//
//  CollectionViewCell.m
//  滤镜分屏特效
//
//  Created by 图图 on 2020/8/11.
//  Copyright © 2020 图图. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()
@property (nonatomic, strong) UILabel *label;
@end

@implementation CollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        self.label = [[UILabel alloc] initWithFrame:self.bounds];
        self.label.frame = CGRectInset(self.label.frame, 10, 10);
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont boldSystemFontOfSize:15];
        self.label.layer.masksToBounds = YES;
        self.label.layer.cornerRadius = 15;
        
        [self addSubview:self.label];
        
    }
    return self;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.label.text = title;
}
- (void)setIsSelect:(BOOL)isSelect {
    _isSelect = isSelect;
    self.label.backgroundColor = isSelect ? [UIColor blackColor] : [UIColor clearColor];
    self.label.textColor = isSelect ? [UIColor whiteColor] : [UIColor blackColor];
}
@end
