//
//  EtahNavigationViewController.m
//  EtahShadow
//
//  Created by NWDeveloper on 2018/12/25.
//  Copyright © 2018年 Nee. All rights reserved.
//

#import "NSDNavigationController.h"

@interface NSDNavigationController ()
{
    UIViewController *_currentViewController;
}
@end

@implementation NSDNavigationController

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self.viewControllers count] != 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    _currentViewController = viewController;
    [super pushViewController:viewController animated:YES];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if (self.viewControllers.count>1) {
        _currentViewController = [self.viewControllers objectAtIndex:self.viewControllers.count-2];
    }
    return [super popViewControllerAnimated:YES];
}

/**
 @brief 返回当前ViewController的方向
 
 @return 方向
 */
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [_currentViewController supportedInterfaceOrientations];
}


/**
 @brief 返回当前ViewController的方向

 @return 方向
 */
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [_currentViewController preferredInterfaceOrientationForPresentation];
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
