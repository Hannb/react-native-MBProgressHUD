//
//  MBProgressHUD+CQExtend.h
//
//  Created by Hannb Ma on 2016/6/21.
//  Copyright © 2016 CQ. All rights reserved.
//

#import "MBProgressHUD_CQExtend.h"


UIKIT_EXTERN CGFloat const delayTime;

/** ：
 *  CQHUDContentDefaultStyle = 0,//Default
 *  CQHUDContentBlackStyle = 1,//
 *  CQHUDContentCustomStyle = 2,
 *
 *  eg：1 -> 'White on Black' style
 */
#define CQDefaultHudStyle  1


/**
 * custom the color of hud style.
 */
#define CQCustomHudStyleBackgrandColor  [UIColor colorWithWhite:0.f alpha:0.7f]
#define CQCustomHudStyleContentColor    [UIColor colorWithWhite:1.f alpha:0.7f]


@interface MBProgressHUD (CQAdd)

/**
 * load default loading view.
 */
+ (MBProgressHUD *)showOnlyLoadToView:(UIView *)view;

/**
 * load text message.
 */
+ (void)showOnlyTextToView:(UIView *)view title:(NSString *)title;

/**
 * load text & title
 */
+ (void)showOnlyTextToView:(UIView *)view title:(NSString *)title detail:(NSString *)detail;

/**
 * show success
 */
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;

/**
 * show error
 */
+ (void)showError:(NSString *)error toView:(UIView *)view;

/**
 * text title & custom the postion.(auto disappear)
 *
 * @param postion : top,center,bottom
 */
+ (void)showTitleToView:(UIView *)view
                postion:(CQHUDPostion)postion
                  title:(NSString *)title;

/**
 * text title + detail + postion
 *
 * @param postion : top,center,bottom
 */
+ (void)showDetailToView:(UIView *)view
                 postion:(CQHUDPostion)postion
                   title:(NSString *)title
                  detail:(NSString *)detail;

/**
 * text + postion + content style (auto disappear)
 *
 * @param postion - top,center,bottom
 * @param contentStyle - default,black,custom
 */
+ (void)showTitleToView:(UIView *)view
                postion:(CQHUDPostion)postion
           contentStyle:(CQHUDContentStyle)contentStyle
                  title:(NSString *)title;

/**
 * title
 */
+ (MBProgressHUD *)showLoadToView:(UIView *)view title:(NSString *)title;

/**
 * title & after delay disappear
 *
 * @param delay - time interval
 */
+ (void)showTitleToView:(UIView *)view
           contentStyle:(CQHUDContentStyle)contentStyle
                  title:(NSString *)title
             afterDelay:(NSTimeInterval)delay;

/**
 * title + postion
 */
+ (MBProgressHUD *)showTitleToView:(UIView *)view
                      contentStyle:(CQHUDContentStyle)contentStyle
                             title:(NSString *)title;

/**
 * title + progress
 *
 * @param progressStyle - style of progress.
 * @param progress - progress value
 */
+ (MBProgressHUD *)showDownToView:(UIView *)view
                    progressStyle:(CQHUDProgressStyle)progressStyle
                            title:(NSString *)title
                         progress:(CQCurrentHud)progress;

/**
 * title + progress view + cancel button
 *
 * @param progressStyle
 * @param progress
 * @param cancelTitle
 * @param cancelation
 */
+ (MBProgressHUD *)showDownToView:(UIView *)view
                    progressStyle:(CQHUDProgressStyle)progressStyle
                            title:(NSString *)title
                      cancelTitle:(NSString *)cancelTitle
                         progress:(CQCurrentHud)progress
                      cancelation:(CQCancelation)cancelation;


/**
 * title + custom image.
 *
 * @param image
 */
+ (void)showCustomView:(UIImage *)image
                toView:(UIView *)toView
                 title:(NSString *)title;


/**
 * title + loading view + background color
 *
 * @param backgroundColor
 */
+ (MBProgressHUD *)showLoadToView:(UIView *)view
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title;


/**
 * title + view + custom title & color
 *
 * @param contentColor
 */
+ (MBProgressHUD *)showLoadToView:(UIView *)view
                     contentColor:(UIColor *)contentColor
                            title:(NSString *)title;


/**
 * title + default loading view + custom content color + background
 *
 * @param contentColor
 * @param backgroundColor
 */
+ (MBProgressHUD *)showLoadToView:(UIView *)view
                     contentColor:(UIColor *)contentColor
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title;

/**
 * title + view + color + background color
 *
 * @param titleColor
 * @param bezelViewColor
 * @param backgroundColor
 */
+ (MBProgressHUD *)showLoadToView:(UIView *)view
                       titleColor:(UIColor *)titleColor
                   bezelViewColor:(UIColor *)bezelViewColor
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title;

/**
 * state change
 *
 * @param configHud
 */
+ (MBProgressHUD *)showModelSwitchToView:(UIView *)toView
                                   title:(NSString *)title
                               configHud:(CQCurrentHud)configHud;

/**
 * title & progress
 * @param configHud
 */
+ (MBProgressHUD *)showDownWithNSProgress:(NSProgress *)Progress
                                   toView:(UIView *)view
                                    title:(NSString *)title
                                configHud:(CQCurrentHud)configHud;

/**
 * hide progressView
 */
+ (void)hideHUDForView:(UIView *)view;

/**
 * hide（from window）
 */
+ (void)hideHUD;

/**
 * create new hud to view.
 */
+ (MBProgressHUD *)createHudToView:(UIView *)view
                             title:(NSString *)title
                         configHud:(CQCurrentHud)configHud;
@end
