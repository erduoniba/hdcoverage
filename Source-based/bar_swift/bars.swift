func add(_ x: Int, _ y: Int) -> Int {
    return x + y
}

func main(_ x: Int) {
    print("begin")
    if ( x > 100) {
        print("input > 100")
    }
    else if ( x > 60) {
        print(" 60 < input <= 100")
    }
    else if ( x > 0) {
        print(" 0 < input <= 60")
    }
    else {
        print(" input <= 0")
    }
    print("end")
}


main(12)
main(8)
main(0)
print("\(add(1, 2))")


/*
// 覆盖率编译
swiftc -profile-generate -profile-coverage-mapping barswift -o bar_coverage
// 正常编译
swiftc barswift -o bar_no_coverage

// 执行代码，会在当前目录得到 defaultprofraw
/bar_coverage

// 生成执行的代码数据
xcrun llvm-profdata merge -sparse default.profraw -o bar_coverage.profdata

# 查看profdata数据
xcrun llvm-profdata show -all-functions -instr bar_coverageprofdata > bar_coverage_profdatatext

# 导出为html
xcrun llvm-cov show ./bar_coverage -instr-profile=bar_coverage.profdata -use-color -format=html -output-dir bar_coverage_html
 
# -path-equivalence 解决多台设备生成具体覆盖率为0的问题
xcrun llvm-cov show -instr-profile=bar_coverage.profdata -use-color -format=html bar_coverage -output-dir=bar_coverage_html -path-equivalence=/Users/denglibing/HDProject/HarryProject/iOS/hdcoverage/Source-based/bar_swift/,/Users/denglibing/HDProject/HarryProject/iOS/hdcoverage/Source-based/bar_swift/bars/
*/

