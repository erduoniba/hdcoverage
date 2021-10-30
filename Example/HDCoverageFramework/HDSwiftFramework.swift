//
//  HDSwiftDemo.swift
//  HDCoverFramework
//
//  Created by denglibing on 2021/10/20.
//

import Foundation

public struct HDSwiftFramework {
    static public func saveProfile() {
        print("HDCoverFramework File Name: \(String(cString: __llvm_profile_get_filename()) )")
        
        let name = "HDCoverFramework.profraw"
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let filePath: NSString = documentDirectory.appendingPathComponent(name).path as NSString
            __llvm_profile_set_filename(filePath.utf8String)
            __llvm_profile_write_file()
        } catch {
            print(error)
        }
    }
    
    public static func frameworkSwiftAction(_ tag: Int) {
        if (tag == 1) {
            print("frameworkSwiftAction: 1")
        }
        else if (tag == 2) {
            print("frameworkSwiftAction: 2")
        }
        else if (tag == 3) {
            print("frameworkSwiftAction: 3")
        }
        
        // 如果是动态库，需要自己处理插桩的代码，并且找到动态库的可执行文件进行计算
        // 如果是静态库，则不需要下面的代码，直接使用主工程的即可
//        saveProfile()
    }
}



