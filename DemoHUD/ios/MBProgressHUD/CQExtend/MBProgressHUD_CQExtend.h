//
//  MBProgressHUD_CQExtend.h
//
//  Created by Hannb Ma on 2016/6/21.
//  Copyright © 2016 CQ. All rights reserved.
//

#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, CQHUDContentStyle) {
    CQHUDContentDefaultStyle = 0,
    CQHUDContentBlackStyle = 1,
    CQHUDContentCustomStyle = 2,
};

typedef NS_ENUM(NSInteger, CQHUDPostion) {
    CQHUDPostionTop,
    CQHUDPostionCenter,
    CQHUDPostionBottom,
};

typedef NS_ENUM(NSInteger, CQHUDProgressStyle) {
    CQHUDProgressDeterminate,
    CQHUDProgressDeterminateHorizontalBar,
    CQHUDProgressAnnularDeterminate,
    CQHUDProgressCancelationDeterminate,
};

typedef void((^CQCancelation)(MBProgressHUD *hud));
typedef void((^CQCurrentHud)(MBProgressHUD *hud));

@interface MBProgressHUD ()

@property (nonatomic, copy  ) CQCancelation cancelation;
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudContentStyle)(CQHUDContentStyle hudContentStyle);
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudPostion)(CQHUDPostion hudPostion);
@property (nonatomic, assign, readonly) MBProgressHUD *(^hudProgressStyle)(CQHUDProgressStyle hudProgressStyle);
@property (nonatomic, copy  , readonly) MBProgressHUD *(^title)(NSString *title);
@property (nonatomic, copy  , readonly) MBProgressHUD *(^details)(NSString *details);
@property (nonatomic, copy  , readonly) MBProgressHUD *(^customIcon)(NSString *customIcon);
@property (nonatomic, strong, readonly) MBProgressHUD *(^titleColor)(UIColor *titleColor);
@property (nonatomic, strong, readonly) MBProgressHUD *(^progressColor)(UIColor *progressColor);
@property (nonatomic, strong, readonly) MBProgressHUD *(^allContentColors)(UIColor *allContentColors);
@property (nonatomic, strong, readonly) MBProgressHUD *(^hudBackgroundColor)(UIColor *backgroundColor);
@property (nonatomic, strong, readonly) MBProgressHUD *(^bezelBackgroundColor)(UIColor *bezelBackgroundColor);

@end
