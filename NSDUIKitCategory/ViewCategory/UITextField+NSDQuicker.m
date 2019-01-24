//
//  UITextField+NSDQuicker.m
//  NSDExtendTools
//
//  Created by apple on 2019/1/24.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "UITextField+NSDQuicker.h"

@implementation UITextField (NSDQuicker)
+(instancetype)nsd_GetWithLeftSpace:(float)space
                      ReturnKeyType:(UIReturnKeyType)returnKeyType
                           Delegate:(id)delegate
{
    UITextField *textField = [UITextField new];
    textField.returnKeyType = returnKeyType;
    if (delegate) {
        textField.delegate = delegate;
    }
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    view.frame = CGRectMake(0, 0, space, 0);
    self.leftView = view;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
