//
//  ViewController.m
//  OC_RSA
//
//  Created by 郑惠珠 on 2017/10/11.
//  Copyright © 2017年 Ashimar ZHENG. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncryptor.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    //原始数据
    NSString *originalString = @"这是加密的内容_123_sdlajkdla";
    
    //    NSString *AndroidEncrypt=@"jkHSSraua1hQ95VSTLiuBT7xvqF3lRkX4ex28UiDd6Eir4U0XSJvy3oVh28DLTck5Fji+Kz1sE4ebv73JjvLa7bndP7mss84J9Smcv3+EOZny/UV+8x4CV+rjSc8ZiPp8JuCCGT+1uMt8vPeqG9fwYl8tcDDzkLAmYnH9NGnYEONshtl05O8vRt9H0V05Y5zlpY0MByMzE7GNkwh6GvzYo3kAV3d6VuvfUIuIb7Grmw4p7r8w4ceLK2yMLVFri5G5P79+N0i1Ujb/1dFFWluqP8VVUWmXcqQ/6YFXEDiqolTasgScSHuEaNsQATZJxjeXdWSeZqw8zfxGlrqSKkklg==";
    //    //使用.der和.p12中的公钥私钥加密解密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    //
    NSString *encryptStr = [RSAEncryptor encryptString:originalString publicKeyWithContentsOfFile:public_key_path];
    NSLog(@"加密前:%@", originalString);
    NSLog(@"加密后:%@", encryptStr);
    NSLog(@"解密后:%@", [RSAEncryptor decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"123456"]);
    //    NSLog(@"Android解密后:%@", [RSAEncryptor decryptString:AndroidEncrypt privateKeyWithContentsOfFile:private_key_path password:@"ENSO"]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
