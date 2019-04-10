//
//  NDBaseViewController.m
//  recordScore
//
//  Created by NWDeveloper on 2018/12/4.
//  Copyright © 2018年 ballteam. All rights reserved.
//

#import "NSDViewController.h"
#import "ReactiveObjC.h"

@interface NSDViewController ()
{
    ///title
    NSString *_navTitle;
}
@end

@implementation NSDViewController

-(void)dealloc{
    //移除所有通知监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self nsd_UpdateNavigationBarBackgroud];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    //UIStatusBarStyleDefault 黑
    //UIStatusBarStyleLightContent 白
    return UIStatusBarStyleDefault;
}

/**
 @brief 支持的方向

 @return 方向
 */
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

/**
 @brief 初始化方向

 @return 方向
 */
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}

#pragma mark - ========== custom ====================
-(void)nsd_PopController
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)nsd_PopRootController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)nsd_PushViewController:(__kindof NSDViewController *)controller
{
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)nsd_UpdateNavigationBarBackgroud
{
    NSString *imageName = [self nsd_GetNavigationBarBackImageName];
    if (!imageName) {
        [self.navigationController.navigationBar setShadowImage:nil];
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    }
    else if([imageName isEqualToString:@""])
    {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    }
    else
    {
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:imageName] forBarMetrics:UIBarMetricsDefault];
    }
}

#pragma mark - ========== setter ====================
-(void)nsd_SetNavBackItemWithImageName:(NSString *)imageName
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateHighlighted];
    backButton.frame = CGRectMake(0, 0, 50, 44);
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton addTarget:self action:@selector(nsd_PopController) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

-(void)nsd_SetNavTitleItemWithText:(NSString *)title
                              Font:(UIFont *)font
                             Color:(UIColor *)color
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = font;  //设置文本字体与大小
    titleLabel.textColor = color;  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = title;
    self.navigationItem.titleView =titleLabel;

    _navTitle = [title copy];
}

-(void)nsd_SetNavTitleItemWithView:(__kindof UIView *)view
{
    self.navigationItem.titleView = view;
}

-(void)nsd_SetNavTitleItemWithImageNamed:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor clearColor];
    imageView.frame = CGRectMake(0, 0 , 100, 44);
    //设置Label背景透明
    self.navigationItem.titleView =imageView;
}
#pragma mark - ========== left button ====================
-(void)nsd_SetNavLeftItemWithText:(NSString *)rightText
                             Font:(UIFont *)font
                            Color:(UIColor *)color
                        LeftBlock:(void(^)(void))leftBlock
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setTitle:rightText forState:UIControlStateNormal];
    [transmitBt.titleLabel setFont:font];
    [transmitBt setTitleColor:color forState:UIControlStateNormal];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
    
    [[transmitBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        leftBlock();
    }];
}

-(void)nsd_SetNavLeftItemWithText:(NSString *)rightText
                             Font:(UIFont *)font
                            Color:(UIColor *)color
                          LeftSel:(SEL)leftSel
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setTitle:rightText forState:UIControlStateNormal];
    [transmitBt.titleLabel setFont:font];
    [transmitBt setTitleColor:color forState:UIControlStateNormal];
    [transmitBt addTarget:self action:leftSel forControlEvents:UIControlEventTouchUpInside];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
}

-(void)nsd_SetNavLeftItemWithImageNamed:(NSString *)imageName
                              LeftBlock:(void(^)(void))leftBlock
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
    
    [[transmitBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        leftBlock();
    }];
}

-(void)nsd_SetNavLeftItemWithImageNamed:(NSString *)imageName
                                LeftSel:(SEL)leftSel
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [transmitBt addTarget:self action:leftSel forControlEvents:UIControlEventTouchUpInside];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
}

#pragma mark - ========== right button ====================
-(void)nsd_SetNavRightItemWithText:(NSString *)rightText
                              Font:(UIFont *)font
                             Color:(UIColor *)color
                        RightBlock:(void(^)(void))rightBlock
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setTitle:rightText forState:UIControlStateNormal];
    [transmitBt.titleLabel setFont:font];
    [transmitBt setTitleColor:color forState:UIControlStateNormal];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
    
    [[transmitBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        rightBlock();
    }];
}

-(void)nsd_SetNavRightItemWithText:(NSString *)rightText
                              Font:(UIFont *)font
                             Color:(UIColor *)color
                          RightSel:(SEL)rightSel
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setTitle:rightText forState:UIControlStateNormal];
    [transmitBt.titleLabel setFont:font];
    [transmitBt setTitleColor:color forState:UIControlStateNormal];
    [transmitBt addTarget:self action:rightSel forControlEvents:UIControlEventTouchUpInside];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
}

-(void)nsd_SetNavRightItemWithImageNamed:(NSString *)imageName
                              RightBlock:(void(^)(void))rightBlock
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
    
    [[transmitBt rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        rightBlock();
    }];
}

-(void)nsd_SetNavRightItemWithImageNamed:(NSString *)imageName
                                RightSel:(SEL)rightSel
{
    //navigation右边设置按钮
    UIButton * transmitBt = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
    [transmitBt setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [transmitBt addTarget:self action:rightSel forControlEvents:UIControlEventTouchUpInside];
    transmitBt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:transmitBt];
}



#pragma mark - ========== setter ====================
-(NSString *)nsd_GetNavTitle
{
    return _navTitle;
}

-(NSString *)nsd_GetNavigationBarBackImageName
{
    return nil;
}

@end
