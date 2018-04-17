//
//  CQProgressHUD.h
//  DemoHUD
//
//  Created by Hannb Ma on 4/13/17.
//  Copyright © 2018 CQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQProgressHUD : NSObject

@property (copy, nonatomic) void(^cancelAction)();

+ (instancetype)shareProgressHUD;
+ (void)showLoadingHUD;
+ (void)hideLoadingHUD;
+ (void)showErrorHUDWith:(NSString *)msg;

@end
