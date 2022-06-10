/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDAssociatedObject.h"

#import "UIImage+ExtendedCacheData.h"
#import "UIImage+ForceDecode.h"
#import "UIImage+MemoryCacheCost.h"
#import "UIImage+Metadata.h"

void SDImageCopyAssociatedObject(UIImage* _Nullable source, UIImage* _Nullable target) {
    if (!source || !target) {
        return;
    }
    // Image Metadata
    target.jx_isIncremental = source.jx_isIncremental;
    target.jx_imageLoopCount = source.jx_imageLoopCount;
    target.jx_imageFormat = source.jx_imageFormat;
    // Force Decode
    target.jx_isDecoded = source.jx_isDecoded;
    // Extended Cache Data
    target.jx_extendedObject = source.jx_extendedObject;
}
