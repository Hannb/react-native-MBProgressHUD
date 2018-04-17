//
//  CQProgressHUD.m
//  DemoHUD
//
//  Created by Hannb Ma on 4/13/17.
//  Copyright © 2018 CQ. All rights reserved.
//

#import "CQProgressHUD.h"
#import "MBProgressHUD.h"

@interface CQProgressHUD ()<MBProgressHUDDelegate>

@property (strong, nonatomic) MBProgressHUD *hud;
@property (assign, nonatomic) BOOL hudWasShow;

@end

@implementation CQProgressHUD

+ (instancetype)shareProgressHUD {
  static CQProgressHUD *progress = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    progress = [[self alloc] init];
  });
  return progress;
}

+ (void)showLoadingHUD {
  CQProgressHUD *progress = [CQProgressHUD shareProgressHUD];
  if (!progress.hudWasShow) {
    progress.hudWasShow = YES;
    [progress.hud showAnimated:YES];
  }
}

+ (void)hideLoadingHUD {
  CQProgressHUD *progress = [CQProgressHUD shareProgressHUD];
  if (progress.hudWasShow) {
    progress.hudWasShow = NO;
    [progress.hud hideAnimated:YES];
    progress.hud = nil;
  }
}

+ (void)showErrorHUDWith:(NSString *)msg {
  if (!msg) {
    return;
  }
  
  [CQProgressHUD hideLoadingHUD];
  MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
  hud.mode = MBProgressHUDModeText;
  
  hud.contentColor = [UIColor whiteColor];
  hud.bezelView.backgroundColor = [UIColor blackColor];
  hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
  
  hud.label.text = msg;
  //[hud.button setTitle:msg forState:UIControlStateNormal];
  hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
  [hud hideAnimated:YES afterDelay:1.f];
}

- (MBProgressHUD *)hud {
  if (!_hud) {
    _hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    _hud.mode = MBProgressHUDModeIndeterminate;
    
    // white on black.
    _hud.contentColor = [UIColor whiteColor];
    _hud.bezelView.backgroundColor = [UIColor blackColor];
    _hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
    
    // black on white. <-- default
    
    
    //_hud.label.text = @"Loading...";
    [_hud.button setTitle:@"Cancel" forState:UIControlStateNormal];
    [_hud.button addTarget:self action:@selector(cancelWork:) forControlEvents:UIControlEventTouchUpInside];
  }
  return _hud;
}

- (void)cancelWork:(UIButton *)btn {
  [CQProgressHUD hideLoadingHUD];
  if (self.cancelAction) {
    self.cancelAction();
  }
  self.cancelAction = nil;
}

@end
