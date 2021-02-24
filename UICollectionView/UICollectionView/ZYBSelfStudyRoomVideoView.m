//
//  ZYBSelfStudyRoomVideoView.m
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/24.
//

#import "ZYBSelfStudyRoomVideoView.h"
#import "ZYBSelfStudyRoomVideoItemView.h"
#import "Model.h"

@implementation RoomVideoTimeFrame

- (NSInteger)lineNum {
    if (self.isBig) {
        return 4;
    }
    return 3;
}

- (NSInteger)totalNum {
    return 9;
}

- (CGFloat)itemWidth {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (self.isBig) {
        return (width - self.lineNum + 1) / self.lineNum;
    }else {
        return (width - self.lineNum + 1) / self.lineNum;
    }
}

- (CGFloat)itemHeight {
    return self.itemWidth * 3 / 4;
}

- (CGFloat)bigItemHeight {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (self.isBig) {
        return width * 3 / 4;
    }
    return 0;
}

- (CGFloat)videoHeight {
    if (self.isBig) {
        return self.itemHeight * 2 + 2 + self.bigItemHeight;
    }else {
        return self.itemHeight * 3 + 2;
    }
}

- (CGRect)checkFrameByIndex:(NSInteger)index {
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    if (self.isBig) {
        if (index == 0) {
            return CGRectMake(0, 0, width, self.bigItemHeight);
        }else {
            CGFloat x = 0;
            CGFloat y = self.bigItemHeight + 1;
            NSInteger newIndex = index - 1;
            NSInteger yushu = newIndex % self.lineNum;
            CGFloat shang = newIndex / self.lineNum;
            if (yushu == 0) {
                if (newIndex != 0) {
                    y += (self.itemHeight * shang + 1.0 * shang);
                    x = 0;
                }
            }else {
                y += (self.itemHeight * shang + 1.0 * shang);
                x += (self.itemWidth * yushu + 1.0 * yushu);
            }
            return CGRectMake(x, y, self.itemWidth, self.itemHeight);
        }
    }else {
        CGFloat x = 0;
        CGFloat y = 0;
        CGFloat yushu = index % self.lineNum;
        CGFloat shang = index / self.lineNum;
        if (yushu == 0) {
            if (index != 0) {
                y += (self.itemHeight * shang + 1.0 * shang);
                x = 0;
            }
        }else {
            y += (self.itemHeight * shang + 1.0 * shang);
            x += (self.itemWidth * yushu + 1.0 * yushu);
        }
        return CGRectMake(x, y, self.itemWidth, self.itemHeight);
    }
}

@end

@interface ZYBSelfStudyRoomVideoView ()

@property (nonatomic, assign) BOOL isBig;//正在放大某个视频区域

@property (nonatomic, strong) NSMutableArray *data;

@property (nonatomic, strong) RoomVideoTimeFrame *videoFrame;

@end

@implementation ZYBSelfStudyRoomVideoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.videoFrame.isBig = YES;
    for (NSInteger i=0; i<self.videoFrame.totalNum; i++) {
        ZYBSelfStudyRoomVideoItemView *itemView = [[ZYBSelfStudyRoomVideoItemView alloc] initWithFrame:[self.videoFrame checkFrameByIndex:i]];
        itemView.index = i;
        itemView.model = [self getModelByIndex:i];
        itemView.clickIndex = ^(NSInteger index) {
            NSLog(@"%ld",index);
        };
        [self addSubview:itemView];
    }
    if (self.videoHeight) {
        self.videoHeight(self.videoFrame.videoHeight);
    }
}

- (void)refreshItemPosition {
    
}

- (Model *)getModelByIndex:(NSInteger )index {
    for (Model *model in self.data) {
        if (model.index == index) {
            return model;
        }
    }
    return nil;
}

- (RoomVideoTimeFrame *)videoFrame {
    if (!_videoFrame) {
        _videoFrame = [[RoomVideoTimeFrame alloc] init];
    }
    return _videoFrame;
}

- (NSMutableArray *)data {
    if (!_data) {
        _data = [NSMutableArray array];
        Model *model1 = [[Model alloc] init];
        model1.isXueWei = YES;
        model1.time = 800;
        model1.index = 0;
        [_data addObject:model1];
        
        Model *model2 = [[Model alloc] init];
        model2.isXueWei = NO;
        model2.time = 300;
        model2.index = 1;
        [_data addObject:model2];
        
        Model *model3 = [[Model alloc] init];
        model3.isXueWei = NO;
        model3.time = 500;
        model3.index = 2;
        [_data addObject:model3];
        
        Model *model4 = [[Model alloc] init];
        model4.isXueWei = NO;
        model4.time = 300;
        model4.index = 3;
        [_data addObject:model4];
        
        Model *model5 = [[Model alloc] init];
        model5.isXueWei = NO;
        model5.time = 900;
        model5.index = 4;
        [_data addObject:model5];
        
        Model *model6 = [[Model alloc] init];
        model6.isXueWei = NO;
        model6.time =90;
        model6.index = 5;
        [_data addObject:model6];
        
        Model *model7 = [[Model alloc] init];
        model7.isXueWei = NO;
        model7.time = 1000;
        model7.index = 6;
        [_data addObject:model7];
        
        Model *model8 = [[Model alloc] init];
        model8.isXueWei = NO;
        model8.time = 109;
        model8.index = 7;
        [_data addObject:model8];
        
        Model *model9 = [[Model alloc] init];
        model9.isXueWei = NO;
        model9.time = 0;
        model9.index = 8;
        [_data addObject:model9];
    }
    return _data;
}


@end
