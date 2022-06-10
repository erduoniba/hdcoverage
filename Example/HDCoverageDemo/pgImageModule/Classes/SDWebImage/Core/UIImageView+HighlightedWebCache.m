/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIImageView+HighlightedWebCache.h"

#if SD_UIKIT

#import "SDInternalMacros.h"
#import "UIView+WebCache.h"
#import "UIView+WebCacheOperation.h"

static NSString *const SDHighlightedImageOperationKey = @"UIImageViewImageOperationHighlighted";

@implementation UIImageView (HighlightedWebCache)

- (void)jx_setHighlightedImageWithURL:(nullable NSURL *)url {
    [self jx_setHighlightedImageWithURL:url options:0 progress:nil completed:nil];
}

- (void)jx_setHighlightedImageWithURL:(nullable NSURL *)url options:(SDWebImageOptions)options {
    [self jx_setHighlightedImageWithURL:url options:options progress:nil completed:nil];
}

- (void)jx_setHighlightedImageWithURL:(nullable NSURL *)url options:(SDWebImageOptions)options context:(nullable SDWebImageContext *)context {
    [self jx_setHighlightedImageWithURL:url options:options context:context progress:nil completed:nil];
}

- (void)jx_setHighlightedImageWithURL:(nullable NSURL *)url completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setHighlightedImageWithURL:url options:0 progress:nil completed:completedBlock];
}

- (void)jx_setHighlightedImageWithURL:(nullable NSURL *)url options:(SDWebImageOptions)options completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setHighlightedImageWithURL:url options:options progress:nil completed:completedBlock];
}

- (void)jx_setHighlightedImageWithURL:(NSURL *)url
                              options:(SDWebImageOptions)options
                             progress:(nullable SDImageLoaderProgressBlock)progressBlock
                            completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setHighlightedImageWithURL:url options:options context:nil progress:progressBlock completed:completedBlock];
}

- (void)jx_setHighlightedImageWithURL:(nullable NSURL *)url
                              options:(SDWebImageOptions)options
                              context:(nullable SDWebImageContext *)context
                             progress:(nullable SDImageLoaderProgressBlock)progressBlock
                            completed:(nullable SDExternalCompletionBlock)completedBlock {
    @weakify(self);
    SDWebImageMutableContext *mutableContext;
    if (context) {
        mutableContext = [context mutableCopy];
    } else {
        mutableContext = [NSMutableDictionary dictionary];
    }
    mutableContext[SDWebImageContextSetImageOperationKey] = SDHighlightedImageOperationKey;
    [self jx_internalSetImageWithURL:url
        placeholderImage:nil
        options:options
        context:mutableContext
        setImageBlock:^(UIImage *_Nullable image, NSData *_Nullable imageData, SDImageCacheType cacheType, NSURL *_Nullable imageURL) {
          @strongify(self);
          self.highlightedImage = image;
        }
        progress:progressBlock
        completed:^(UIImage *_Nullable image, NSData *_Nullable data, NSError *_Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL *_Nullable imageURL) {
          if (completedBlock) {
              completedBlock(image, error, cacheType, imageURL);
          }
        }];
}

@end

#endif
