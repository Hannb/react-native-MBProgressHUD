//
//  CQProgressHUDModule.m
//  DemoHUD
//
//  Created by Hannb Ma on 4/13/18.
//  Copyright © 2018 Facebook. All rights reserved.
//

#import "CQProgressHUDModule.h"

@implementation CQProgressHUDModule

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(showLoadingHUD) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [CQProgressHUD showLoadingHUD];
  });
}

RCT_EXPORT_METHOD(hideLoadingHUD) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [CQProgressHUD hideLoadingHUD];
  });
}

RCT_EXPORT_METHOD(showErrorHUDWith:(NSString *) message) {
  dispatch_async(dispatch_get_main_queue(), ^{
    [CQProgressHUD showErrorHUDWith:message];
  });
}

@end
