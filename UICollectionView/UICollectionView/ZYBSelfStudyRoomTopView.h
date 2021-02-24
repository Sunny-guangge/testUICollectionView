//
//  ZYBSelfStudyRoomTopView.h
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^roomTopClose)(void);

typedef void(^roomTopMore)(void);

@interface ZYBSelfStudyRoomTopView : UIView

@property (nonatomic, copy) roomTopMore more;
@property (nonatomic, copy) roomTopClose close;

@end

NS_ASSUME_NONNULL_END
