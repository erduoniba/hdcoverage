//
//  PGImageView+Addtion.m
//  pgBusinessFoundationModule
//
//  Created by denglibing on 2020/7/13.
//

#import <objc/runtime.h>

#import "SDAnimatedImage.h"
#import "SDInternalMacros.h"
#import "SDWebImage.h"
#import "UIButton+PGWeb.h"
#import "UIImageView+PGWeb.h"

typedef NSString *PGWebImageOptions NS_STRING_ENUM;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsEnable;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsDegradeQuality;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsCCSize;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsImageSize;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsCacheOnly;
FOUNDATION_EXPORT PGWebImageOptions const PGWebImageOptionsCacheType;

@implementation UIButton (PGWeb)

- (void)jx_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholder:(nullable UIImage *)placeholder options:(NSDictionary<PGWebImageOptions, id> *)options {
    [self jx_setImageWithURL:url forState:state placeholder:placeholder options:options success:nil failure:nil];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url
                  forState:(UIControlState)state
               placeholder:(nullable UIImage *)placeholder
                   options:(NSDictionary<PGWebImageOptions, id> *)options
                   success:(nullable void (^)(UIImage *image))success
                   failure:(nullable void (^)(NSError *error))failure {
    // 链接为空
#warning 链接错误需要给一点提示
    if (url == nil || url.absoluteString.length == 0) {
        [self internal_setImageWithURL:url forState:state placeholder:placeholder options:0 context:nil success:success failure:failure];
        return;
    }
#warning 性能优化，参数移动到异步队列处理
    BOOL enable = options[PGWebImageOptionsEnable] ? [options[PGWebImageOptionsEnable] boolValue] : YES;
    BOOL degradeQuality = options[PGWebImageOptionsDegradeQuality] ? [options[PGWebImageOptionsDegradeQuality] boolValue] : YES;
    NSInteger quality = degradeQuality ? 70 : 100;
    CGSize ccSize = options[PGWebImageOptionsCCSize] ? [options[PGWebImageOptionsCCSize] CGSizeValue] : CGSizeZero;
    //
    CGSize imageSize = options[PGWebImageOptionsImageSize] ? [options[PGWebImageOptionsImageSize] CGSizeValue] : CGSizeZero;
    CGFloat scale = UIScreen.mainScreen.scale;
    CGSize pixelSize = CGSizeMake(imageSize.width * scale, imageSize.height * scale);
    // 原始图片添加缩放参数
    BOOL isGIF = [url.pathExtension isEqualToString:@"gif"];
    NSMutableDictionary<SDWebImageContextOption, id> *originContext = [NSMutableDictionary dictionaryWithCapacity:2];
    originContext[SDWebImageContextImageThumbnailPixelSize] = @(pixelSize);
    if (isGIF) {
        if ([self isKindOfClass:SDAnimatedImageView.class]) {
            originContext[SDWebImageContextAnimatedImageClass] = SDAnimatedImage.class;
        }
    }

    //
    SDWebImageOptions sdOptions = 0;
    //
    BOOL cacheOnly = [options[PGWebImageOptionsCacheOnly] boolValue];
    if (cacheOnly) {
        sdOptions = SDWebImageFromCacheOnly;
    }
    
    // 使用新连接
    NSMutableDictionary<SDWebImageContextOption, id> *newImageContext = [NSMutableDictionary dictionaryWithCapacity:2];
    if (isGIF) {
        newImageContext[SDWebImageContextImageThumbnailPixelSize] = @(pixelSize);
        if ([self isKindOfClass:SDAnimatedImageView.class]) {
            newImageContext[SDWebImageContextAnimatedImageClass] = SDAnimatedImage.class;
        }
    }
    
    [self internal_setImageWithURL:url forState:state placeholder:placeholder options:options context:nil success:success failure:failure];
}

- (void)internal_setImageWithURL:(NSURL *)url
                        forState:(UIControlState)state
                     placeholder:(UIImage *)placeholder
                         options:(SDWebImageOptions)options
                         context:(nullable SDWebImageContext *)context
                         success:(void (^)(UIImage *image))success
                         failure:(void (^)(NSError *_Nullable error))failure {
    [self jx_setImageWithURL:url
                    forState:state
            placeholderImage:placeholder
                     options:options
                     context:context
                    progress:nil
                   completed:^(UIImage *_Nullable image, NSError *_Nullable error, SDImageCacheType cacheType, NSURL *_Nullable imageURL) {
                       if (image) {
                           if (success) {
                               success(image);
                           }
                       } else {
                           if (failure) {
                               failure(error);
                           }
                       }
                   }];
}

@end
