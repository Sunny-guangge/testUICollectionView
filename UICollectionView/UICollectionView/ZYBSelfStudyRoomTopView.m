//
//  ZYBSelfStudyRoomTopView.m
//  UICollectionView
//
//  Created by wangshuaiguang on 2021/2/24.
//

#import "ZYBSelfStudyRoomTopView.h"
#import <Masonry/Masonry.h>

@interface ZYBSelfStudyRoomTopView ()

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) UIButton *moreButton;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZYBSelfStudyRoomTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self setupUI];
        [self setmessage];
    }
    return self;
}

- (void)setmessage {
    NSString *title = @"中考备考自习室";
    NSString *num = @"  |  36人";
    NSString *allTitle = [NSString stringWithFormat:@"%@%@",title,num];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:allTitle];
    NSRange attributeRange1 = [allTitle rangeOfString:title];
    NSRange attributeRange2 = [allTitle rangeOfString:num];
    [string setAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range:attributeRange1];
    [string setAttributes:@{NSForegroundColorAttributeName : [UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:12]} range:attributeRange2];
    NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
    para.alignment = NSTextAlignmentCenter;
    
    [string addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, string.string.length)];
    
    CGFloat width = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 34) options:NSStringDrawingUsesLineFragmentOrigin context:NULL].size.width + 24;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(width));
    }];
    self.titleLabel.attributedText = string;
}

- (void)setupUI {
    [self addSubview:self.titleLabel];
    [self addSubview:self.closeButton];
    [self addSubview:self.moreButton];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.height.equalTo(@34);
        make.left.equalTo(@12);
    }];
    
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.height.equalTo(@24);
        make.right.equalTo(@-12);
    }];
    
    [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.width.height.equalTo(@24);
        make.right.equalTo(@-53);
    }];
}

- (void)closeLiveRoom {
    if (self.close) {
        self.close();
    }
}

- (void)checkMoreMessage {
    if (self.more) {
        self.more();
    }
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 7, 24, 34)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.backgroundColor = [UIColor yellowColor];
        _titleLabel.layer.maskedCorners = YES;
        _titleLabel.layer.cornerRadius = 17;
    }
    return _titleLabel;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"self_study_room_close"] forState:UIControlStateNormal];
        [_closeButton setImage:[UIImage imageNamed:@"self_study_room_close"] forState:UIControlStateSelected];
        [_closeButton addTarget:self action:@selector(closeLiveRoom) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _closeButton;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setImage:[UIImage imageNamed:@"self_study_room_more"] forState:UIControlStateNormal];
        [_moreButton setImage:[UIImage imageNamed:@"self_study_room_more"] forState:UIControlStateSelected];
        [_moreButton addTarget:self action:@selector(checkMoreMessage) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreButton;
}


@end
