//
//  UIAlertController+NSDQuicker.m
//  NSDExtendTools
//
//  Created by apple on 2019/1/23.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "UIAlertController+NSDQuicker.h"

@implementation UIAlertController (NSDQuicker)


+(void)nsd_AlertWithTips:(NSString *)tips
                 Tag:(__kindof UIViewController *)controller
         ConfirmText:(NSString *)confirmText
        ConfirmBlock:(void(^)(void))confirmBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:tips preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:confirmText style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }]];
    
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)nsd_AlertWithTitle:(NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
              ConfirmText:(NSString *)confirmText
             ConfirmBlock:(nullable void(^)(void))confirmBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:tips preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:confirmText style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }]];
    
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)nsd_AlertWithTips:(NSString *)tips Tag:(__kindof UIViewController *)controller
{
    [UIAlertController nsd_AlertWithTips:tips
                                     Tag:controller
                             ConfirmText:@"确定"
                            ConfirmBlock:nil];
}

+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
            ConfirmBlock:(void(^)(void))confirmBlock
{
    [UIAlertController nsd_AlertWithTips:tips
                                     Tag:controller
                             ConfirmText:@"确定"
                            ConfirmBlock:confirmBlock];
}

+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
             ConfirmText:(NSString *)confirmText
              CancelText:(NSString *)cancelText
            ConfirmBlock:(void(^)(void))confirmBlock
             CancelBlock:(void(^)(void))cancelBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:tips preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:confirmText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }]];
    
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)nsd_AlertWithTips:(NSString *)tips
                     Tag:(__kindof UIViewController *)controller
                ConfirmBlock:(void (^)(void))confirmBlock
             CancelBlock:(void (^)(void))cancelBlock
{
    [UIAlertController nsd_AlertWithTips:tips
                                     Tag:controller
                             ConfirmText:@"确认"
                              CancelText:@"取消"
                            ConfirmBlock:confirmBlock
                             CancelBlock:cancelBlock];
}

+(void)nsd_AlertWithTitle:(NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
              ConfirmText:(NSString *)confirmText
               CancelText:(NSString *)cancelText
             ConfirmBlock:(nullable void(^)(void))confirmBlock
              CancelBlock:(nullable void(^)(void))cancelBlock
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:tips preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:confirmText style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:cancelText style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if (cancelBlock) {
            cancelBlock();
        }
    }]];
    
    [controller presentViewController:alert animated:YES completion:nil];
}

+(void)nsd_AlertWithTitle:(NSString *)title
                     Tips:(NSString *)tips
                      Tag:(__kindof UIViewController *)controller
             ConfirmBlock:(nullable void(^)(void))confirmBlock
              CancelBlock:(nullable void(^)(void))cancelBlock
{
    [UIAlertController nsd_AlertWithTitle:title
                                     Tips:tips
                                      Tag:controller
                              ConfirmText:@"确认"
                               CancelText:@"取消"
                             ConfirmBlock:confirmBlock
                              CancelBlock:cancelBlock];
}
@end
