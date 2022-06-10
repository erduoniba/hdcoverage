/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDImageCodersManager.h"
#import "UIImage+MultiFormat.h"

@implementation UIImage (MultiFormat)

+ (nullable UIImage *)jx_imageWithData:(nullable NSData *)data {
    return [self jx_imageWithData:data scale:1];
}

+ (nullable UIImage *)jx_imageWithData:(nullable NSData *)data scale:(CGFloat)scale {
    return [self jx_imageWithData:data scale:scale firstFrameOnly:NO];
}

+ (nullable UIImage *)jx_imageWithData:(nullable NSData *)data scale:(CGFloat)scale firstFrameOnly:(BOOL)firstFrameOnly {
    if (!data) {
        return nil;
    }
    SDImageCoderOptions *options = @{SDImageCoderDecodeScaleFactor : @(MAX(scale, 1)), SDImageCoderDecodeFirstFrameOnly : @(firstFrameOnly)};
    return [[SDImageCodersManager sharedManager] decodedImageWithData:data options:options];
}

- (nullable NSData *)jx_imageData {
    return [self jx_imageDataAsFormat:SDImageFormatUndefined];
}

- (nullable NSData *)jx_imageDataAsFormat:(SDImageFormat)imageFormat {
    return [self jx_imageDataAsFormat:imageFormat compressionQuality:1];
}

- (nullable NSData *)jx_imageDataAsFormat:(SDImageFormat)imageFormat compressionQuality:(double)compressionQuality {
    return [self jx_imageDataAsFormat:imageFormat compressionQuality:compressionQuality firstFrameOnly:NO];
}

- (nullable NSData *)jx_imageDataAsFormat:(SDImageFormat)imageFormat compressionQuality:(double)compressionQuality firstFrameOnly:(BOOL)firstFrameOnly {
    SDImageCoderOptions *options = @{SDImageCoderEncodeCompressionQuality : @(compressionQuality), SDImageCoderEncodeFirstFrameOnly : @(firstFrameOnly)};
    return [[SDImageCodersManager sharedManager] encodedDataWithImage:self format:imageFormat options:options];
}

@end
