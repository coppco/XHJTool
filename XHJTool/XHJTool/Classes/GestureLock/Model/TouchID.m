//
//  TouchID.m
//  XHJTool
//
//  Created by coco on 16/5/4.
//  Copyright © 2016年 XHJ. All rights reserved.
//

#import "TouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>


@implementation TouchID
+ (BOOL)isAvailable {
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        return YES;
    }
    /**
     *  @author XHJ, 16-05-04 09:05:27
     *
     *  NSAssert 断言,在Debug下如果条件不成立会抛出异常,并打印后面的字符串.
     * Release下不会抛出异常
     */
    NSAssert(error == nil, @"TouchID can't open because %@", error);
    return NO;
}
+ (void)showTouchIdOnComplet:(void (^)(BOOL success, NSError *authenticationError))complet failed:(void (^)(NSError *authenticationError))failed
{
    LAContext *context = [[LAContext alloc] init];
    NSError *error;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"请使用Touch ID解锁。" reply:^(BOOL success, NSError *authenticationError)
         {
             //放到主线程运行防止出现延迟
             dispatch_async(dispatch_get_main_queue(), ^{
                 if (!success) {
                     //失败
                     if (failed) {
                         failed(authenticationError);
                     }
                 }
                 if (complet) {
                     //成功
                     complet(success, authenticationError);
                 }
             });
             
         }];
    }
}
@end
