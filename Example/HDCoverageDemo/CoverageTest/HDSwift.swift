//
//  HDSwift.swift
//  HDCoverageDemo
//
//  Created by denglibing on 2021/10/21.
//

import Foundation
import UIKit

struct HDSwift {
    static func projectSwiftAction(_ tag: Int) {
        if (tag == 1) {
            print("projectSwiftAction: 1")
        }
        else if (tag == 2) {
            print("projectSwiftAction: 2")
        }
        else if (tag == 3) {
            print("projectSwiftAction: 3")
        }
        
        UIView.animate(withDuration: 0.1, delay: 0.3, options: .allowAnimatedContent) {
            if arc4random() % 2 == 0 {
                print("animate block 1")
            }
            else {
                print("animate block 2")
            }
        } completion: { _ in
            print("completion block")
        }

    }
}
