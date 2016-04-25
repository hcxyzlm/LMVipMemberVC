//
//  LMVipMemberCell.h
//  LMVipMemberVC
//
//  Created by zhuo on 16/4/25.
//  Copyright © 2016年 com.lrts.zhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LMVipMemberCellType) {
    LMVipMemberCellTypeMemberType = 0,//
    LMVipMemberCellTypeBalance = 1,//
    LMVipMemberCellTypeIntegration = 2,//
    LMVipMemberCellTypeVip = 3,//vip购买cell
    LMVipMemberCellTypeTitle = 4,//标题cell
    LMVipMemberCellTypeVipDes = 5//vip会员权益描述cell
};
@protocol LMVipMemberCellDelegate;

@interface LMVipMemberCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *memberTypeLabel;

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, assign) LMVipMemberCellType cellType;

@property (nonatomic, weak) id<LMVipMemberCellDelegate> delegate;

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
           cellType:(LMVipMemberCellType)type;

- (void)showTopWholeLine;

- (void)showTopPartLine;

- (void)showBottomWholeLine;

- (void)showBottomPartLine;

- (void)configureCellWithTitle:(NSString *)title andDescription:(NSString *)desc;

- (void)configureVipDesWithImage:(NSString *)imageName vipTitle:(NSString *)title vipDes:(NSString *)des;

@end

@protocol LMVipMemberCellDelegate <NSObject>

- (void)vipMemberCellButtonDidEndClick:(LMVipMemberCell *)cell clickBtn:(UIButton *)clickBtn;
@end
