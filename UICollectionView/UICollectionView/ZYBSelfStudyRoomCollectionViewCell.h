//
//  ZYBSelfStudyRoomCollectionViewCell.h
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^clickIndex)(NSInteger index);

@class Model;
@interface ZYBSelfStudyRoomCollectionViewCell : UIView

@property (nonatomic, strong) Model *model;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, copy) clickIndex clickIndex;

@end

NS_ASSUME_NONNULL_END
