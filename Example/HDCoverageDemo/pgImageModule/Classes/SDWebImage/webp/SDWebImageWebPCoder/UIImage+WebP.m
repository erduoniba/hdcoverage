/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDImageWebPCoder.h"
#import "UIImage+WebP.h"

@implementation UIImage (WebP)

+ (nullable UIImage *)jx_imageWithWebPData:(nullable NSData *)data {
    if (!data) {
        return nil;
    }
    return [[SDImageWebPCoder sharedCoder] decodedImageWithData:data options:0];
}

@end
