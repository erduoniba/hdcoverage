/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDImageCoderHelper.h"
#import "UIImage+ForceDecode.h"
#import "objc/runtime.h"

@implementation UIImage (ForceDecode)

- (BOOL)jx_isDecoded {
    NSNumber *value = objc_getAssociatedObject(self, @selector(jx_isDecoded));
    return value.boolValue;
}

- (void)setJx_isDecoded:(BOOL)jx_isDecoded {
    objc_setAssociatedObject(self, @selector(jx_isDecoded), @(jx_isDecoded), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (nullable UIImage *)jx_decodedImageWithImage:(nullable UIImage *)image {
    if (!image) {
        return nil;
    }
    return [SDImageCoderHelper decodedImageWithImage:image];
}

+ (nullable UIImage *)jx_decodedAndScaledDownImageWithImage:(nullable UIImage *)image {
    return [self jx_decodedAndScaledDownImageWithImage:image limitBytes:0];
}

+ (nullable UIImage *)jx_decodedAndScaledDownImageWithImage:(nullable UIImage *)image limitBytes:(NSUInteger)bytes {
    if (!image) {
        return nil;
    }
    return [SDImageCoderHelper decodedAndScaledDownImageWithImage:image limitBytes:bytes];
}

@end
