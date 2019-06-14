//
//  QRCodeEncoder.h
//  libqrencode
//
//  Created by 兵伍 on 2019/6/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QRCodeGenerator : NSObject
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)size;
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)size fillColor:(UIColor *)color borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth margin:(CGFloat)margin;
@end


