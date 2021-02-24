//
//  ViewController.m
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/23.
//

#import "ViewController.h"
#import "ZYBSelfStudyRoomCollectionViewCell.h"
#import "Model.h"
#import "ZYBSelfStudyRoomVideoView.h"
#import "ZYBSelfStudyRoomTopView.h"

@interface ViewController ()

@property (nonatomic, strong) ZYBSelfStudyRoomTopView *topView;
@property (nonatomic, strong) ZYBSelfStudyRoomVideoView *videoView;

@property (nonatomic, strong) UIView *chatView;

@property (nonatomic, strong) RoomVideoTimeFrame *videoFrame;

@end

@implementation ViewController

#define WEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationController.navigationBarHidden = YES;
    
    [self.view addSubview:self.topView];
    [self.view addSubview:self.chatView];
    [self.view addSubview:self.videoView];
}

- (void)updateFrameWithVideoHeight:(CGFloat)videoHeight {
    [UIView animateWithDuration:0.3 animations:^{
        self.videoView.frame = CGRectMake(0, 68, self.view.frame.size.width, videoHeight);
        self.chatView.frame = CGRectMake(0, videoHeight + 68, self.view.frame.size.width, self.view.frame.size.height - videoHeight - 68);
    }];
}

- (ZYBSelfStudyRoomVideoView *)videoView {
    if (!_videoView) {
        _videoView.videoHeight = ^(CGFloat height) {
            [self updateFrameWithVideoHeight:height];
        };
        _videoView = [[ZYBSelfStudyRoomVideoView alloc] initWithFrame:CGRectMake(0, 68, self.view.frame.size.width, self.videoFrame.videoHeight)];
    }
    return _videoView;
}

- (RoomVideoTimeFrame *)videoFrame {
    if (!_videoFrame) {
        _videoFrame = [[RoomVideoTimeFrame alloc] init];
        _videoFrame.isBig = YES;
    }
    return _videoFrame;
}

- (ZYBSelfStudyRoomTopView *)topView {
    if (!_topView) {
        _topView = [[ZYBSelfStudyRoomTopView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 48)];
    }
    return _topView;
}

- (UIView *)chatView {
    if (!_chatView) {
        _chatView = [[UIView alloc] initWithFrame:CGRectMake(0, 68 + self.videoFrame.videoHeight, self.view.frame.size.width, self.view.frame.size.height - self.videoFrame.videoHeight - 68)];
        _chatView.backgroundColor = [UIColor redColor];
    }
    return _chatView;
}



@end

/*
 
 //- (void)changeBig {
 //    self.isBig = !_isBig;
 //}

 //- (void)setIsBig:(BOOL)isBig {
 //    _isBig = isBig;
 //    [self.collectionView reloadData];
 //}
 #pragma mark - UICollectionView delegate
 - (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
     ZYBSelfStudyRoomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZYBSelfStudyRoomCollectionViewCell" forIndexPath:indexPath];
     cell.model = [self.data objectAtIndex:indexPath.row];
     return cell;
 }

 - (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     return self.data.count;
 }

 - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
     
 }

 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
     if (_isBig) {
         CGFloat width = self.view.frame.size.width - 3;
         CGFloat sizeWidth = width / 4;
         CGFloat sizeHeith = sizeWidth * 3 / 4;
         if (indexPath.row == 0) {
             return CGSizeMake(self.view.frame.size.width, self.view.frame.size.width * 3 / 4);
         }else {
             return CGSizeMake(sizeWidth, sizeHeith);
         }
     }else {
         CGFloat width = self.view.frame.size.width - 2;
         CGFloat sizeWidth = width / 3;
         CGFloat sizeHeith = sizeWidth * 3 / 4;
         return CGSizeMake(sizeWidth, sizeHeith);
     }
 }

 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
     return 1;
 }

 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
     return 0.5;
 }

 - (UICollectionView *)collectionView{
     if (!_collectionView) {
         CGFloat width = self.view.frame.size.width - 2;
         CGFloat sizeWidth = width / 3;
         CGFloat sizeHeith = sizeWidth * 3 / 4;
 //
         UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
         layout.scrollDirection = UICollectionViewScrollDirectionVertical;
 //        layout.itemSize = CGSizeMake(sizeWidth, sizeHeith);
 //        layout.minimumInteritemSpacing = 0.5;
 //        layout.minimumLineSpacing = 1;
 //        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
         
         _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, sizeHeith * 3 + 2) collectionViewLayout:layout];
         _collectionView.delegate = self;
         _collectionView.dataSource = self;
         _collectionView.pagingEnabled = YES;
         _collectionView.bounces = NO;
         _collectionView.showsHorizontalScrollIndicator = NO;
 //        if([UIDevice systemVersion] >= 10){
 //            _collectionView.prefetchingEnabled = NO;
 //        }
         [_collectionView registerClass:[ZYBSelfStudyRoomCollectionViewCell class] forCellWithReuseIdentifier:@"ZYBSelfStudyRoomCollectionViewCell"];
         [self.view addSubview:_collectionView];
     }
     return _collectionView;
 }
 */
