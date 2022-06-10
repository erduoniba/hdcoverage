//
//  UIImageView+JX.swift
//  pgImageModule
//
//  Created by denglibing on 2021/3/15.
//

import Foundation
import UIKit

extension JXImageWrapper where Base: UIImageView {
    /// 加载网络图片
    /// - Parameters:
    ///   - url: 图片URL
    ///   - placeholder: 兜底图片
    ///   - options: 图片加载设置
    public func setImage(url: URL?, placeholder: UIImage? = nil, options: OptionsInfo, completionHandler: ((Result<UIImage, NSError>) -> Void)? = nil) {
        let options = JXImageParsedOptionsInfo(defaultOptions + options)
        _setImage(url: url, placeholder: placeholder, options: options, completionHandler: completionHandler)
    }

    func _setImage(url: URL?, placeholder: UIImage?, options: JXImageParsedOptionsInfo, completionHandler: ((Result<UIImage, NSError>) -> Void)? = nil) {
        let options2: [PGWebImageOptions: Any] = [.enable: options.webpEnable ?? true, .degradeQuality: options.degradeQuality ?? true, .ccSize: options.ccSize ?? .zero, .imageSize: options.imageSize ?? .zero, .cacheOnly: options.cacheOnly ?? false, .cacheType: (options.cacheType ?? .all).rawValue]
        base.jx_setImage(with: url, placeholder: placeholder, options: options2) { image in
            completionHandler?(.success(image))
        } failure: { error in
            #warning("错误信息需要完善")
            let error2 = error ?? NSError(domain: "com.imagemodule.error", code: -1234, userInfo: nil)
            completionHandler?(.failure(error2 as NSError))
        }
    }
}

public typealias OptionsInfo = [OptionsInfoItem]

public enum ImageCacheType: Int {
    case none
    case disk
    case memory
    case all
}

/// The aspect ratio of the image.
///   - webpEnable: 启动webp，默认开启。
///   - degradeQuality: 降级画质70%，默认开启。
///   - ccSize: 图片剪裁size，默认不裁剪。只支持JPG格式
///   - imageSize: 图片实际显示的size，CGSize。传pt不是像素。
public enum OptionsInfoItem {
    case webpEnable(Bool)
    case degradeQuality(Bool)
    case ccSize(CGSize)
    case imageSize(CGSize)
    case cacheOnly(Bool)
    case cacheType(ImageCacheType)
}

let defaultOptions: [OptionsInfoItem] = [.webpEnable(true), .degradeQuality(true)]

struct JXImageParsedOptionsInfo {
    public var webpEnable: Bool?
    public var degradeQuality: Bool?
    public var ccSize: CGSize?
    public var imageSize: CGSize?
    public var cacheOnly: Bool?
    public var cacheType: ImageCacheType?

    public init(_ info: OptionsInfo?) {
        guard let info = info else { return }

        for option in info {
            switch option {
            case let .webpEnable(value): webpEnable = value
            case let .degradeQuality(value): degradeQuality = value
            case let .ccSize(value): ccSize = value
            case let .imageSize(value): imageSize = value
            case let .cacheOnly(value): cacheOnly = value
            case let .cacheType(value): cacheType = value
            }
        }
    }
}

public struct JXImageWrapper<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol JXImageCompatible: AnyObject {}

public extension JXImageCompatible {
    /// Gets a namespace holder for JXImage compatible types.
    var jx: JXImageWrapper<Self> {
        get { return JXImageWrapper(self) }
        set {}
    }
}

extension UIImageView: JXImageCompatible {}
