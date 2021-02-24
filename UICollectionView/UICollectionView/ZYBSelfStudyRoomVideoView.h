//
//  ZYBSelfStudyRoomVideoView.h
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^RoomVideoHeight)(CGFloat height);

@interface RoomVideoTimeFrame : NSObject

@property (nonatomic, assign) NSInteger lineNum;
@property (nonatomic, assign) NSInteger totalNum;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) BOOL isBig;
@property (nonatomic, assign) CGFloat videoHeight;
@property (nonatomic, assign) CGFloat bigItemHeight;

@end

@interface ZYBSelfStudyRoomVideoView : UIView

@property (nonatomic, copy) RoomVideoHeight videoHeight;

@end

NS_ASSUME_NONNULL_END
