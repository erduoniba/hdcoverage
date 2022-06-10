/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "UIButton+WebCache.h"

#if SD_UIKIT

#import "SDInternalMacros.h"
#import "UIView+WebCache.h"
#import "UIView+WebCacheOperation.h"
#import "objc/runtime.h"

static char imageURLStorageKey;

typedef NSMutableDictionary<NSString *, NSURL *> SDStateImageURLDictionary;

static inline NSString *imageURLKeyForState(UIControlState state) { return [NSString stringWithFormat:@"image_%lu", (unsigned long)state]; }

static inline NSString *backgroundImageURLKeyForState(UIControlState state) { return [NSString stringWithFormat:@"backgroundImage_%lu", (unsigned long)state]; }

static inline NSString *imageOperationKeyForState(UIControlState state) { return [NSString stringWithFormat:@"UIButtonImageOperation%lu", (unsigned long)state]; }

static inline NSString *backgroundImageOperationKeyForState(UIControlState state) { return [NSString stringWithFormat:@"UIButtonBackgroundImageOperation%lu", (unsigned long)state]; }

@implementation UIButton (WebCache)

#pragma mark - Image

- (nullable NSURL *)jx_currentImageURL {
    NSURL *url = self.jx_imageURLStorage[imageURLKeyForState(self.state)];

    if (!url) {
        url = self.jx_imageURLStorage[imageURLKeyForState(UIControlStateNormal)];
    }

    return url;
}

- (nullable NSURL *)jx_imageURLForState:(UIControlState)state {
    return self.jx_imageURLStorage[imageURLKeyForState(state)];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state {
    [self jx_setImageWithURL:url forState:state placeholderImage:nil options:0 completed:nil];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder {
    [self jx_setImageWithURL:url forState:state placeholderImage:placeholder options:0 completed:nil];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder options:(SDWebImageOptions)options {
    [self jx_setImageWithURL:url forState:state placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url
                  forState:(UIControlState)state
          placeholderImage:(nullable UIImage *)placeholder
                   options:(SDWebImageOptions)options
                   context:(nullable SDWebImageContext *)context {
    [self jx_setImageWithURL:url forState:state placeholderImage:placeholder options:options context:context progress:nil completed:nil];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setImageWithURL:url forState:state placeholderImage:nil options:0 completed:completedBlock];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setImageWithURL:url forState:state placeholderImage:placeholder options:0 completed:completedBlock];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url
                  forState:(UIControlState)state
          placeholderImage:(nullable UIImage *)placeholder
                   options:(SDWebImageOptions)options
                 completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setImageWithURL:url forState:state placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url
                  forState:(UIControlState)state
          placeholderImage:(nullable UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(nullable SDImageLoaderProgressBlock)progressBlock
                 completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setImageWithURL:url forState:state placeholderImage:placeholder options:options context:nil progress:progressBlock completed:completedBlock];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url
                  forState:(UIControlState)state
          placeholderImage:(nullable UIImage *)placeholder
                   options:(SDWebImageOptions)options
                   context:(nullable SDWebImageContext *)context
                  progress:(nullable SDImageLoaderProgressBlock)progressBlock
                 completed:(nullable SDExternalCompletionBlock)completedBlock {
    if (!url) {
        [self.jx_imageURLStorage removeObjectForKey:imageURLKeyForState(state)];
    } else {
        self.jx_imageURLStorage[imageURLKeyForState(state)] = url;
    }

    SDWebImageMutableContext *mutableContext;
    if (context) {
        mutableContext = [context mutableCopy];
    } else {
        mutableContext = [NSMutableDictionary dictionary];
    }
    mutableContext[SDWebImageContextSetImageOperationKey] = imageOperationKeyForState(state);
    @weakify(self);
    [self jx_internalSetImageWithURL:url
        placeholderImage:placeholder
        options:options
        context:mutableContext
        setImageBlock:^(UIImage *_Nullable image, NSData *_Nullable imageData, SDImageCacheType cacheType, NSURL *_Nullable imageURL) {
          @strongify(self);
          [self setImage:image forState:state];
        }
        progress:progressBlock
        completed:^(UIImage *_Nullable image, NSData *_Nullable data, NSError *_Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL *_Nullable imageURL) {
          if (completedBlock) {
              completedBlock(image, error, cacheType, imageURL);
          }
        }];
}

#pragma mark - Background Image

- (nullable NSURL *)jx_currentBackgroundImageURL {
    NSURL *url = self.jx_imageURLStorage[backgroundImageURLKeyForState(self.state)];

    if (!url) {
        url = self.jx_imageURLStorage[backgroundImageURLKeyForState(UIControlStateNormal)];
    }

    return url;
}

- (nullable NSURL *)jx_backgroundImageURLForState:(UIControlState)state {
    return self.jx_imageURLStorage[backgroundImageURLKeyForState(state)];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:nil options:0 completed:nil];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:0 completed:nil];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholderImage:(nullable UIImage *)placeholder options:(SDWebImageOptions)options {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url
                            forState:(UIControlState)state
                    placeholderImage:(nullable UIImage *)placeholder
                             options:(SDWebImageOptions)options
                             context:(nullable SDWebImageContext *)context {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:options context:context progress:nil completed:nil];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url forState:(UIControlState)state completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:nil options:0 completed:completedBlock];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url
                            forState:(UIControlState)state
                    placeholderImage:(nullable UIImage *)placeholder
                           completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:0 completed:completedBlock];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url
                            forState:(UIControlState)state
                    placeholderImage:(nullable UIImage *)placeholder
                             options:(SDWebImageOptions)options
                           completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url
                            forState:(UIControlState)state
                    placeholderImage:(nullable UIImage *)placeholder
                             options:(SDWebImageOptions)options
                            progress:(nullable SDImageLoaderProgressBlock)progressBlock
                           completed:(nullable SDExternalCompletionBlock)completedBlock {
    [self jx_setBackgroundImageWithURL:url forState:state placeholderImage:placeholder options:options context:nil progress:progressBlock completed:completedBlock];
}

- (void)jx_setBackgroundImageWithURL:(nullable NSURL *)url
                            forState:(UIControlState)state
                    placeholderImage:(nullable UIImage *)placeholder
                             options:(SDWebImageOptions)options
                             context:(nullable SDWebImageContext *)context
                            progress:(nullable SDImageLoaderProgressBlock)progressBlock
                           completed:(nullable SDExternalCompletionBlock)completedBlock {
    if (!url) {
        [self.jx_imageURLStorage removeObjectForKey:backgroundImageURLKeyForState(state)];
    } else {
        self.jx_imageURLStorage[backgroundImageURLKeyForState(state)] = url;
    }

    SDWebImageMutableContext *mutableContext;
    if (context) {
        mutableContext = [context mutableCopy];
    } else {
        mutableContext = [NSMutableDictionary dictionary];
    }
    mutableContext[SDWebImageContextSetImageOperationKey] = backgroundImageOperationKeyForState(state);
    @weakify(self);
    [self jx_internalSetImageWithURL:url
        placeholderImage:placeholder
        options:options
        context:mutableContext
        setImageBlock:^(UIImage *_Nullable image, NSData *_Nullable imageData, SDImageCacheType cacheType, NSURL *_Nullable imageURL) {
          @strongify(self);
          [self setBackgroundImage:image forState:state];
        }
        progress:progressBlock
        completed:^(UIImage *_Nullable image, NSData *_Nullable data, NSError *_Nullable error, SDImageCacheType cacheType, BOOL finished, NSURL *_Nullable imageURL) {
          if (completedBlock) {
              completedBlock(image, error, cacheType, imageURL);
          }
        }];
}

#pragma mark - Cancel

- (void)jx_cancelImageLoadForState:(UIControlState)state {
    [self jx_cancelImageLoadOperationWithKey:imageOperationKeyForState(state)];
}

- (void)jx_cancelBackgroundImageLoadForState:(UIControlState)state {
    [self jx_cancelImageLoadOperationWithKey:backgroundImageOperationKeyForState(state)];
}

#pragma mark - Private

- (SDStateImageURLDictionary *)jx_imageURLStorage {
    SDStateImageURLDictionary *storage = objc_getAssociatedObject(self, &imageURLStorageKey);
    if (!storage) {
        storage = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &imageURLStorageKey, storage, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }

    return storage;
}

@end

#endif
