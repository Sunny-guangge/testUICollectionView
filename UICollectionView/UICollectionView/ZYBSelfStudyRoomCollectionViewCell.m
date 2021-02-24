//
//  ZYBSelfStudyRoomCollectionViewCell.m
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/23.
//

#import "ZYBSelfStudyRoomCollectionViewCell.h"
#import "Model.h"
#import <Masonry/Masonry.h>

@interface ZYBSelfStudyRoomCollectionViewCell ()

@property (nonatomic, strong) UIImageView *titleImageView;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView *renderView;
@property (nonatomic, strong) UIImageView *blankImageView;
@property (nonatomic, strong) UIButton *clickButton;

@end

@implementation ZYBSelfStudyRoomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.renderView];
    [self.renderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    self.renderView.hidden = YES;
    
    [self addSubview:self.blankImageView];
    [self.blankImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(58);
        make.height.mas_equalTo(55);
    }];
    self.blankImageView.hidden = YES;
    
    [self addSubview:self.titleImageView];
    [self.titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(32);
        make.height.mas_equalTo(18);
        make.left.top.mas_equalTo(8);
    }];
    
    [self addSubview:self.backView];
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(8);
        make.bottom.mas_equalTo(-6);
        make.width.mas_equalTo(74);
        make.height.mas_equalTo(20);
    }];
    self.backView.hidden = YES;
    
    [self.backView addSubview:self.avatarImageView];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(20);
    }];
    [self.backView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarImageView.mas_right);
        make.right.top.bottom.equalTo(self.backView);
    }];
    
    [self addSubview:self.clickButton];
    [self.clickButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

- (void)setModel:(Model *)model {
    _model = model;
    self.titleImageView.hidden = !model.isXueWei;
    self.backView.hidden = !model.time;
    self.blankImageView.hidden = model.time;
    self.renderView.hidden = !model.time;
    self.renderView.backgroundColor = model.time ? [UIColor whiteColor] : [UIColor blackColor];
    self.timeLabel.text = [self getMMSSFromSS:model.time];
}

- (void)clickCurrentView {
    if (self.clickIndex) {
        self.clickIndex(self.index);
    }
}

-(NSString *)getMMSSFromSS:(NSInteger )seconds{
    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    return format_time;
}

- (UIView *)renderView {
    if (!_renderView) {
        _renderView = [[UIView alloc] init];
        _renderView.backgroundColor = [UIColor blackColor];
    }
    return _renderView;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 72, 20)];
        _backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:_backView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:_backView.bounds.size];
        CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
        maskLayer.frame=_backView.bounds;
        maskLayer.path=maskPath.CGPath;
        _backView.layer.mask=maskLayer;
    }
    return _backView;
}

- (UIImageView *)avatarImageView{
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        _avatarImageView.backgroundColor = [UIColor blueColor];
        
        UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:_avatarImageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:_avatarImageView.bounds.size];
        CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
        maskLayer.frame=_avatarImageView.bounds;
        maskLayer.path=maskPath.CGPath;
        _avatarImageView.layer.mask=maskLayer;
    }
    return _avatarImageView;
}

- (UIImageView *)blankImageView{
    if (!_blankImageView) {
        _blankImageView = [[UIImageView alloc] init];
        _blankImageView.image = [UIImage imageNamed:@"self_study_room_blank_room"];
    }
    return _blankImageView;
}

- (UIImageView *)titleImageView{
    if (!_titleImageView) {
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 18)];
        _titleImageView.backgroundColor = [UIColor redColor];
        UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:_titleImageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:_titleImageView.bounds.size];
        CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
        maskLayer.frame=_titleImageView.bounds;
        maskLayer.path=maskPath.CGPath;
        _titleImageView.layer.mask=maskLayer;
    }
    return _titleImageView;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor whiteColor];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
        _timeLabel.font = [UIFont systemFontOfSize:10];
    }
    return _timeLabel;
}

- (UIButton *)clickButton {
    if (!_clickButton) {
        _clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_clickButton addTarget:self action:@selector(clickCurrentView) forControlEvents:UIControlEventTouchUpInside];
    }
    return _clickButton;
}

@end
