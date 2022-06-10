//
//  PGImageView+Addtion.h
//  pgBusinessFoundationModule
//
//  Created by denglibing on 2020/7/13.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, JXImageCacheType) {
    /**
     * For query and contains op in response, means the image isn't available in the image cache
     * For op in request, this type is not available and take no effect.
     */
    JXImageCacheTypeNone,
    /**
     * For query and contains op in response, means the image was obtained from the disk cache.
     * For op in request, means process only disk cache.
     */
    JXImageCacheTypeDisk,
    /**
     * For query and contains op in response, means the image was obtained from the memory cache.
     * For op in request, means process only memory cache.
     */
    JXImageCacheTypeMemory,
    /**
     * For query and contains op in response, this type is not available and take no effect.
     * For op in request, means process both memory cache and disk cache.
     */
    JXImageCacheTypeAll
};

NS_ASSUME_NONNULL_BEGIN

typedef NSString *PGWebImageOptions NS_STRING_ENUM;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsEnable;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsDegradeQuality;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsCCSize;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsImageSize;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsCacheOnly;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsCacheType;

@interface UIImageView (PGWeb)

/// 加载图片链接
@property (nonatomic, strong, readonly, nullable) NSURL *jx_imageURL;

/// 加载图片
/// @param url 图片链接
/// @param placeholder 兜底图片
/// @param options 图片设置
/// @warning 此API专用于`ObjC`，`Swift`请不要使用此API，使用`imageView.jx.setImage`
- (void)jx_setImageWithURL:(nullable NSURL *)url placeholder:(nullable UIImage *)placeholder options:(NSDictionary<PGWebImageOptions, id> *)options;

/// 加载图片
/// @param url 图片链接
/// @param placeholder 兜底图片
/// @param options 图片设置
/// @param success 成功回调
/// @param failure 失败回调
/// @warning 此API专用于`ObjC`，`Swift`请不要使用此API，使用`imageView.jx.setImage`
- (void)jx_setImageWithURL:(nullable NSURL *)url
               placeholder:(nullable UIImage *)placeholder
                   options:(NSDictionary<PGWebImageOptions, id> *)options
                   success:(nullable void (^)(UIImage *image))success
                   failure:(nullable void (^)(NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
