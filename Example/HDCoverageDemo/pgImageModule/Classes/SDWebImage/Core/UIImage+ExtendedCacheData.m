/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 * (c) Fabrice Aneche
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <objc/runtime.h>

#import "UIImage+ExtendedCacheData.h"

@implementation UIImage (ExtendedCacheData)

- (id<NSObject, NSCoding>)jx_extendedObject {
    return objc_getAssociatedObject(self, @selector(jx_extendedObject));
}

- (void)setJx_extendedObject:(id<NSObject, NSCoding>)jx_extendedObject {
    objc_setAssociatedObject(self, @selector(jx_extendedObject), jx_extendedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
