/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com"
 * (c) Florent Vilmart
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDWebImageCompat.h"

//! Project version number for SDWebImage.
FOUNDATION_EXPORT double SDWebImageVersionNumber;

//! Project version string for SDWebImage.
FOUNDATION_EXPORT const unsigned char SDWebImageVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import "PublicHeader.h"

#import "PGSDWebImageManager.h"
#import "SDWebImageCacheKeyFilter.h"
#import "SDWebImageCacheSerializer.h"
#import "SDImageCacheConfig.h"
#import "PGSDImageCache.h"
#import "SDMemoryCache.h"
#import "SDDiskCache.h"
#import "SDImageCacheDefine.h"
#import "SDImageCachesManager.h"
#import "UIView+WebCache.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+HighlightedWebCache.h"
#import "SDWebImageDownloaderConfig.h"
#import "PGSDWebImageDownloaderOperation.h"
#import "SDWebImageDownloaderRequestModifier.h"
#import "SDWebImageDownloaderResponseModifier.h"
#import "SDWebImageDownloaderDecryptor.h"
#import "SDImageLoader.h"
#import "SDImageLoadersManager.h"
#import "UIButton+WebCache.h"
#import "PGSDWebImagePrefetcher.h"
#import "UIView+WebCacheOperation.h"
#import "UIImage+Metadata.h"
#import "UIImage+MultiFormat.h"
#import "UIImage+MemoryCacheCost.h"
#import "UIImage+ExtendedCacheData.h"
#import "SDWebImageOperation.h"
#import "PGSDWebImageDownloader.h"
#import "SDWebImageTransition.h"
#import "SDWebImageIndicator.h"
#import "SDImageTransformer.h"
#import "UIImage+Transform.h"
#import "SDAnimatedImage.h"
#import "SDAnimatedImageView.h"
#import "SDAnimatedImageView+WebCache.h"
#import "SDAnimatedImagePlayer.h"
#import "SDImageCodersManager.h"
#import "SDImageCoder.h"
#import "SDImageAPNGCoder.h"
#import "SDImageGIFCoder.h"
#import "SDImageIOCoder.h"
#import "SDImageFrame.h"
#import "SDImageCoderHelper.h"
#import "SDImageGraphics.h"
#import "SDGraphicsImageRenderer.h"
#import "UIImage+GIF.h"
#import "UIImage+ForceDecode.h"
#import "NSData+ImageContentType.h"
#import "SDWebImageDefine.h"
#import "SDWebImageError.h"
#import "SDWebImageOptionsProcessor.h"
#import "SDImageIOAnimatedCoder.h"
#import "SDImageHEICCoder.h"
#import "SDImageAWebPCoder.h"

// Mac
#if __has_include("NSImage+Compatibility.h")
#import "NSImage+Compatibility.h"
#endif
#if __has_include("NSButton+WebCache.h")
#import "NSButton+WebCache.h"
#endif
#if __has_include("SDAnimatedImageRep.h")
#import "SDAnimatedImageRep.h"
#endif

// MapKit
#if __has_include("MKAnnotationView+WebCache.h")
#import "MKAnnotationView+WebCache.h"
#endif
