//
//  HDGatherCoverage.m
//  HDCoverage
//
//  Created by denglibing on 2021/10/27.
//

#import "HDGatherCoverage.h"

@implementation HDGatherCoverage

int __llvm_profile_runtime = 0;
void __llvm_profile_initialize_file(void);
const char *__llvm_profile_get_filename();
void __llvm_profile_set_filename(const char *);
int __llvm_profile_write_file();
int __llvm_profile_register_write_file_atexit(void);
const char *__llvm_profile_get_path_prefix();

+ (void)load {
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(didEnterBackgroundNotification) name:UIApplicationDidEnterBackgroundNotification object:nil];
}

+ (void)didEnterBackgroundNotification {
    [self saveAndUpload];
}

+ (void)saveAndUpload {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];//获取app版本信息
    NSString *targetName = [infoDictionary objectForKey:@"CFBundleExecutable"];
    NSLog(@"CFBundleExecutable: %@",targetName);
    NSString *documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [documentPath stringByAppendingPathComponent:[NSString stringWithFormat:@"coverage_files/%@.profraw", targetName]];
    NSLog(@"filePath: %@", filePath);
    __llvm_profile_set_filename(filePath.UTF8String);
    __llvm_profile_write_file();
}

@end
