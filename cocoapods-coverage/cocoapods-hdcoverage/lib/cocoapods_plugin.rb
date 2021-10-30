require 'cocoapods-hdcoverage/command'
# 引用 cocoapods 包
require 'cocoapods'

module CocoapodsHdcoverage
	  # 注册 pod install 钩子
    Pod::HooksManager.register('cocoapods-hdcoverage', :post_install) do |context|
        p "cocoapods-hdcoverage hook post_install"
    end

    def method_name
    	
    end
end
