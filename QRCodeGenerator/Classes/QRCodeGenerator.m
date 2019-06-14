//
//  QRCodeEncoder.m
//  libqrencode
//
//  Created by 兵伍 on 2019/6/13.
//

#import "QRCodeGenerator.h"
#import "qrencode.h"

@implementation QRCodeGenerator
    
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)size {
    return [self qrImageForString:string imageSize:size fillColor:[UIColor blackColor] borderColor:nil borderWidth:0 margin:10];
}
    
+ (UIImage *)qrImageForString:(NSString *)string imageSize:(CGFloat)size fillColor:(UIColor *)color borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth margin:(CGFloat)margin {
    if (![string length]) {
        return nil;
    }
    
    QRcode *code = QRcode_encodeString([string UTF8String], 0, QR_ECLEVEL_L, QR_MODE_8, 1);
    if (!code) {
        return nil;
    }
    
    // draw QR
    UIImage *qrImage = [QRCodeGenerator drawQRCode:code size:size fillColor:color borderColor:borderColor borderWidth:borderWidth margin:margin];
    QRcode_free(code);
    
    return qrImage;
}
    
+ (UIImage *)drawQRCode:(QRcode *)code size:(CGFloat)size fillColor:(UIColor *)color borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth margin:(CGFloat)margin {
    CGFloat qr_margin = margin;
    unsigned char *data = 0;
    int width;
    data = code->data;
    width = code->width;
    float zoom = (double)(size - 2 * qr_margin) / (code->width);
    CGRect rectDraw = CGRectMake(0, 0, zoom, zoom);
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size, size);
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // back
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    
    // border
    if (borderColor && borderWidth > 0) {
        CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
        CGContextStrokeRectWithWidth(context, rect, borderWidth);
    }
    
    // code
    for(int i = 0; i < width; ++i) {
        for(int j = 0; j < width; ++j) {
            if(*data & 1) {
                rectDraw.origin = CGPointMake(qr_margin + j * zoom, qr_margin + i * zoom);
                CGContextAddRect(context, rectDraw);
            }
            ++data;
        }
    }
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
