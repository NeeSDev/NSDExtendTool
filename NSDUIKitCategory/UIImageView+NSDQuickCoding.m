//
//  UIImageView+CustiomInitFunc.m
//  EtahShadow
//
//  Created by apple on 2018/12/29.
//  Copyright © 2018 Nee. All rights reserved.
//

#import "UIImageView+NSDQuickCoding.h"

@implementation UIImageView (NSDQuickCoding)

+(instancetype)nsd_GetWithImageName:(NSString *)imageName
{
    return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
}
@end
