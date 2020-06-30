//
//  ALCLuYinDongTaiView.m
//  AnLanBB
//
//  Created by zk on 2020/4/1.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCLuYinDongTaiView.h"

@interface ALCLuYinDongTaiView()
@property(nonatomic,strong)UIView *whiteV;
@property (nonatomic, strong) NSMutableArray * levelArray;
@property (nonatomic) NSMutableArray * itemArray;
@property (nonatomic) CGFloat itemHeight;
@property (nonatomic) CGFloat itemWidth;
@property(nonatomic,strong)NSMutableArray *itemLayerArr;
@end

@implementation ALCLuYinDongTaiView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        //最低是10 单个为5
        //最高为 50 单个为25;
        
        //25为中间值
        CGFloat space = 2;
        CGFloat ww = 3;
        CGFloat avger = 35;
        self.itemLayerArr = @[].mutableCopy;
        
        
        
        self.whiteV = [[UIView alloc] initWithFrame:CGRectMake((ScreenW - 248)/2.0, 0, 248, 70)];
        [self addSubview:self.whiteV];
        
        for (int i = 0 ; i < 50; i++) {

            CAGradientLayer *gradient = [CAGradientLayer layer];
            gradient.frame = CGRectMake((space + ww) *i , 30 , ww, 10);
            gradient.colors = @[(id)RGB(104, 212, 125).CGColor,(id)RGB(193, 223, 103).CGColor];
            gradient.startPoint = CGPointMake(0.5, 1);
            gradient.endPoint = CGPointMake(0.5, 0);
            [self.layer addSublayer:gradient];
            [self.itemLayerArr addObject:gradient]; 

        }
        
        
    }
    return self;
}

- (void)setup
{
    
    NSLog(@"setup");
    
    self.itemArray = [NSMutableArray new];
    
    self.numberOfItems = 50;//偶数
   
    self.itemColor = GreenColor;

    self.itemHeight = CGRectGetHeight(self.bounds);
    self.itemWidth  = CGRectGetWidth(self.bounds);
    

    
    self.levelArray = [[NSMutableArray alloc]init];
    for(int i = 0 ; i < self.numberOfItems/2 ; i++){
        [self.levelArray addObject:@(1)];
    }
}


- (void)setIsOk:(BOOL)isOk {
    _isOk = isOk;
    CGFloat space = 2;
    CGFloat ww = 3;
    for (int i = 0 ; i < 50 ; i++) {
           CGFloat hh  = 10;
           CAGradientLayer * gradient = self.itemLayerArr[i];
           gradient.frame = CGRectMake((space + ww) *i , (70-hh)/2 , ww, hh);
       }
    
    
}




- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    CGFloat scale = 0;
    
    CGFloat space = 2;
    CGFloat ww = 3;
    for (int i = 0 ; i < dataArray.count; i++) {
        scale = (CGFloat )[dataArray[i] floatValue];
        if (scale < 0) {
            scale = 0;
        }
        CGFloat hh  = 10 +scale;
        CAGradientLayer * gradient = self.itemLayerArr[i];
        gradient.frame = CGRectMake((space + ww) *i , (70-hh)/2 , ww, hh);
    }
    
    
}



-(void)setItemLevelCallback:(void (^)())itemLevelCallback
{
    NSLog(@"setItemLevelCallback");
    
    _itemLevelCallback = itemLevelCallback;
    
    CADisplayLink *displaylink = [CADisplayLink displayLinkWithTarget:_itemLevelCallback selector:@selector(invoke)];
    displaylink.frameInterval = 6;
    [displaylink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
    for(int i=0; i < self.numberOfItems; i++)
    {
        CAShapeLayer *itemline = [CAShapeLayer layer];
        itemline.lineCap       = kCALineCapButt;
//        [itemline setFrame:self.frame];
        itemline.lineJoin      = kCALineJoinRound;
//        itemline.strokeColor   = [[UIColor clearColor] CGColor];
        itemline.fillColor     = [[UIColor clearColor] CGColor];
        [itemline setLineWidth:self.itemWidth*0.6/self.numberOfItems];
        itemline.strokeColor   = [self.itemColor CGColor];
        
//        CAGradientLayer *gradient = [CAGradientLayer layer];
//        gradient.colors = @[(id)[UIColor blackColor].CGColor,(id)[UIColor yellowColor].CGColor];
//        gradient.startPoint = CGPointMake(0.5, 1);
//        gradient.endPoint = CGPointMake(0.5, 0);
//        //    gradient.locations = @[@(0.5f), @(1.0f)];
//        gradient.mask = itemline;
        [self.layer addSublayer:itemline];
        [self.itemArray addObject:itemline];
    }
    
}


- (void)setLevel:(CGFloat)level
{
    level = (level+37.5)*3.2;
    if( level < 0 ) level = 0;
    if (level > 114) level = 0;
//    NSLog(@"setLevel:%f",level);

    [self.levelArray removeObjectAtIndex:self.numberOfItems-1];
    [self.levelArray insertObject:@((level / 6) < 1 ? 1 : level / 6) atIndex:0];
    
    [self updateItems];
    
}




- (void)updateItems
{
    //NSLog(@"updateMeters");
    
    UIGraphicsBeginImageContext(self.frame.size);
    
    int x = self.itemWidth*0.4/self.numberOfItems;
    int z = self.itemWidth*0.3/self.numberOfItems;
    int y = self.itemWidth*0.65 - z;
    
    for(int i=0; i < (self.numberOfItems ); i++) {
        
        UIBezierPath *itemLinePath = [UIBezierPath bezierPath];
        
        y += x;
        
        [itemLinePath moveToPoint:CGPointMake(y, self.itemHeight+([[self.levelArray objectAtIndex:i]intValue]+1)*z/2)];
        
        [itemLinePath addLineToPoint:CGPointMake(y, self.itemHeight-([[self.levelArray objectAtIndex:i]intValue]+1)*z/2)];
        
        CAShapeLayer *itemLine = [self.itemArray objectAtIndex:i];
        itemLine.path = [itemLinePath CGPath];
        
    }
    UIGraphicsEndImageContext();
    
//    y = self.itemWidth*0.35 + z;
//
//    for(int i = (int)self.numberOfItems / 2; i < self.numberOfItems; i++) {
//
//        UIBezierPath *itemLinePath = [UIBezierPath bezierPath];
//
//        y -= x;
//
//        [itemLinePath moveToPoint:CGPointMake(y, self.itemHeight/2+([[self.levelArray objectAtIndex:i-self.numberOfItems/2]intValue]+1)*z/2)];
//
//        [itemLinePath addLineToPoint:CGPointMake(y, self.itemHeight/2-([[self.levelArray objectAtIndex:i-self.numberOfItems/2]intValue]+1)*z/2)];
//
//        CAShapeLayer *itemLine = [self.itemArray objectAtIndex:i];
//        itemLine.path = [itemLinePath CGPath];
//
//    }
//
//    UIGraphicsEndImageContext();
}







- (CAShapeLayer *)getShapeLayerTopWithView:(UIView *)view{
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(1.5, 1.5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    
    return maskLayer;
}

- (CAShapeLayer *)getShapeLayerBottomWithView:(UIView *)view{
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(1.5, 1.5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    
    return maskLayer;
}


/**
 
 UIView *colorView = [[UIView alloc] init];
 colorView.frame = CGRectMake(0, 0, 200, 200);
 colorView.center = CGPointMake(375/2.0, 667/2.0-100);
 [self.view addSubview:colorView];
 
 
 
 
 */


@end
