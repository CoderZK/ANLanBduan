//
//  BezierCurveView.h
//  AnLanCustomers
//
//  Created by zk on 2020/3/28.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


#define MARGIN            0   // 坐标轴与画布间距
#define Y_EVERY_MARGIN    20   // y轴每一个值的间隔数

#import <UIKit/UIKit.h>
// 线条类型
typedef NS_ENUM(NSInteger, LineType) {
    LineType_Straight, // 折线
    LineType_Curve     // 曲线
};
@interface BezierCurveView : UIView

//初始化画布
+(instancetype)initWithFrame:(CGRect)frame;
@property(nonatomic,strong)UIColor *dorwColor;
//画多根折线图
-(void)drawMoreLineChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues LineType:(LineType) lineType;

-(void)drawMoreLineChartViewWithTargetValues:(NSMutableArray *)targetValues LineType:(LineType) lineType;

@end
