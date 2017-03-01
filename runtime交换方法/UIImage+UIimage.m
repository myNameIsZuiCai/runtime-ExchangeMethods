//
//  UIImage+UIimage.m
//  runtime交换方法
//
//  Created by 这个男人来自地球 on 2017/2/28.
//  Copyright © 2017年 zhang yannan. All rights reserved.
//

#import "UIImage+UIimage.h"
#import <objc/message.h>
@implementation UIImage (UIimage)
//加载分类的时候调用
+(void)load{
    NSLog(@"%s",__func__);
    //获取一个类方法
   Method m1 = class_getClassMethod([UIImage class], @selector(imageNamed:));
    //获取一个对象方法
    Method m2=class_getInstanceMethod([UIImage class], @selector(zyn_imageNamed:));
    //交换方法实现
    method_exchangeImplementations(m1,m2);
}
+( __kindof UIImage*)zyn_imageNamed:(NSString *)imageName{
    //加载图片
    UIImage *image=[UIImage zyn_imageNamed:imageName];
    //判断功能
    if (image ==nil) {
        NSLog(@"图片加载为空");
    }
    return image;
}
@end
