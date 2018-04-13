//
//  MBProgressHUD+CQ.h
//  DemoHUD
//
//  Created by Hannb Ma on 4/13/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

/*
 * A simple way to invoke with MBProgressHUD
 */

#import "MBProgressHUD.h"

@interface MBProgressHUD (CQ)

+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

@end
