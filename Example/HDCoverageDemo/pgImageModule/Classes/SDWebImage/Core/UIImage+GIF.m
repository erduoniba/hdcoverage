/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 * (c) Laurin Brandner
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDImageGIFCoder.h"
#import "UIImage+GIF.h"

@implementation UIImage (GIF)

+ (nullable UIImage *)jx_imageWithGIFData:(nullable NSData *)data {
    if (!data) {
        return nil;
    }
    return [[SDImageGIFCoder sharedCoder] decodedImageWithData:data options:0];
}

@end
