//
//  ZYBSelfStudyRoomVideoItemView.h
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^clickIndex)(NSInteger index);

@class Model;
@interface ZYBSelfStudyRoomVideoItemView : UIView

@property (nonatomic, strong) Model *model;

@property (nonatomic, assign) NSInteger index;//写死的位置

@property (nonatomic, assign) NSInteger currentIndex;//放大之后的位置

@property (nonatomic, copy) clickIndex clickIndex;

@end

NS_ASSUME_NONNULL_END
