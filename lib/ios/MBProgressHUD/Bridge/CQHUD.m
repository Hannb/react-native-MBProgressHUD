//
//  CQHUD.m
//  DemoHUD
//
//  Created by Hannb Ma on 4/13/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "CQHUD.h"
#import "MBProgressHUD.h"

typedef NS_ENUM(NSInteger, CQHUDMode) {
  CQHUDModeAnnularDeterminate = 0,
  CQHUDModeDeterminateHorizontalBar = 1,
};

@interface CQHUD()

@property (nonatomic, strong) MBProgressHUD *hud;
@property (nonatomic, strong) UIWindow *window;

@end

@implementation CQHUD

- (UIWindow *)window {
  if (!_window) {
    _window = [UIApplication sharedApplication].keyWindow;
  }
  return _window;
}

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(showText:(NSString *)message duration:(NSInteger)duration) {
  
  dispatch_async(dispatch_get_main_queue(), ^{
    if(self.hud){
      [self.hud hideAnimated:YES];
    }
    self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    self.hud.mode = MBProgressHUDModeText;
    self.hud.label.text = message;
    
    [self setBlackHUDStyle];
    
    if (self.hud) {
      [self.hud hideAnimated:YES afterDelay:duration / 1000];
      self.hud = NULL;
    }
  });
  
}

RCT_EXPORT_METHOD(showSpinIndeterminate) {
  dispatch_async(dispatch_get_main_queue(), ^{
    if(self.hud){
      [self.hud hideAnimated:YES];
    }
    self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    [self setBlackHUDStyle];

  });
}

RCT_EXPORT_METHOD(showSpinIndeterminateWithTitle:(NSString *)title) {
  
  dispatch_async(dispatch_get_main_queue(), ^{
    if(self.hud){
      [self.hud hideAnimated:YES];
    }
    self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.label.text = title;
    [self setBlackHUDStyle];

  });
  
}

RCT_EXPORT_METHOD(showSpinIndeterminateWithTitleAndContent:(NSString *)title content:(NSString *)content) {
  dispatch_async(dispatch_get_main_queue(), ^{
    if(self.hud){
      [self.hud hideAnimated:YES];
    }
    self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    self.hud.mode = MBProgressHUDModeIndeterminate;
    self.hud.label.text = title;
    self.hud.detailsLabel.text = content;
    [self setBlackHUDStyle];

  });
}

RCT_EXPORT_METHOD(showDeterminate:(NSInteger)mode title:(NSString *)title details:(NSString *)details) {
  dispatch_async(dispatch_get_main_queue(), ^{
    if(self.hud){
      [self.hud hideAnimated:YES];
    }
    self.hud = [MBProgressHUD showHUDAddedTo:self.window animated:YES];
    
    if(mode == CQHUDModeAnnularDeterminate){
      self.hud.mode = MBProgressHUDModeAnnularDeterminate;
    } else if(mode == CQHUDModeDeterminateHorizontalBar){
      self.hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    }
    
    if (title) {
      self.hud.label.text = title;
    }
    if(details){
      self.hud.detailsLabel.text = details;
    }
    
    [self setBlackHUDStyle];
  });
}

RCT_EXPORT_METHOD(setProgress:(CGFloat)progress ) {
  dispatch_async(dispatch_get_main_queue(), ^{
    if (_hud) {
      [MBProgressHUD HUDForView:self.window].progress = progress;
    }
  });
}

RCT_EXPORT_METHOD(dismiss) {
  dispatch_async(dispatch_get_main_queue(), ^{
    if(self.hud){
      [self.hud hideAnimated:YES];
      self.hud = NULL;
    }
  });
}

- (void)setBlackHUDStyle {
  self.hud.contentColor = [UIColor whiteColor];
  self.hud.bezelView.backgroundColor = [UIColor blackColor];
  self.hud.bezelView.style = MBProgressHUDBackgroundStyleBlur;
}

@end
