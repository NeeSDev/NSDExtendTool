//
//  NoScaleBgButton.m
//  EtahShadow
//
//  Created by apple on 2019/4/12.
//  Copyright © 2019 Nee. All rights reserved.
//

#import "NoScaleBgButton.h"
#import "ReactiveObjC.h"

@interface NoScaleBgButton ()
{
    UIImageView *_customImageView;
    
    UIImage *_selectedStateImage;
    UIImage *_normalStateImage;
    
    UIViewContentMode _contentMode;

    RACDisposable * _handler;
}

@end

@implementation NoScaleBgButton
-(void)dealloc
{
    if (_handler) {
        [_handler dispose];
    }
}

- (void)layoutSubviews
{
    if (!_customImageView) {
        _customImageView = [UIImageView new];
        _customImageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_customImageView];
        [self sendSubviewToBack:_customImageView];
        
        if (_handler) {
            [_handler dispose];
        }
        __weak typeof(self) wealSelf = self;
        _handler = [RACObserve(self, selected) subscribeNext:^(NSNumber *value) {
            __strong typeof(wealSelf) strongSelf = wealSelf;
            if ([value boolValue] && strongSelf->_selectedStateImage) {
                [strongSelf->_customImageView setImage:strongSelf->_selectedStateImage];
            }
            else
            {
                [strongSelf->_customImageView setImage:nil];
            }
        }];
    }
    
    [super layoutSubviews];
    
    if (_customImageView.contentMode != _contentMode) {
        _customImageView.contentMode = _contentMode;
    }

    if(_customImageView.frame.size.height != self.bounds.size.height && _customImageView.frame.size.width != self.bounds.size.width)
    {
        _customImageView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    }
}

- (void)setBackgroundImageViewContentMode:(UIViewContentMode)mode
{
    _contentMode = mode;
    if (_customImageView) {
        _customImageView.contentMode = _contentMode;
    }
}

-(void)setBackgroundImage:(UIImage *)image forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateSelected:
            _selectedStateImage = image;
            break;
        case UIControlStateNormal:
            _normalStateImage = image;
            break;
        default:
        {
            [super setBackgroundImage:image forState:state];
        }
            break;
    }
    
}

@end
