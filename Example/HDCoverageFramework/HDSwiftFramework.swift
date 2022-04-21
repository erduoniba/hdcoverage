//
//  HDSwiftDemo.swift
//  HDCoverFramework
//
//  Created by denglibing on 2021/10/20.
//

import Foundation

public struct HDSwiftFramework {
    public static func frameworkSwiftAction(_ tag: Int) {
        if (tag == 1) {
            print("frameworkSwiftAction: 1")
        }
        else if (tag == 2) {
            print("frameworkSwiftAction: new line")
            print("frameworkSwiftAction: 2")
            if (arc4random() % 2 == 0) {
                print("frameworkSwiftAction: arc4random() %% 2 = 0")
            }
            else {
                print("frameworkSwiftAction: arc4random() %% 2 = 1")
            }
        }
        else if (tag == 3) {
            print("frameworkSwiftAction: 3")
        }
    }
}



