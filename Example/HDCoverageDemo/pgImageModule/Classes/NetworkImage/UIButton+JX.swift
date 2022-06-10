//
//  UIButton+JX.swift
//  pgImageModule
//
//  Created by denglibing on 2021/6/28.
//

import Foundation
import UIKit

extension JXImageWrapper where Base: UIButton {
    /// 加载网络图片
    /// - Parameters:
    ///   - url: 图片URL
    ///   - placeholder: 兜底图片
    ///   - options: 图片加载设置
    public func setImage(url: URL?, state: UIControl.State, placeholder: UIImage? = nil, options: OptionsInfo, completionHandler: ((Result<UIImage, NSError>) -> Void)? = nil) {
        let options = JXImageParsedOptionsInfo(defaultOptions + options)
        _setImage(url: url, state: state, placeholder: placeholder, options: options, completionHandler: completionHandler)
    }

    func _setImage(url: URL?, state: UIControl.State, placeholder: UIImage?, options: JXImageParsedOptionsInfo, completionHandler: ((Result<UIImage, NSError>) -> Void)? = nil) {
        let options2: [PGWebImageOptions: Any] = [.enable: options.webpEnable ?? true, .degradeQuality: options.degradeQuality ?? true, .ccSize: options.ccSize ?? .zero, .imageSize: options.imageSize ?? .zero, .cacheOnly: options.cacheOnly ?? false]
        base.jx_setImage(with: url, for: state, placeholder: placeholder, options: options2) { image in
            completionHandler?(.success(image))
        } failure: { error in
            #warning("错误信息需要完善")
            let error2 = error ?? NSError(domain: "com.imagemodule.error", code: -1234, userInfo: nil)
            completionHandler?(.failure(error2 as NSError))
        }
    }
}

extension UIButton: JXImageCompatible {}
