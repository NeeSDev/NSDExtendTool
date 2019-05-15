//
//  UIImageView+CustiomInitFunc.m
//  EtahShadow
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 Nee. All rights reserved.
//

#import "UIImageView+NSDQuicker.h"

@implementation UIImageView (NSDQuicker)

+(instancetype)nsd_GetWithImageName:(NSString *)imageName
{
    return [[self alloc] initWithImage:[UIImage imageNamed:imageName]];
}
@end
