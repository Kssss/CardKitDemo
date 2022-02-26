PAITBase是什么
==================

PAITBase是个人队伍iOS团队基于各自项目组分类、工具类等封装的基础组件库，里面有最常用的宏定义、基类、各种分类、各种工具类，旨在提高大家的开发效率，减少重复造轮子，避免项目中同种类型分类有多种相同实现方式，提高代码的统一性和稳定性。

## PAITBase基本组成

1、宏定义Macros：PAITCommonMacros、PAITColorMacros、PAITFontMacros；

2、基类BaseClasses：PAITBaseViewController、PAITBaseTabBarController、PAITBaseNavigationController、PAITBaseTabBar、PAITBaseTabBarItem等；

3、分类Categories：包括Foundation分类和UIKit分类：

Foundation分类：NSAttributedString、NSDate、NSObject、NSString、NSTimer；

UIKit分类：UIAlertViewController、UIApplication、UIButton、UIColor、UIControl、UIDevice、UIFont、UIGestureRecognizer、UIImage、UILabel、UITextField、UIView；

4、工具类Utils：PAITAlertView、PAITAuthorization、PAITEncryption、PAITUIFactory、PAITWeakProxy。

## PAITBase类和方法命名规范

类和方法最重要的就是做到见名知意。

1、宏定义规范：主要使用驼峰命名法，命名需要前缀 `PAIT` ，对于PAITColorMacros来说需要使用 `PAITColor_`

来作为前缀，比如 `PAITColor_FF6611` 平安橙色；对于PAITFontMacros来说需要使用 `PAITFont` 来作为前缀，比如 `PAITFont(aSize) ` 普通字体；

2、基类规范：主要使用驼峰命名法，类命名需要前缀 `PAITBase` ，比如 `PAITBaseViewController` 基类控制器；

3、分类规范：主要使用驼峰命名法，类命名需要 `系统类+PAIT+功能命名` ，比如 `NSString+PAITURL` 专门处理NSString的URL相关；属性命名需要 `pait_+属性名` ，比如 `UIButton+PAITAdd` 有属性 `pait_touchAreaInsets` 用来设置按钮额外点击区域的；方法命名需要 `pait_+方法名` ，比如 `UIColor+PAITHex` 有方法 `pait_colorWithHex` 根据16进制值生成Color对象；

4、工具类规范：主要使用驼峰命名法，类命名需要前缀 `PAIT` 。

## PAITBase使用方法

1、先导入私有库源 `pait-specs-ios` ，导入方法：[pait-specs-ios](http://code.paic.com.cn/#/repo/git/pait-specs-ios/master/tree) ；

2、在终端执行 `pod search PAITBase` ，如果能搜索到结果，那么私有库源就是成功的；

3、在 `Podfile` 加入 `pod 'PAITBase', '~>1.0.1' ` ，并在 `Podfile` 文件加上源地址 `source "ssh://git@code.paic.com.cn:8001/git/pait-specs-ios.git"` ；

4、最后执行 `pod install ` 安装 PAITBase组件，实际项目按照需求导入对应头文件即可使用。


## 更新记录

- 2022.01.07日发布1.0.2版本，更新内容：更新 UILabel+PAITAdd.m 文件， 修复pait_createLabelWithText:font:textColor:textAlignment:方法textAlignment入参写死问题。

- 2022.01.14日发布1.0.3版本，更新内容：更新PAITAuthorization文件，完善没有权限弹框的交互逻辑。




































