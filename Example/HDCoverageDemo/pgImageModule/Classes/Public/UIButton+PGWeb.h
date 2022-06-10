//
//  PGImageView+Addtion.h
//  pgBusinessFoundationModule
//
//  Created by denglibing on 2020/7/13.
//

#import <Foundation/Foundation.h>
#import "UIImageView+PGWeb.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (PGWeb)

/// 加载图片
/// @param url 图片链接
/// @param placeholder 兜底图片
/// @param options 图片设置
/// @warning 此API专用于`ObjC`，`Swift`请不要使用此API，使用`imageView.jx.setImage`
- (void)jx_setImageWithURL:(nullable NSURL *)url forState:(UIControlState)state placeholder:(nullable UIImage *)placeholder options:(NSDictionary<PGWebImageOptions, id> *)options;

/// 加载图片
/// @param url 图片链接
/// @param placeholder 兜底图片
/// @param options 图片设置
/// @param success 成功回调
/// @param failure 失败回调
/// @warning 此API专用于`ObjC`，`Swift`请不要使用此API，使用`imageView.jx.setImage`
- (void)jx_setImageWithURL:(nullable NSURL *)url
                  forState:(UIControlState)state
               placeholder:(nullable UIImage *)placeholder
                   options:(NSDictionary<PGWebImageOptions, id> *)options
                   success:(nullable void (^)(UIImage *image))success
                   failure:(nullable void (^)(NSError *_Nullable error))failure;

@end

NS_ASSUME_NONNULL_END
