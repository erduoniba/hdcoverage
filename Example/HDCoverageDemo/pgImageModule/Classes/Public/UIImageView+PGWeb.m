//
//  PGImageView+Addtion.m
//  pgBusinessFoundationModule
//
//  Created by denglibing on 2020/7/13.
//

#import <objc/runtime.h>

#import "SDInternalMacros.h"
#import "SDWebImage.h"
#import "UIImageView+PGWeb.h"

PGWebImageOptions const PGWebImageOptionsEnable = @"enable";
PGWebImageOptions const PGWebImageOptionsDegradeQuality = @"degradeQuality";
PGWebImageOptions const PGWebImageOptionsCCSize = @"ccSize";
PGWebImageOptions const PGWebImageOptionsImageSize = @"imageSize";
PGWebImageOptions const PGWebImageOptionsCacheOnly = @"cacheOnly";
PGWebImageOptions const PGWebImageOptionsCacheType = @"cacheType";

@implementation UIImageView (PGWeb)

- (void)jx_setImageWithURL:(nullable NSURL *)url placeholder:(nullable UIImage *)placeholder options:(NSDictionary<PGWebImageOptions, id> *)options {
    [self jx_setImageWithURL:url placeholder:placeholder options:options success:nil failure:nil];
}

- (void)jx_setImageWithURL:(nullable NSURL *)url
               placeholder:(nullable UIImage *)placeholder
                   options:(NSDictionary<PGWebImageOptions, id> *)options
                   success:(nullable void (^)(UIImage *image))success
                   failure:(nullable void (^)(NSError *error))failure {
    // 链接为空
#warning 链接错误需要给一点提示
    if (url == nil || url.absoluteString.length == 0) {
        [self internal_setImageWithURL:url placeholder:placeholder options:0 context:nil success:success failure:failure];
        return;
    }
    // 协议为空
    if (url.scheme == nil) {
        [self internal_setImageWithURL:nil placeholder:placeholder options:0 context:nil success:success failure:failure];
        return;
    }
#warning 性能优化，参数移动到异步队列处理
    BOOL enable = options[PGWebImageOptionsEnable] ? [options[PGWebImageOptionsEnable] boolValue] : YES;
    BOOL degradeQuality = options[PGWebImageOptionsDegradeQuality] ? [options[PGWebImageOptionsDegradeQuality] boolValue] : YES;
    NSInteger cacheType = options[PGWebImageOptionsCacheType] ? [options[PGWebImageOptionsCacheType] integerValue] : JXImageCacheTypeAll;
    NSInteger quality = degradeQuality ? 70 : 100;
    CGSize ccSize = options[PGWebImageOptionsCCSize] ? [options[PGWebImageOptionsCCSize] CGSizeValue] : CGSizeZero;
    //
    CGSize imageSize = options[PGWebImageOptionsImageSize] ? [options[PGWebImageOptionsImageSize] CGSizeValue] : CGSizeZero;
    CGFloat scale = UIScreen.mainScreen.scale;
    CGSize pixelSize = CGSizeMake(imageSize.width * scale, imageSize.height * scale);
    //
    // 原始图片添加缩放参数
    BOOL isGIF = [url.pathExtension isEqualToString:@"gif"];
    NSMutableDictionary<SDWebImageContextOption, id> *originContext = [NSMutableDictionary dictionaryWithDictionary:@{SDWebImageContextStoreCacheType: @(cacheType)}];
    //
    if (!CGSizeEqualToSize(pixelSize, CGSizeZero)) {
        originContext[SDWebImageContextImageThumbnailPixelSize] = @(pixelSize);
    }
    //
    if (isGIF) {
        if ([self isKindOfClass:SDAnimatedImageView.class]) {
            originContext[SDWebImageContextAnimatedImageClass] = SDAnimatedImage.class;
        }
    }
    
    [self internal_setImageWithURL:url placeholder:placeholder options:options context:nil success:success failure:failure];
}

- (void)internal_setImageWithURL:(NSURL *)url
                     placeholder:(UIImage *)placeholder
                         options:(SDWebImageOptions)options
                         context:(nullable SDWebImageContext *)context
                         success:(void (^)(UIImage *image))success
                         failure:(void (^)(NSError *_Nullable error))failure {
    [self jx_setImageWithURL:url
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
