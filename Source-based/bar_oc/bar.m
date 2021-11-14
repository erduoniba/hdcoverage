#include <stdio.h>

int add(int x, int y) {
    return x + y;
}

void printTest(int x) {
    printf("begin\n");
    if ( x > 100) {
        printf("input > 100 \n");
    }
    else if ( x > 60) {
        printf(" 60 < input <= 100\n");
    }
    else if ( x > 0) {
        printf(" 0 < input <= 60\n");
    }
    else {
        printf(" input <= 0\n");
    }
    printf("end\n");
}

int main(void) {
    
    printTest(12);
    printTest(8);
    printTest(0);
    
    int r = add(1, 2);
    printf("result: %d\n", r);
    
    
    return 0;
}


/*
 // 覆盖率编译
 clang -fprofile-instr-generate -fcoverage-mapping bar.m -o bar_coverage
 // 正常编译
 clang bar.m -o bar_no_coverage
 
 // 执行代码，会在当前目录得到 default.profraw
 ./bar_coverage
 
 // 生成执行的代码数据
 xcrun llvm-profdata merge -sparse default.profraw -o bar_coverage.profdata
 
 # 查看profdata数据
 xcrun llvm-profdata show -all-functions -instr bar_coverage.profdata > bar_coverage_profdata.text
 
 # 导出为html
 xcrun llvm-cov show ./bar_coverage -instr-profile=bar_coverage.profdata -use-color -format=html -output-dir bar_coverage_html

# 生成汇编
 xcrun -sdk iphonesimulator clang -S -fobjc-arc bar.m -o main.s

 */

