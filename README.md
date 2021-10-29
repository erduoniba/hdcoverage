# HDCoverage

[![CI Status](https://img.shields.io/travis/denglibing/HDCoverage.svg?style=flat)](https://travis-ci.org/denglibing/HDCoverage)
[![Version](https://img.shields.io/cocoapods/v/HDCoverage.svg?style=flat)](https://cocoapods.org/pods/HDCoverage)
[![License](https://img.shields.io/cocoapods/l/HDCoverage.svg?style=flat)](https://cocoapods.org/pods/HDCoverage)
[![Platform](https://img.shields.io/cocoapods/p/HDCoverage.svg?style=flat)](https://cocoapods.org/pods/HDCoverage)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

HDCoverage is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'HDCoverage'
```



**Use**

Build Phases add `New Run Script Phase`

```
"${PODS_ROOT}/HDCoverage/HDCoverage/hd_coverage_env.sh"
```

![image-20211029141436560](./Img/image-20211029141436560.png)



Xcode Build, Build Settings will add `-profile-generate -profile-coverage-mapping` to `Other Swift Flgs` (Swift Code Coverage Setting), add `-fprofile-instr-generate -fcoverage-mapping` to `Other C Flags` and `Other C++ Flags` (OC Code Coverage Setting)

![image-20211022144208211](./Img/image-20211022144208211.png)

## Author

denglibing, denglibing3@jd.com

## License

HDCoverage is available under the MIT license. See the LICENSE file for more info.
