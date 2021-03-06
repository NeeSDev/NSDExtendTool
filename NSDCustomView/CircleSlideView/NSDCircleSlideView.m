//
//  CircleSlideImageView.m
//  NSDExtendTools
//
//  Created by apple on 2019/1/29.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "NSDCircleSlideView.h"
#import "ReactiveObjC.h"

@interface NSDCircleSlideView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray<__kindof UIView *> *nsd_ItemArray;
@property (nonatomic, strong) UIPageControl *nsd_PageControl;
@property (nonatomic, assign) NSInteger nsd_CurrentIndex; ///< 记录的是显示的page，并不是轮播的page（轮播会比显示的多两页）
@end

@implementation NSDCircleSlideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)nsd_SetView:(MyFlowLayout *)view
{
    [self removeAllSubviews];
    self.layer.masksToBounds = YES;
    UIScrollView *scroll = [UIScrollView new];
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.myMargin = 0;
    scroll.delegate = self;
    [self addSubview:scroll];
    
    view.heightSize.equalTo(scroll.heightSize); //因为是分页从左到右滚动，因此布局视图的高度必须设置为和父滚动视图相等。

    [scroll addSubview:view];

    self.nsd_PageControl = [UIPageControl new];
    self.nsd_PageControl.bottomPos.equalTo(@(MyLayoutPos.safeAreaMargin));
    self.nsd_PageControl.centerXPos.equalTo(self);
    self.nsd_PageControl.numberOfPages = view.pagedCount/view.arrangedCount;
    self.nsd_PageControl.currentPage = 0;
    self.nsd_PageControl.pageIndicatorTintColor = [UIColor lightGrayColor];        //设置未激活的指示点颜色
    self.nsd_PageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    self.nsd_PageControl.myHeight = 20;
    [self addSubview:self.nsd_PageControl];
    

    NSMutableArray *countArray = [NSMutableArray new];
    for (NSInteger idnexTmp = 0 ; idnexTmp < view.pagedCount/view.arrangedCount ; idnexTmp ++) {
        [countArray addObject:[NSNumber numberWithInteger:idnexTmp]];
    }
    self.nsd_ItemArray = countArray;
    
    self.nsd_CurrentIndex = 0;
}

-(void)nsd_SetViews:(NSArray<__kindof UIView *> *)viewArray
       IntervalTime:(float)intervalTime
         IsShowPage:(BOOL)isShowPage
{
    [self removeAllSubviews];
    
    if (viewArray.count == 0) {
        return;
    }
    
    //重复添加头尾
    if (viewArray.count>1) {
        NSMutableArray *arrayTemp = [NSMutableArray new];
        NSData *tempArchive = [NSKeyedArchiver archivedDataWithRootObject:[viewArray lastObject]];
        [arrayTemp addObject:[NSKeyedUnarchiver unarchiveObjectWithData:tempArchive]];
        
        [arrayTemp addObjectsFromArray:viewArray];
        
        tempArchive = [NSKeyedArchiver archivedDataWithRootObject:[viewArray firstObject]];
        [arrayTemp addObject:[NSKeyedUnarchiver unarchiveObjectWithData:tempArchive]];
        self.nsd_ItemArray = [arrayTemp mutableCopy];
    }
    else
    {
        self.nsd_ItemArray = [viewArray mutableCopy];
    }
    
    UIScrollView *scroll = [UIScrollView new];
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.myMargin = 0;
    scroll.delegate = self;
    [self addSubview:scroll];
    
    MyFlowLayout *view = [MyFlowLayout flowLayoutWithOrientation:MyOrientation_Horz arrangedCount:1];
    view.pagedCount = 1;
    view.wrapContentWidth = YES;
    view.myVertMargin = 0;
    [scroll addSubview:view];
    
    for (UIView *itemView in self.nsd_ItemArray) {
        [view addSubview:itemView];
    }
    
    NSInteger realCount = (self.nsd_ItemArray.count > 1)?(self.nsd_ItemArray.count - 2):1;
    
    if (isShowPage) {
        self.nsd_PageControl = [UIPageControl new];
        self.nsd_PageControl.bottomPos.equalTo(self).offset(20);
        self.nsd_PageControl.centerXPos.equalTo(self);
        self.nsd_PageControl.numberOfPages = realCount;
        self.nsd_PageControl.currentPage = realCount - 1;
        [self addSubview:self.nsd_PageControl];
    }
    
    //超过1个view才需要轮播
    if (realCount > 1) {
        self.nsd_CurrentIndex = -1;
        
        __weak typeof(self) weakSelf = self;
        [[RACSignal interval:intervalTime onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            NSInteger index = strongSelf.nsd_CurrentIndex + 1;

            if (strongSelf.nsd_PageControl) {
                strongSelf.nsd_CurrentIndex = index%realCount;
                [strongSelf.nsd_PageControl setCurrentPage:strongSelf.nsd_CurrentIndex];
            }

            [scroll setContentOffset:CGPointMake((index + 1)*CGRectGetWidth(scroll.frame), 0) animated:YES];
        }];
    }
    else
    {
        self.nsd_CurrentIndex = 0;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self nsd_CheckScrollView:scrollView];
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self nsd_CheckScrollView:scrollView];
}

-(void)nsd_CheckScrollView:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    float width = CGRectGetWidth(scrollView.frame);
    if ([self.nsd_ItemArray[0] isKindOfClass:[NSNumber class]]) {
        [self.nsd_PageControl setCurrentPage:point.x/width];
    }
    else
    {
        if (point.x == 0) {
            //scroll的第一张，实际上是最后一张
            [scrollView setContentOffset:CGPointMake(width * (self.nsd_ItemArray.count-2), 0) animated:NO];
            [self.nsd_PageControl setCurrentPage:self.nsd_ItemArray.count - 2 - 1];
        }
        else if (point.x == width * (self.nsd_ItemArray.count-1)) {
            //scroll 的最后一张，实际上是第一张
            [scrollView setContentOffset:CGPointMake(width , 0) animated:NO];
            [self.nsd_PageControl setCurrentPage:0];
        }
        else
        {
            [self.nsd_PageControl setCurrentPage:point.x/width - 1];
        }
    }
    
}

@end
