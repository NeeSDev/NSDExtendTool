//
//  CircleSlideImageView.m
//  NSDExtendTools
//
//  Created by apple on 2019/1/29.
//  Copyright © 2019 NeeSDev. All rights reserved.
//

#import "CircleSlideView.h"
#import "MyLayout.h"
#import "ReactiveObjC.h"

@interface CircleSlideView ()<UIScrollViewDelegate>
@property (nonatomic, strong) NSArray<__kindof UIView *> *itemArray;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) NSInteger currentIndex; ///< 记录的是显示的page，并不是轮播的page（轮播会比显示的多两页）
@end

@implementation CircleSlideView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

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
        self.itemArray = [arrayTemp mutableCopy];
    }
    else
    {
        self.itemArray = [viewArray mutableCopy];
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
    
    for (UIView *itemView in self.itemArray) {
        [view addSubview:itemView];
    }
    
    NSInteger realCount = (self.itemArray.count > 1)?(self.itemArray.count - 2):1;
    
    if (isShowPage) {
        self.pageControl = [UIPageControl new];
        self.pageControl.bottomPos.equalTo(self).offset(20);
        self.pageControl.centerXPos.equalTo(self);
        self.pageControl.numberOfPages = realCount;
        self.pageControl.currentPage = 0;
        [self addSubview:self.pageControl];
    }
    
    //超过1个view才需要轮播
    if (realCount > 1) {
//        [scroll setContentOffset:CGPointMake(CGRectGetWidth(scroll.frame), 0)];
        
        __weak typeof(self) weakSelf = self;
        [[RACSignal interval:intervalTime onScheduler:[RACScheduler scheduler]] subscribeNext:^(NSDate * _Nullable x) {
            dispatch_async(dispatch_get_main_queue(), ^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                NSInteger index = strongSelf.currentIndex + 1;

                if (strongSelf.pageControl) {
                    strongSelf.currentIndex = index%realCount;
                    [strongSelf.pageControl setCurrentPage:strongSelf.currentIndex];
                }

                [scroll setContentOffset:CGPointMake((index + 1)*CGRectGetWidth(scroll.frame), 0) animated:YES];
            });
        }];
    }
    else
    {
        self.currentIndex = 0;
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
    if (point.x == 0) {
        //scroll的第一张，实际上是最后一张
        [scrollView setContentOffset:CGPointMake(width * (self.itemArray.count-2), 0) animated:NO];
        [self.pageControl setCurrentPage:self.itemArray.count - 2 - 1];
    }
    else if (point.x == width * (self.itemArray.count-1)) {
        //scroll 的最后一张，实际上是第一张
        [scrollView setContentOffset:CGPointMake(width , 0) animated:NO];
        [self.pageControl setCurrentPage:0];
    }
    else
    {
        [self.pageControl setCurrentPage:point.x/width - 1];
    }
}

@end
