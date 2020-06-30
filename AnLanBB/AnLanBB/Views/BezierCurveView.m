//
//  BezierCurveView.m
//  AnLanCustomers
//
//  Created by zk on 2020/3/28.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "BezierCurveView.h"

static CGRect myFrame;

@interface BezierCurveView ()

@end
@implementation BezierCurveView

//- (instancetype)initWithFrame:(CGRect)frame {
//    self =[super initWithFrame:frame];
//    if (self) {
//       
//        BezierCurveView *bezierCurveView = [[BezierCurveView alloc]init];
//         bezierCurveView.frame = frame;
//        
//        //背景视图
//        UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//        backView.backgroundColor = [UIColor greenColor];
//        [bezierCurveView addSubview:backView];
//        
//        myFrame = frame;
//        return bezierCurveView;
//        
//    }
//    return self;
//}


//初始化画布
+(instancetype)initWithFrame:(CGRect)frame{
    
     BezierCurveView *bezierCurveView = [[BezierCurveView alloc]init];
     bezierCurveView.frame = frame;
    
    //背景视图
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
//    backView.backgroundColor = [UIColor greenColor];
    [bezierCurveView addSubview:backView];
    
    myFrame = frame;
    return bezierCurveView;
}

- (void)setDorwColor:(UIColor *)dorwColor {
    _dorwColor = dorwColor;
}

/**
 *  画坐标轴
 */
-(void)drawXYLine:(NSMutableArray *)x_names{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //1.Y轴、X轴的直线
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(MARGIN, MARGIN)];
    
    [path moveToPoint:CGPointMake(MARGIN, CGRectGetHeight(myFrame)-MARGIN)];
    [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame), CGRectGetHeight(myFrame)-MARGIN)];
    
//    //2.添加箭头
//    [path moveToPoint:CGPointMake(MARGIN, MARGIN)];
//    [path addLineToPoint:CGPointMake(MARGIN-5, MARGIN+5)];
//    [path moveToPoint:CGPointMake(MARGIN, MARGIN)];
//    [path addLineToPoint:CGPointMake(MARGIN+5, MARGIN+5)];
//
//    [path moveToPoint:CGPointMake(CGRectGetWidth(myFrame), CGRectGetHeight(myFrame)-MARGIN)];
//    [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-5, CGRectGetHeight(myFrame)-MARGIN-5)];
//    [path moveToPoint:CGPointMake(CGRectGetWidth(myFrame), CGRectGetHeight(myFrame)-MARGIN)];
//    [path addLineToPoint:CGPointMake(CGRectGetWidth(myFrame)-5, CGRectGetHeight(myFrame)-MARGIN+5)];

    //3.添加索引格
      //X轴
    for (int i=0; i<x_names.count; i++) {
        CGFloat X = MARGIN + (CGRectGetWidth(myFrame)-30)/x_names.count*(i+1)-(CGRectGetWidth(myFrame)-30)/x_names.count/2.0;
        CGPoint point = CGPointMake(X,CGRectGetHeight(myFrame)-MARGIN);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x, point.y-3)];
    }
    //Y轴（实际长度为200,此处比例缩小一倍使用）
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        CGPoint point = CGPointMake(MARGIN,Y);
        [path moveToPoint:point];
        [path addLineToPoint:CGPointMake(point.x+3, point.y)];
    }
    
    //4.添加索引格文字
    //X轴
    for (int i=0; i<x_names.count; i++) {
        CGFloat X = MARGIN + (CGRectGetWidth(myFrame)-30)/x_names.count/2.0 + (CGRectGetWidth(myFrame)-30)/x_names.count*i-(CGRectGetWidth(myFrame)-30)/x_names.count/2.0;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(X, CGRectGetHeight(myFrame)-MARGIN, (CGRectGetWidth(myFrame)-60)/x_names.count, 20)];
        textLabel.text = x_names[i];
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor blueColor];
        [self addSubview:textLabel];
    }
    //Y轴
    for (int i=0; i<11; i++) {
        CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-Y_EVERY_MARGIN*i;
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, Y-5, MARGIN, 10)];
        textLabel.text = [NSString stringWithFormat:@"%d",10*i];
        textLabel.font = [UIFont systemFontOfSize:10];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.textColor = [UIColor redColor];
        [self addSubview:textLabel];
    }
    //5.渲染路径
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.borderWidth = 2.0;
    [self.subviews[0].layer addSublayer:shapeLayer];
}

/**
 *  画多根折线图
 */
-(void)drawMoreLineChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues LineType:(LineType) lineType{
    
    //1.画坐标轴
    [self drawXYLine:x_names];
    
    for (int j=0; j<targetValues.count; j++) {
        //2.获取目标值点坐标
        NSMutableArray *allPoints = [NSMutableArray array];
        for (int i=0; i<[targetValues[j] count]; i++) {
            CGFloat doubleValue = 2*[targetValues[j][i] floatValue]; //目标值放大两倍
            CGFloat X = MARGIN + (CGRectGetWidth(myFrame)-30)/x_names.count*(i+1)-(CGRectGetWidth(myFrame)-30)/x_names.count/2.0;
            CGFloat Y = CGRectGetHeight(myFrame)-MARGIN-doubleValue;
            CGPoint point = CGPointMake(X,Y);
            UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(point.x-1, point.y-1, 2.5, 2.5) cornerRadius:2.5];
            CAShapeLayer *layer = [CAShapeLayer layer];
            layer.strokeColor = [UIColor purpleColor].CGColor;
            layer.fillColor = [UIColor purpleColor].CGColor;
            layer.path = path.CGPath;
            [self.subviews[0].layer addSublayer:layer];
            [allPoints addObject:[NSValue valueWithCGPoint:point]];
        }
        
        //3.坐标连线
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:[allPoints[0] CGPointValue]];
        
        CGPoint PrePonit;
        switch (lineType) {
            case LineType_Straight: //直线
                for (int i =1; i<allPoints.count; i++) {
                    CGPoint point = [allPoints[i] CGPointValue];
                    [path addLineToPoint:point];
                }
                break;
            case LineType_Curve:   //曲线
                for (int i =0; i<allPoints.count; i++) {
                    if (i==0) {
                        PrePonit = [allPoints[0] CGPointValue];
                    }else{
                        CGPoint NowPoint = [allPoints[i] CGPointValue];
                        [path addCurveToPoint:NowPoint controlPoint1:CGPointMake((PrePonit.x+NowPoint.x)/2, PrePonit.y) controlPoint2:CGPointMake((PrePonit.x+NowPoint.x)/2, NowPoint.y)]; //三次曲线
                        PrePonit = NowPoint;
                    }
                }
                break;
        }
        
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.path = path.CGPath;
        shapeLayer.strokeColor = self.dorwColor.CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        shapeLayer.borderWidth = 2.0;
        [self.subviews[0].layer addSublayer:shapeLayer];
    }
}

-(void)drawMoreLineChartViewWithTargetValues:(NSMutableArray *)targetValues LineType:(LineType) lineType {
    
    
    CGFloat max = 0;
    CGFloat min = MAXFLOAT;
    CGFloat average = 0;
    for (int i =  0 ; i< targetValues.count; i++) {
        if (max < [targetValues[i] floatValue]) {
            max = [targetValues[i] floatValue];
        }
        
        if (min > [targetValues[i] floatValue]) {
            min = [targetValues[i] floatValue];
        }
    }
    if  (min + max == 0) {
       average = 1;
    }else {
      average = (max + min) / 2;
    }
    //2.获取目标值点坐标
    NSMutableArray *allPoints = [NSMutableArray array];
    for (int i=0; i<[targetValues count]; i++) {
        CGFloat doubleValue = 1*[targetValues[i] floatValue]; //目标值放大两倍
        CGFloat X = MARGIN + (CGRectGetWidth(myFrame)-10)/7*(i+1);
        CGFloat Y = MARGIN + CGRectGetHeight(myFrame)/2;
        if (max - min > 0) {
            Y = MARGIN + (doubleValue) * (CGRectGetHeight(myFrame)/(max));
        }
        CGPoint point = CGPointMake(X,Y);
        UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(point.x-1, point.y-1, 2.5, 2.5) cornerRadius:2.5];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.strokeColor = GreenColor.CGColor;
        layer.fillColor = GreenColor.CGColor;
        layer.path = path.CGPath;
        [self.subviews[0].layer addSublayer:layer];
        [allPoints addObject:[NSValue valueWithCGPoint:point]];
    }
    
    //3.坐标连线
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:[allPoints[0] CGPointValue]];
    
    CGPoint PrePonit;
    switch (lineType) {
        case LineType_Straight: //直线
            for (int i =1; i<allPoints.count; i++) {
                CGPoint point = [allPoints[i] CGPointValue];
                [path addLineToPoint:point];
            }
            break;
        case LineType_Curve:   //曲线
            for (int i =0; i<allPoints.count; i++) {
                if (i==0) {
                    PrePonit = [allPoints[0] CGPointValue];
                }else{
                    CGPoint NowPoint = [allPoints[i] CGPointValue];
                    [path addCurveToPoint:NowPoint controlPoint1:CGPointMake((PrePonit.x+NowPoint.x)/2, PrePonit.y) controlPoint2:CGPointMake((PrePonit.x+NowPoint.x)/2, NowPoint.y)]; //三次曲线
                    PrePonit = NowPoint;
                }
            }
            break;
    }
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = self.dorwColor.CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.borderWidth = 2.0;
    [self.subviews[0].layer addSublayer:shapeLayer];
    
}

@end
