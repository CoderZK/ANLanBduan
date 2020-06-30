//
//  ALCMineHeathTVC.m
//  AnLanCustomers
//
//  Created by zk on 2020/6/4.
//  Copyright © 2020 kunzhang. All rights reserved.
//

#import "ALCMineHeathTVC.h"
#import "QYZJUserModel.h"
@interface ALCMineHeathTVC ()
@property(nonatomic,strong)UIView *headV;
@property(nonatomic,strong)QYZJUserModel *dataModel;
@end

@implementation ALCMineHeathTVC


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.frame = CGRectMake(0, -sstatusHeight, ScreenW, ScreenH+sstatusHeight);
    

    
    
    [self getData];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getData];
    }];
//    [self setHV];
    
}


- (void)getData {
    [SVProgressHUD show];
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"customerId"] = self.userId;
    [zkRequestTool networkingPOST:user_appB_findCustomerInfo parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] intValue]== 1) {
            
            self.dataModel = [QYZJUserModel mj_objectWithKeyValues:responseObject[@"data"]];
            [self setHV];
            
        }else {
            [self showAlertWithKey:[NSString stringWithFormat:@"%@",responseObject[@"key"]] message:responseObject[@"message"]];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        
    }];
}



- (void)setHV {
    
    self.headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, ScreenH)];
    self.headV.backgroundColor = [UIColor groupTableViewBackgroundColor];
   
    
    UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, -3, ScreenW, 250)];
    imgV.image = [UIImage imageNamed:@"jkgl157"];
    [self.headV addSubview:imgV];
    
    UIButton * backBt = [[UIButton alloc] initWithFrame:CGRectMake(10, sstatusHeight, 44, 44)];
    [backBt setImage:[UIImage imageNamed:@"youfan"] forState:UIControlStateNormal];
    [self.headV addSubview:backBt];
    [backBt addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel * titleLB = [[UILabel alloc] initWithFrame:CGRectMake(50, sstatusHeight , ScreenW - 100, 44)];
    titleLB.font = kFont(18);
    titleLB.textAlignment = NSTextAlignmentCenter;
    titleLB.textColor = WhiteColor;
    titleLB.text = @"健康信息";
    [self.headV addSubview:titleLB];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(15, sstatusHeight + 44 , ScreenW - 30, 900)];
    view.backgroundColor = WhiteColor;
    [self.headV addSubview:view];
    
    UILabel * lb1 = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenW - 60, 20)];
    lb1.textColor = CharacterColor50;
    lb1.font = [UIFont systemFontOfSize:16 weight:0.2];
    lb1.text = @"基本信息";
    [view addSubview:lb1];
    
    //头像
    UIImageView * headImgV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(lb1.frame), CGRectGetMaxY(lb1.frame) + 15, 45, 45)];
    headImgV.layer.cornerRadius = 22.5;
    headImgV.clipsToBounds = YES;
    [headImgV sd_setImageWithURL:[self.dataModel.baseUser.avatar getPicURL] placeholderImage:[UIImage imageNamed:@"369"] options:SDWebImageRetryFailed];
    [view addSubview:headImgV];
    
    //性别
    UIImageView * sexImgV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImgV.frame) - 15, CGRectGetMaxY(headImgV.frame) - 15, 15, 15)];
    [view addSubview:sexImgV];
    if ([self.dataModel.baseUser.gender isEqualToString:@"1"]) {
        sexImgV.image = [UIImage imageNamed:@"jkgl160"];
    }else {
        sexImgV.image = [UIImage imageNamed:@"jkgl159"];
    }
    
    //姓名
    UILabel * nameLb = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(headImgV.frame)+10, CGRectGetMinY(headImgV.frame) - 5 , 20.0/22.0 * 41, 20)];
    nameLb.textColor = CharacterColor50;
    nameLb.font = [UIFont systemFontOfSize:15 weight:0.2];
    [view addSubview:nameLb];
    nameLb.text = self.dataModel.baseUser.nickname;
    nameLb.width = [self.dataModel.baseUser.nickname getWidhtWithFontSize:16];
    
    //是否是vip
    UIImageView * vipImgV = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(nameLb.frame) + 10, CGRectGetMinY(nameLb.frame), 70, 20)];
    [view addSubview:vipImgV];
    vipImgV.image = [UIImage imageNamed:@"jkgl161"];
    
    //病史

    UILabel * lb11 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lb1.frame), CGRectGetMaxY(headImgV.frame) + 15, 60, 17)];
    lb11.text = @"年龄: ";
    lb11.textColor = CharacterBack150;
    lb11.mj_w = [lb11.text getWidhtWithFontSize:14];
    lb11.font = kFont(14);
    [view addSubview:lb11];
    
    UILabel * lb112 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lb11.frame) + 10, lb11.mj_y, ScreenW - 60 - lb11.mj_w - 10, 17)];
    lb112.textColor = CharacterBlack100;
    lb112.font = kFont(14);
    lb112.text = [NSString stringWithFormat:@"%@岁",self.dataModel.baseUser.age];
    [view addSubview:lb112];
    
    
    UILabel * lb22 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lb1.frame), CGRectGetMaxY(lb11.frame) + 10, 60, 17)];
    lb22.text = @"出生日期: ";
    lb22.textColor = CharacterBack150;
    lb22.mj_w = [lb22.text getWidhtWithFontSize:14];
    lb22.font = kFont(14);
    [view addSubview:lb22];
    
    UILabel * lb222 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lb22.frame) + 10, lb22.mj_y, ScreenW - 60 - lb22.mj_w - 10, 17)];
    lb222.textColor = CharacterBlack100;
    lb222.font = kFont(14);
    lb222.text = self.dataModel.baseUser.birthdate;
    [view addSubview:lb222];
    
    
    UILabel * lb33 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lb1.frame), CGRectGetMaxY(lb22.frame) + 10, 60, 17)];
    lb33.text = @"曾就诊机构: ";
    lb33.textColor = CharacterBack150;
    lb33.mj_w = [lb33.text getWidhtWithFontSize:14];
    lb33.font = kFont(14);
    
    [view addSubview:lb33];
    
    UILabel * lb332 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lb33.frame) + 10, lb33.mj_y, ScreenW - 60 - lb33.mj_w - 10, 17)];
    lb332.textColor = CharacterBlack100;
    lb332.font = kFont(14);
    lb332.text = self.dataModel.baseUser.institutions_visited_name;
    [view addSubview:lb332];
    
    UILabel * lb44 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(lb1.frame), CGRectGetMaxY(lb33.frame) + 10, 60, 17)];
    lb44.text = @"曾就诊项目: ";
    lb44.textColor = CharacterBack150;
    lb44.mj_w = [lb44.text getWidhtWithFontSize:14];
    lb44.font = kFont(14);
    [view addSubview:lb44];
    
    UILabel * lb442 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lb44.frame) + 10, lb44.mj_y, ScreenW - 60 - lb44.mj_w - 10, 17)];
    lb442.textColor = CharacterBlack100;
    lb442.font = kFont(14);
    lb442.text = self.dataModel.baseUser.project_visited_name;
    [view addSubview:lb442];
    
    UIView * BMIView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lb442.frame) + 20 , ScreenW - 30, 200)];
    [view addSubview:BMIView];
    UILabel * bmL = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ScreenW - 60, 20)];
    bmL.textColor = CharacterColor50;
    bmL.text = @"BMI";
    bmL.font = [UIFont systemFontOfSize:16 weight:0.2];
    [BMIView addSubview:bmL];
    
    UIView * ggV = [[UIView alloc] initWithFrame:CGRectMake(15, 45 , ScreenW - 60, 6)];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)RGB(98, 235, 213).CGColor, (__bridge id)RGB(0, 217, 177).CGColor];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = ggV.bounds;
    [ggV.layer addSublayer:gradientLayer];
    ggV.layer.cornerRadius = 3;
    ggV.clipsToBounds = YES;
    
    [BMIView addSubview:ggV];
    NSArray * bmArr = @[@"偏瘦",@"正常",@"超重",@"肥胖"];
    for (int i = 0 ; i< bmArr.count; i++) {
        
        UILabel * lb = [[UILabel alloc] initWithFrame:CGRectMake( 15 + i * (ScreenW - 60 - 3) / 4 + i*1, CGRectGetMaxY(ggV.frame), (ScreenW - 60 - 3) / 4, 17)];
        lb.font = kFont(13);
        lb.textColor = CharacterBlack100;
        lb.textAlignment = NSTextAlignmentCenter;
        lb.text = bmArr[i];
        [BMIView addSubview:lb];
        
        if (i > 0) {
            UIView * wV = [[UIView alloc] initWithFrame:CGRectMake(i * (ScreenW - 60 - 3) / 4 + (i -1)*1, 0, 1, ggV.mj_h)];
            wV.backgroundColor = WhiteColor;
            [ggV addSubview:wV];
        }
        
        
    }
    
    /**
     
     
     正常BMI是在18.5-24.9之间。
     偏瘦：＜18.5
     偏胖：25.0-29.9  肥胖：30.0-34.9   重度肥胖：35.5-39.9  极重度肥胖＞40
     
     
     */

    CGFloat ww = (ScreenW - 60 - 3) / 4;

    CGFloat bmi = self.dataModel.mapBmi.bmi.floatValue;
    
    ALCMineHeathNumberView * numberViewOne = [[ALCMineHeathNumberView alloc] initWithFrame:CGRectMake(100, 20, [[NSString stringWithFormat:@"%0.1f",bmi] getWidhtWithFontSize:13] + 10, 23)];
    
    [BMIView addSubview:numberViewOne];
    
   
    
    numberViewOne.titleLB.text = [NSString stringWithFormat:@"%0.1f",bmi];
    
    if (bmi < 18.5) {
        
        numberViewOne.centerX = bmi / 18.5 * ww + 15;
        
    }else if (bmi < 24.9) {
        numberViewOne.centerX = ww +  1 + (bmi - 18.5) / (24.9 - 18.5) * ww + 15 ;
        
    }else if (self.dataModel.mapBmi.bmi.floatValue <34.9) {
        
        numberViewOne.centerX = 2 * (ww +  1) + (bmi - 24.9) / (34.9-24.9) * ww + 15;
    }else {
        if (bmi >= 40) {
            numberViewOne.centerX = ScreenW - 60 + 15;
        }else {
            numberViewOne.centerX = 3 * (ww +  1) + (bmi - 34.9) / (40 - 34.9) * ww + 15;
        }
    }
    
    

    UILabel * TZL = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(ggV.frame) + 40, ScreenW - 60, 20)];
    TZL.textColor = CharacterColor50;
    TZL.text = @"体重";
    TZL.font = [UIFont systemFontOfSize:16 weight:0.2];
    [BMIView addSubview:TZL];

    UIView * ggVTwo = [[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(TZL.frame) + 25 , ScreenW - 60, 6)];
    [BMIView addSubview:ggVTwo];
    ggVTwo.backgroundColor = [UIColor groupTableViewBackgroundColor];
    ggVTwo.layer.cornerRadius = 3;
    ggVTwo.clipsToBounds = YES;

    

    ALCMineHeathNumberView * numberViewTwo = [[ALCMineHeathNumberView alloc] initWithFrame:CGRectMake(150, ggVTwo.mj_y - 25, [[NSString stringWithFormat:@"%0.1fkg",self.dataModel.baseUser.weight.floatValue] getWidhtWithFontSize:13] + 10, 23)];
    numberViewTwo.titleLB.text = [NSString stringWithFormat:@"%0.1fkg",self.dataModel.baseUser.weight.floatValue];
    CGFloat weight = self.dataModel.baseUser.weight.floatValue;
    CGFloat minWeight = self.dataModel.baseUser.minWeight.floatValue;
    CGFloat maxWeight = self.dataModel.baseUser.maxWeight.floatValue;
    if (weight < minWeight ) {
        
        numberViewTwo.centerX = 15 + weight / minWeight * ww;
        
    }else if (weight < maxWeight) {
        numberViewTwo.centerX = 15 + ww + 1 +  (weight - minWeight) /(maxWeight - minWeight) * ww;
    }else  {
        if (weight >= maxWeight + 60) {
            numberViewTwo.centerX = ScreenW - 60 + 15;
        }else {
             numberViewTwo.centerX = 15 + 2* (ww + 1) +  (weight - maxWeight) /(60) * (2 * ww + 1);
        }
    }
    
    
    [BMIView addSubview:numberViewTwo];
    
    BMIView.mj_h = CGRectGetMaxY(numberViewTwo.frame) + 40;
    
    

    UIView * gwView   = [[UIView alloc] initWithFrame:CGRectMake(ww, 0, ww, 6)];
    gwView.backgroundColor = GreenColor;
    [ggVTwo addSubview:gwView];
    gwView.layer.cornerRadius = 3;
    gwView.clipsToBounds = YES;
    
    

    
    UILabel * wLbOne = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(ggVTwo.frame), 100, 16)];
    wLbOne.textColor = CharacterBlack100;
    wLbOne.textAlignment = NSTextAlignmentCenter;
    wLbOne.font = kFont(13);
    wLbOne.text = [NSString stringWithFormat:@"%0.1fkg",self.dataModel.baseUser.minWeight.floatValue];
//    wLbOne.backgroundColor = [UIColor redColor];
    wLbOne.centerX = 1 + ww + 15 ;
    [BMIView addSubview:wLbOne];
    
    UILabel * wLbTwo = [[UILabel alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(ggVTwo.frame), 100, 16)];
    wLbTwo.textColor = CharacterBlack100;
    wLbTwo.textAlignment = NSTextAlignmentCenter;
    wLbTwo.font = kFont(13);
    wLbTwo.text = [NSString stringWithFormat:@"%0.1fkg",self.dataModel.baseUser.maxWeight.floatValue];
    wLbTwo.centerX = 2+ 2 * ww + 15 ;
    [BMIView addSubview:wLbTwo];
    
    UIImageView * xuXainImgV = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(BMIView.frame) , ScreenW - 30, (ScreenW - 30)* 57/1035 )];
    xuXainImgV.image = [UIImage imageNamed:@"xuxian"];
    [view addSubview:xuXainImgV];
    
    CGFloat x1 = 0;
    CGFloat x2 = ScreenW - 30;
    CGFloat y = CGRectGetMaxY(BMIView.frame) + 20 + ((ScreenW - 30)* 57/1035 ) / 2;
    CGFloat radian = ((ScreenW - 30)* 57/1035 ) / 2;
    
    
   CAShapeLayer *layer1 = [CAShapeLayer new];
    layer1.lineWidth = 1;
    //圆环的颜色
    layer1.strokeColor = [UIColor groupTableViewBackgroundColor].CGColor;
    //背景填充色
    layer1.fillColor = [UIColor groupTableViewBackgroundColor].CGColor;
    //设置半径为10
    CGFloat radius = radian;
    //按照顺时针方向
    BOOL clockWise = true;
    //初始化一个路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x1, xuXainImgV.centerY) radius:radius startAngle:(1.5 *M_PI) endAngle:0.5*M_PI clockwise:clockWise];
    layer1.path = [path CGPath];
    [view.layer addSublayer:layer1];
    
    CAShapeLayer *layer2 = [CAShapeLayer new];
    layer2.lineWidth = 1;
    //圆环的颜色
    layer2.strokeColor = [UIColor groupTableViewBackgroundColor].CGColor;
    //背景填充色
    layer2.fillColor = [UIColor groupTableViewBackgroundColor].CGColor;
    //设置半径为10
    //按照顺时针方向
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x2, xuXainImgV.centerY) radius:radius startAngle:(0.5 *M_PI) endAngle:1.5*M_PI clockwise:clockWise];
    layer2.path = [path2 CGPath];
    [view.layer addSublayer:layer2];
    
    
    
    
//    UIView * viewTwo = [[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(view.frame), ScreenW -30, 200)];
//    viewTwo.backgroundColor = [UIColor whiteColor];
//    [self.headV addSubview:viewTwo];
//    UIImageView * imgVTwo = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
//    [viewTwo addSubview:imgVTwo];
    
    
    UILabel * CPL = [[UILabel alloc] initWithFrame:CGRectMake(35, CGRectGetMaxY(xuXainImgV.frame) + 20, ScreenW - 60, 20)];
    CPL.textColor = CharacterColor50;
    CPL.text = @"测评结果";
    CPL.font = [UIFont systemFontOfSize:16 weight:0.2];
    [view addSubview:CPL];

    UIView * viewThree = [[UIView alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(CPL.frame) + 15, ScreenW - 60, 50)];
    viewThree.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [view addSubview:viewThree];
    
    UILabel * cpLb = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, ScreenW - 90, 20)];
    cpLb.numberOfLines = 0;
    [viewThree addSubview:cpLb];
    
 
    
     NSString *htmlStr = [NSString stringWithFormat:@"<div style=\"font-size:14px\">%@</div>",self.dataModel.moreBody];
        
        //富文本，两种都可以
        NSDictionary *options = @{ NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding) };
        NSData *data = [htmlStr dataUsingEncoding:NSUTF8StringEncoding];
        //或者
    //    NSDictionary *option = @{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType};
    //    NSData *data = [htmlStr dataUsingEncoding:NSUnicodeStringEncoding];
        
        //设置富文本
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithData:data options:options documentAttributes:nil error:nil];
        //设置段落格式
        NSMutableParagraphStyle *para = [[NSMutableParagraphStyle alloc] init];
        para.lineSpacing = 4;
        para.paragraphSpacing = 10;
        [attStr addAttribute:NSParagraphStyleAttributeName value:para range:NSMakeRange(0, attStr.length)];
        cpLb.attributedText = attStr;
        
        //设置文本的Font没有效果，默认12字号，这个只能服务器端控制吗？ 暂时没有找到方法修改字号
        [attStr addAttribute:NSFontAttributeName value:para range:NSMakeRange(0, attStr.length)];
        //计算加载完成之后Label的frame
        CGSize size = [cpLb sizeThatFits:CGSizeMake(ScreenW - 90, MAXFLOAT)];
        //也可以使用这个方法，对应好富文本字典
    //    CGSize size = [self.testLabel.attributedText boundingRectWithSize:CGSizeMake(300, 1000) options:@{} context:nil];
    cpLb.frame = CGRectMake(15, 15, size.width, size.height);
    viewThree.mj_h = size.height + 30;
    
    
    view.mj_h = CGRectGetMaxY(viewThree.frame) + 20;
    self.headV.mj_h = CGRectGetMaxY(view.frame);
    
    view.layer.cornerRadius = 5;
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(0, 0);
    view.layer.shadowRadius = 5;
    view.layer.shadowOpacity = 0.08;
    
    
    
    
    self.tableView.tableHeaderView = self.headV;
}

- (void)back {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
}


@end


@implementation  ALCMineHeathNumberView

- (instancetype)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    if (self) {
        
        self.titleLB = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height - 5)];
        self.titleLB.font = kFont(13);
        self.titleLB.textColor = WhiteColor;
        self.titleLB.textAlignment = NSTextAlignmentCenter;
        self.titleLB.layer.cornerRadius = (frame.size.height - 5)/2.0;
        self.titleLB.backgroundColor = RGB(0, 217, 177);
        self.titleLB.clipsToBounds = YES;
        [self addSubview:self.titleLB];
        
        self.jianTouImgV = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width/2-3, CGRectGetMaxY(self.titleLB.frame) - 1, 6, 6)];
        self.jianTouImgV.image = [UIImage imageNamed:@"gjian"];
        [self addSubview:self.jianTouImgV];
        
        
        
        
    }
    return self;
}

@end

