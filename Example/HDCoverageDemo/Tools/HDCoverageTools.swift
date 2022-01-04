//
//  Tools.swift
//  HDCoverageDemo
//
//  Created by denglibing on 2021/10/27.
//

import Foundation

class HDCoverageTools: NSObject {
    static var shared = HDCoverageTools()
 
    // 注意：动态库是需要单独注册，并且需要在动态库中执行__llvm_profile_write_file()
    func registerCoverage(moduleName: String) {
        let name = "\(moduleName).profraw"
        print("registerCoverage, moduleName: \(moduleName)")
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let filePath: NSString = documentDirectory.appendingPathComponent(name).path as NSString
            print("HDCoverageGather filePath: \(filePath)")
            __llvm_profile_set_filename(filePath.utf8String)
        } catch {
            print(error)
        }
        saveAndUpload()
    }
    
    // 合适的时机代码覆盖率上报
    func saveAndUpload() {
        __llvm_profile_write_file()
    }
}
