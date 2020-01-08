//
//  EtahNavigationViewController.m
//  EtahShadow
//
//  Created by NWDeveloper on 2018/12/25.
//  Copyright © 2018年 Nee. All rights reserved.
//

#import "NSDNavigationController.h"

@implementation NSDNavigationController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.viewControllers count] != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:YES];
}

/**
 @brief 返回当前ViewController的方向
 
 @return 方向
 */
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}


/**
 @brief 返回当前ViewController的方向

 @return 方向
 */
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

/**
 @brief 导航栏样式使用viewcontroller来设置

 @return viewcontroller
 */
-(UIViewController *)childViewControllerForStatusBarStyle
{
    return self.topViewController;
}
@end
