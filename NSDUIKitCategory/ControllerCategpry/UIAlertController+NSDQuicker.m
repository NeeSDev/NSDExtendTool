//
//  UIAlertController+NSDQuicker.m
//  NSDExtendTools
//
//  Created by apple on 2019/1/23.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "UIAlertController+NSDQuicker.h"

@implementation UIAlertController (NSDQuicker)
+(void)AlertWithTips:(NSString *)tips Tag:(__kindof UIViewController *)controller
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:tips preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleCancel handler:nil]];

    [controller presentViewController:alert animated:YES completion:nil];
}
@end
