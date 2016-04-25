//
//  LMVipMemberCell.m
//  LMVipMemberVC
//
//  Created by zhuo on 16/4/25.
//  Copyright © 2016年 com.lrts.zhuo. All rights reserved.
//

#import "LMVipMemberCell.h"
#define LINE_COLOR ([UIColor colorWithRed:228/255.0f green:228/255.0f blue:233/255.0f alpha:1.0f])

@interface LMVipMemberCell()

@property (nonatomic, strong) UILabel *cellMiddleLabel;
// lines
@property (nonatomic, strong) UIView *topWholeLine;
@property (nonatomic, strong) UIView *topPartLine;
@property (nonatomic, strong) UIView *bottomWholeLine;
@property (nonatomic, strong) UIView *bottomPartLine;

//vip权益
@property (nonatomic, strong) UIImageView *vipImageView;
@property (nonatomic, strong) UILabel *vipTitle;
@property (nonatomic, strong) UILabel *vipDes;

@end

@implementation LMVipMemberCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    
    return self;
}
- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
           cellType:(LMVipMemberCellType)type {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.cellType = type;
        self.backgroundColor = [UIColor whiteColor];
        
        // 1. title label
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:_titleLabel];
        
        // 2. middle label
        _cellMiddleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _cellMiddleLabel.backgroundColor = [UIColor clearColor];
        _cellMiddleLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:_cellMiddleLabel];
        
        // 顶部的边缘线
        _topWholeLine = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0.5)];
        _topWholeLine.backgroundColor = LINE_COLOR;
        [self.contentView addSubview:_topWholeLine];
        _topWholeLine.hidden = YES;
        
        _topPartLine = [[UIView alloc] initWithFrame:CGRectMake(15, 0, self.frame.size.width - 15, 0.5)];
        _topPartLine.backgroundColor = LINE_COLOR;
        [self.contentView addSubview:_topPartLine];
        _topPartLine.hidden = YES;
        
        // 3. 底部边缘线
        _bottomWholeLine = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5)];
        _bottomWholeLine.backgroundColor = LINE_COLOR;
        [self.contentView addSubview:_bottomWholeLine];
        _bottomWholeLine.hidden = YES;
        
        _bottomPartLine = [[UIView alloc] initWithFrame:CGRectMake(15, self.frame.size.height - 0.5, self.frame.size.width - 15, 0.5)];
        _bottomPartLine.backgroundColor = LINE_COLOR;
        [self.contentView addSubview:_bottomPartLine];
        _bottomPartLine.hidden = YES;
        
        if (type == LMVipMemberCellTypeMemberType) {
            _memberTypeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            _memberTypeLabel.backgroundColor = [UIColor clearColor];
            _memberTypeLabel.font = [UIFont systemFontOfSize:14.0f];
            //            _memberTypeLabel.textAlignment = NSTextAlignmentRight;
            _memberTypeLabel.textColor = [UIColor colorWithRed:0x87/255.0f green:0x87/255.0f blue:0x87/255.0f alpha:1.0f];
            [self.contentView addSubview:_memberTypeLabel];
            
        } else if (type == LMVipMemberCellTypeBalance) {
            _cellMiddleLabel.textColor = [UIColor colorWithRed:0x25/255.0f green:0xbf/255.0f blue:0xa0/255.0f alpha:1.0f];
            
            // right button 74x28
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [_rightButton setTitle:@"升级会员" forState:UIControlStateNormal];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setBackgroundImage:[UIImage imageNamed:@"switch_account"] forState:UIControlStateNormal];
            [_rightButton setBackgroundImage:[UIImage imageNamed:@"switch_account_click"] forState:UIControlStateHighlighted];
            [_rightButton addTarget:self action:@selector(didClickRightButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_rightButton];
            
        } else if (type == LMVipMemberCellTypeIntegration) {
            //            _cellMiddleLabel.textColor = [UIColor colorWithRed:0x25/255.0f green:0xbf/255.0f blue:0xa0/255.0f alpha:1.0f];
            
            _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 6, 0, 9, 15)];
            [_rightImageView setImage:[UIImage imageNamed:@"more_icon"]];
            [self.contentView addSubview:_rightImageView];
            
        } else if (type == LMVipMemberCellTypeVip) {
            
            // right button 74x28
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _rightButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            [_rightButton setTitle:@"购买" forState:UIControlStateNormal];
            [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [_rightButton setBackgroundImage:[UIImage imageNamed:@"purchase_button"] forState:UIControlStateNormal];
            [_rightButton setBackgroundImage:[UIImage imageNamed:@"purchase_click_button"] forState:UIControlStateHighlighted];
            [_rightButton addTarget:self action:@selector(didClickRightButton:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_rightButton];
        }else if (type == LMVipMemberCellTypeVipDes) {
            _vipImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
            [self.contentView addSubview:_vipImageView];
            
            _vipTitle = [[UILabel alloc] initWithFrame:CGRectZero];
            _vipTitle.backgroundColor = [UIColor clearColor];
            _vipTitle.font = [UIFont systemFontOfSize:15.0f];
            _vipTitle.textColor = [UIColor colorWithRed:0x00/255.0f green:0x00/255.0f blue:0x00/255.0f alpha:1.0f];
            [self.contentView addSubview:_vipTitle];
            
            _vipDes = [[UILabel alloc] initWithFrame:CGRectZero];
            _vipDes.backgroundColor = [UIColor clearColor];
            _vipDes.font = [UIFont systemFontOfSize:12.0f];
            _vipDes.textColor = [UIColor colorWithRed:0x87/255.0f green:0x87/255.0f blue:0x87/255.0f alpha:1.0f];
            [self.contentView addSubview:_vipDes];
            
        } else {
            _titleLabel.textColor = [UIColor colorWithRed:113/255.0 green:113/255.0 blue:113/255.0 alpha:1.0f];
            _titleLabel.font = [UIFont systemFontOfSize:14.0f];
        }
    }
    return self;
}

- (void)layoutSubviews
{
    // lines
    _topPartLine.frame     = CGRectMake(15, 0, self.frame.size.width - 15, 0.5);
    _topWholeLine.frame    = CGRectMake(0, 0, self.frame.size.width, 0.5);
    _bottomPartLine.frame  = CGRectMake(15, self.frame.size.height - 0.5, self.frame.size.width - 15, 0.5);
    _bottomWholeLine.frame = CGRectMake(0, self.frame.size.height - 0.5, self.frame.size.width, 0.5);
    
    // 1. title label
    self.titleLabel.frame = CGRectMake(15, 0, 90, self.frame.size.height);
    self.cellMiddleLabel.frame = CGRectMake(105, 0, 90, self.frame.size.height);
    
    if (self.cellType == LMVipMemberCellTypeMemberType) {
        self.memberTypeLabel.frame = CGRectMake(self.frame.size.width - 15 - 80, 0, 80, self.frame.size.height);
    } else if (self.cellType == LMVipMemberCellTypeBalance) {
        self.rightButton.frame = CGRectMake(self.frame.size.width - 15 - 74, (self.frame.size.height - 28)/2, 74, 28);
    } else if (self.cellType == LMVipMemberCellTypeVip) {
        self.rightButton.frame = CGRectMake(self.frame.size.width - 15 - 59, (self.frame.size.height - 28)/2, 59, 28);
    } else if (self.cellType == LMVipMemberCellTypeTitle) {
        self.titleLabel.frame = CGRectMake(15, 22, 200, 14);
        self.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:244/255.0 alpha:1.0f];
    } else if (self.cellType == LMVipMemberCellTypeVipDes){
        self.vipImageView.frame = CGRectMake(15, 10, 40, 40);
        self.vipTitle.frame = CGRectMake(67, 10, 200, 24);
        self.vipDes.frame = CGRectMake(67, 34, 200, 16);
    }
    
    [_rightImageView setFrame:CGRectMake(self.frame.size.width  - 24, (self.frame.size.height - 15)/2, 9, 15)];
    
}

// add lines
- (void)showTopWholeLine {
    self.topWholeLine.hidden = NO;
}

- (void)showTopPartLine {
    self.topPartLine.hidden = NO;
}

- (void)showBottomWholeLine {
    self.bottomWholeLine.hidden = NO;
}

- (void)showBottomPartLine {
    self.bottomPartLine.hidden = NO;
}

- (void)cleanLines {
    self.topWholeLine.hidden = YES;
    self.topPartLine.hidden = YES;
    self.bottomWholeLine.hidden = YES;
    self.bottomPartLine.hidden = YES;
}

- (void)didClickRightButton:(UIButton *)sender {
    if (self.delegate &&
        [self.delegate conformsToProtocol:@protocol(LMVipMemberCellDelegate)]) {
        [self.delegate vipMemberCellButtonDidEndClick:self clickBtn:sender];
    }
}

- (void)configureCellWithTitle:(NSString *)title andDescription:(NSString *)desc {
    self.titleLabel.text = title;
    self.cellMiddleLabel.text = desc;
}

- (void)configureVipDesWithImage:(NSString *)imageName vipTitle:(NSString *)title vipDes:(NSString *)des {
    self.vipImageView.image = [UIImage imageNamed:imageName];
    self.vipTitle.text = title;
    self.vipDes.text = des;
}


@end
