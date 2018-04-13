//
//  MBProgressHUD+CQExtend.m
//
//  Created by Hannb Ma on 2016/6/21.
//  Copyright © 2016 CQ. All rights reserved.
//

#import "MBProgressHUD+CQExtend.h"
#import "MBProgressHUD_CQExtend.h"
#import <objc/message.h>

CGFloat const delayTime = 1.2;
#define kLoadImage(name) [UIImage imageNamed:[NSString stringWithFormat:@"MBProgressHUD.bundle/%@", (name)]]

@implementation MBProgressHUD (CQAdd)
static char cancelationKey;

NS_INLINE MBProgressHUD *createNew(UIView *view) {
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    return [MBProgressHUD showHUDAddedTo:view animated:YES];
}

NS_INLINE MBProgressHUD *settHUD(UIView *view, NSString *title, BOOL autoHidden) {
    MBProgressHUD *hud = createNew(view);
    hud.label.text = title;
    hud.label.numberOfLines = 0;
    hud.removeFromSuperViewOnHide = YES;
  
    if (CQDefaultHudStyle == 1) {
        hud.hudContentStyle(CQHUDContentBlackStyle);
        
    } else if (CQDefaultHudStyle == 2) {
        hud.hudContentStyle(CQHUDContentCustomStyle);
    }
    
    if (autoHidden) {
        [hud hideAnimated:YES afterDelay:delayTime];
    }
    
    return hud;
}

+ (MBProgressHUD *)showOnlyLoadToView:(UIView *)view {
    return settHUD(view, nil, NO);
}

+ (void)showOnlyTextToView:(UIView *)view title:(NSString *)title {
    MBProgressHUD *hud = settHUD(view, title, YES);
    hud.mode = MBProgressHUDModeText;
}

+ (void)showOnlyTextToView:(UIView *)view title:(NSString *)title detail:(NSString *)detail {
    MBProgressHUD *hud = settHUD(view, title, YES);
    hud.detailsLabel.text = detail;
    hud.mode = MBProgressHUDModeText;
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view {
    MBProgressHUD *hud = settHUD(view, success, YES);
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:kLoadImage(@"success.png")];
}

+ (void)showError:(NSString *)error toView:(UIView *)view {
    MBProgressHUD *hud = settHUD(view, error, YES);
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:kLoadImage(@"error.png")];
}

+ (void)showTitleToView:(UIView *)view postion:(CQHUDPostion)postion title:(NSString *)title {
    MBProgressHUD *hud = settHUD(view, title, YES);
    hud.mode = MBProgressHUDModeText;
    hud.hudPostion(postion);
}

+ (void)showDetailToView:(UIView *)view
                 postion:(CQHUDPostion)postion
                   title:(NSString *)title
                  detail:(NSString *)detail {
    MBProgressHUD *hud = settHUD(view, title, YES);
    hud.detailsLabel.text = detail;
    hud.mode = MBProgressHUDModeText;
    hud.hudPostion(postion);
}

+ (void)showTitleToView:(UIView *)view
                postion:(CQHUDPostion)postion
           contentStyle:(CQHUDContentStyle)contentStyle
                  title:(NSString *)title {
    
    MBProgressHUD *hud = settHUD(view, title, YES);
    hud.mode = MBProgressHUDModeText;
    hud.hudContentStyle(contentStyle);
    hud.hudPostion(postion);
}

+ (MBProgressHUD *)showLoadToView:(UIView *)view title:(NSString *)title {
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.mode = MBProgressHUDModeIndeterminate;
    return hud;
}

+ (void)showTitleToView:(UIView *)view
           contentStyle:(CQHUDContentStyle)contentStyle
                  title:(NSString *)title
             afterDelay:(NSTimeInterval)delay {
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.mode = MBProgressHUDModeText;
    hud.hudContentStyle(contentStyle);
    [hud hideAnimated:YES afterDelay:delay];
}

+ (MBProgressHUD *)showTitleToView:(UIView *)view
           contentStyle:(CQHUDContentStyle)contentStyle
                  title:(NSString *)title {
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.mode = MBProgressHUDModeText;
    hud.hudContentStyle(contentStyle);
    return hud;
}

+ (MBProgressHUD *)showDownToView:(UIView *)view
                    progressStyle:(CQHUDProgressStyle)progressStyle
                            title:(NSString *)title
                         progress:(CQCurrentHud)progress {
    MBProgressHUD *hud = settHUD(view, title, NO);
    if (progressStyle == CQHUDProgressDeterminateHorizontalBar) {
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
        
    } else if (progressStyle == CQHUDProgressDeterminate) {
        hud.mode = MBProgressHUDModeDeterminate;
        
    } else if (progressStyle == CQHUDProgressAnnularDeterminate) {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    if (progress) {
        progress(hud);
    }
    return hud;
}

+ (MBProgressHUD *)showDownToView:(UIView *)view
                    progressStyle:(CQHUDProgressStyle)progressStyle
                            title:(NSString *)title
                      cancelTitle:(NSString *)cancelTitle
                         progress:(CQCurrentHud)progress
                      cancelation:(CQCancelation)cancelation {
    
    MBProgressHUD *hud = settHUD(view, title, NO);
    
    if (progressStyle == CQHUDProgressDeterminateHorizontalBar) {
        hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
        
    } else if (progressStyle == CQHUDProgressDeterminate) {
        hud.mode = MBProgressHUDModeDeterminate;
        
    } else if (progressStyle == CQHUDProgressAnnularDeterminate) {
        hud.mode = MBProgressHUDModeAnnularDeterminate;
    }
    
    [hud.button setTitle:cancelTitle ?: NSLocalizedString(@"Cancel", @"HUD cancel button title") forState:UIControlStateNormal];
    [hud.button addTarget:hud action:@selector(didClickCancelButton) forControlEvents:UIControlEventTouchUpInside];
    hud.cancelation = cancelation;
    if (progress) {
        progress(hud);
    }
    return hud;
}

+ (void)showCustomView:(UIImage *)image toView:(UIView *)toView title:(NSString *)title {
    
    MBProgressHUD *hud = settHUD(toView, title, YES);
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    hud.customView = [[UIImageView alloc] initWithImage:image];
    // Looks a bit nicer if we make it square.
    hud.square = YES;
}

+ (MBProgressHUD *)showModelSwitchToView:(UIView *)toView
                                   title:(NSString *)title
                               configHud:(CQCurrentHud)configHud {
    MBProgressHUD *hud = settHUD(toView, title, NO);
    // Will look best, if we set a minimum size.
    hud.minSize = CGSizeMake(150.f, 100.f);
    if (configHud) {
        configHud(hud);
    }
    return hud;
}

+ (MBProgressHUD *)showDownNSProgressToView:(UIView *)view title:(NSString *)title {
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.mode = MBProgressHUDModeDeterminate;
    return hud;
}

+ (MBProgressHUD *)showDownWithNSProgress:(NSProgress *)Progress
                                   toView:(UIView *)view title:(NSString *)title
                                configHud:(CQCurrentHud)configHud {
    MBProgressHUD *hud = settHUD(view, title, NO);
    if (configHud) {
        configHud(hud);
    }
    return hud;
}

+ (MBProgressHUD *)showLoadToView:(UIView *)view
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title {
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.backgroundView.backgroundColor = backgroundColor;
    return hud;
}

+ (MBProgressHUD *)showLoadToView:(UIView *)view
                     contentColor:(UIColor *)contentColor
                            title:(NSString *)title {
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.contentColor = contentColor;
    return hud;
}

+ (MBProgressHUD *)showLoadToView:(UIView *)view
                     contentColor:(UIColor *)contentColor
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title {
    
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.contentColor = contentColor;
    hud.backgroundView.color = backgroundColor;
    return hud;
}

+ (MBProgressHUD *)showLoadToView:(UIView *)view
                       titleColor:(UIColor *)titleColor
                   bezelViewColor:(UIColor *)bezelViewColor
                  backgroundColor:(UIColor *)backgroundColor
                            title:(NSString *)title {
    
    MBProgressHUD *hud = settHUD(view, title, NO);
    hud.label.textColor = titleColor;
    hud.bezelView.backgroundColor = bezelViewColor;
    hud.backgroundView.color = backgroundColor;
    return hud;
}

+ (MBProgressHUD *)createHudToView:(UIView *)view title:(NSString *)title configHud:(CQCurrentHud)configHud {
    MBProgressHUD *hud = settHUD(view, title, YES);
    if (configHud) {
        configHud(hud);
    }
    return hud;
}

+ (void)hideHUDForView:(UIView *)view {
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD {
    [self hideHUDForView:nil];
}

#pragma mark -- setter && getter
- (void)didClickCancelButton {
    if (self.cancelation) {
        self.cancelation(self);
    }
}

- (void)setCancelation:(CQCancelation)cancelation {
    objc_setAssociatedObject(self, &cancelationKey, cancelation, OBJC_ASSOCIATION_COPY);
}

- (CQCancelation)cancelation {
    return objc_getAssociatedObject(self, &cancelationKey);
}

- (MBProgressHUD *(^)(UIColor *))hudBackgroundColor {
    return ^(UIColor *hudBackgroundColor) {
        self.backgroundView.color = hudBackgroundColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIView *))toView {
    return ^(UIView *view){
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))title {
    return ^(NSString *title){
        self.label.text = title;
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))details {
    return ^(NSString *details){
        self.detailsLabel.text = details;
        return self;
    };
}

- (MBProgressHUD *(^)(NSString *))customIcon {
    return ^(NSString *customIcon) {
        self.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:customIcon]];
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))titleColor {
    return ^(UIColor *titleColor){
        self.label.textColor = titleColor;
        self.detailsLabel.textColor = titleColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))progressColor {
    return ^(UIColor *progressColor) {
        UIColor *titleColor = self.label.textColor;
        self.contentColor = progressColor;
        self.label.textColor = titleColor;
        self.detailsLabel.textColor = titleColor;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))allContentColors {
    return ^(UIColor *allContentColors) {
        self.contentColor = allContentColors;
        return self;
    };
}

- (MBProgressHUD *(^)(UIColor *))bezelBackgroundColor {
    return ^(UIColor *bezelViewColor){
        self.bezelView.backgroundColor = bezelViewColor;
        return self;
    };
}

- (MBProgressHUD *(^)(CQHUDContentStyle))hudContentStyle {
    return ^(CQHUDContentStyle hudContentStyle){
        if (hudContentStyle == CQHUDContentBlackStyle) {
            self.contentColor = [UIColor whiteColor];
            self.bezelView.backgroundColor = [UIColor blackColor];
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
            
        } else if (hudContentStyle == CQHUDContentCustomStyle) {
            self.contentColor = CQCustomHudStyleContentColor;
            self.bezelView.backgroundColor = CQCustomHudStyleBackgrandColor;
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
            
        } else if (hudContentStyle == CQHUDContentDefaultStyle){
            self.contentColor = [UIColor blackColor];
            self.bezelView.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.000];
            self.bezelView.style = MBProgressHUDBackgroundStyleBlur;
            
        }
        return self;
    };
}

- (MBProgressHUD *(^)(CQHUDPostion))hudPostion {
    return ^(CQHUDPostion hudPostion){
        if (hudPostion == CQHUDPostionTop) {
            self.offset = CGPointMake(0.f, -MBProgressMaxOffset);
        } else if (hudPostion == CQHUDPostionCenter) {
            self.offset = CGPointMake(0.f, 0.f);
        } else {
            self.offset = CGPointMake(0.f, MBProgressMaxOffset);
        }
        return self;
    };
}

- (MBProgressHUD *(^)(CQHUDProgressStyle))hudProgressStyle {
    return ^(CQHUDProgressStyle hudProgressStyle){
        if (hudProgressStyle == CQHUDProgressDeterminate) {
            self.mode = MBProgressHUDModeDeterminate;
            
        } else if (hudProgressStyle == CQHUDProgressAnnularDeterminate) {
            self.mode = MBProgressHUDModeAnnularDeterminate;
            
        } else if (hudProgressStyle == CQHUDProgressCancelationDeterminate) {
            self.mode = MBProgressHUDModeDeterminate;
            
        } else if (hudProgressStyle == CQHUDProgressDeterminateHorizontalBar) {
            self.mode = MBProgressHUDModeDeterminateHorizontalBar;
            
        }
        return self;
    };
}

@end
