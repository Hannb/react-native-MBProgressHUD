//
//  MBProgressHUD+CQ.m
//
//  Created by Hannb Ma on 4/13/17.
//  Copyright © 2018 CQ. All rights reserved.
//

#import "MBProgressHUD+CQ.h"

@implementation MBProgressHUD (CQ)

#pragma mark - show text message
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view {
  if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
  hud.label.text = text;
  hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", icon]]];
  hud.mode = MBProgressHUDModeCustomView;
  hud.removeFromSuperViewOnHide = YES;
  [hud hideAnimated:YES afterDelay:0.7];
}

#pragma mark - show error & success states
+ (void)showError:(NSString *)error toView:(UIView *)view {
  [self show:error icon:@"error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
  [self show:success icon:@"success.png" view:view];
}

#pragma mark - show message to view
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
  if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
  hud.label.text = message;
  hud.removeFromSuperViewOnHide = YES;
  return hud;
}

+ (void)showSuccess:(NSString *)success {
  [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error {
  [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message {
  return [self showMessage:message toView:nil];
}

#pragma mark - hide hud
+ (void)hideHUDForView:(UIView *)view {
  [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD {
  [self hideHUDForView:nil];
}

@end
