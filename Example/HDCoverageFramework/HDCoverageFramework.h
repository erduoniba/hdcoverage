//
//  HDCoverageFramework.h
//  HDCoverageFramework
//
//  Created by denglibing on 2021/10/30.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

#import <Foundation/Foundation.h>

//! Project version number for HDCoverageFramework.
FOUNDATION_EXPORT double HDCoverageFrameworkVersionNumber;

//! Project version string for HDCoverageFramework.
FOUNDATION_EXPORT const unsigned char HDCoverageFrameworkVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <HDCoverageFramework/PublicHeader.h>
#import "HDOCFramework.h"

int __llvm_profile_runtime = 0;
void __llvm_profile_initialize_file(void);
const char *__llvm_profile_get_filename();
void __llvm_profile_set_filename(const char *);
int __llvm_profile_write_file();
int __llvm_profile_register_write_file_atexit(void);
const char *__llvm_profile_get_path_prefix();

