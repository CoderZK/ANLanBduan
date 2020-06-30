//
//  TabBarController.m
//  Elem1
//
//  Created by sny on 15/9/17.
//  Copyright (c) 2015年 cznuowang. All rights reserved.
//

#import "TabBarController.h"
#import "BaseViewController.h"
#import "HomeVC.h"
#import "ALCNewHomeOneVC.h"
#import "MineVC.h"
#import "HangQingVC.h"
#import "ALCJianKangTiXingTVC.h"

@interface TabBarController ()
{
    BaseNavigationController * _mineNavi;
}
@end

@implementation TabBarController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
   
    if(@available(iOS 13.0, *))  {
                 UITabBarAppearance * apperacne =  [self.tabBar standardAppearance];
                 apperacne.backgroundImage =[UIImage imageNamed:@"bg_1"];
                 apperacne.shadowImage = [UIImage imageNamed:@"touming"];
                 
                NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
                attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
                attrs[NSForegroundColorAttributeName] = TabberGray;
                NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
                selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
                selectedAttrs[NSForegroundColorAttributeName] = TabberGreen;
                 
                 apperacne.stackedLayoutAppearance.normal.titleTextAttributes = attrs;
                 apperacne.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttrs;
                 self.tabBar.standardAppearance = apperacne;
                 self.tabBar.tintColor = GreenColor;
                
            }else {
                 [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_1"]];
    //             self.tabBarController.tabBar.subviews[0].subviews[1].hidden = YES;
                 [self.tabBar setShadowImage:[[UIImage alloc] init]];
            }
       
    NSLog(@"===========\n%@",self.tabBar.subviews[0]);

    
}

- (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size radius:(CGFloat)radius {
    if (!color) {
        color = [UIColor whiteColor];
    }
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    CGContextAddPath(context, path.CGPath);
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
      

    
    
    
    
//
//
    
//    CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width);
//
//    UIGraphicsBeginImageContext(rect.size);
//
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
//
//    CGContextFillRect(context, rect);
//
//    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
//
//    UIGraphicsEndImageContext();
//
//    [self.tabBar setBackgroundImage:img];

//    [self.tabBar setShadowImage:img];



   
    
    
    NSArray *imgArr=@[@"jkgl115",@"jkgl117",@"jkgl17"];
    NSArray *selectedImgArr=@[@"jkgl114",@"jkgl116",@"jkgl16"];
    NSArray *barTitleArr=@[@"录音",@"提醒",@"我的"];
    NSArray *className=@[@"ALCNewHomeOneVC",@"ALCJianKangTiXingTVC",@"MineVC"];
    NSMutableArray *arr=[[NSMutableArray alloc] init];
    for (int i=0; i<className.count; i++)
    {
        NSString *str=[className objectAtIndex:i];
        BaseViewController *vc = nil;
        
        //此处创建控制器要根据自己的情况确定是否带tableView 
        
//        if (i== 0)
//        {
//           vc=[[NSClassFromString(str) alloc] initWithTableViewStyle:UITableViewStylePlain];
//        }
//        else
//        {
            vc=[[NSClassFromString(str) alloc] initWithTableViewStyle:UITableViewStyleGrouped];
//        }
        

        NSString *str1=[imgArr objectAtIndex:i];
        
        NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
        attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
        attrs[NSForegroundColorAttributeName] = TabberGray;
        NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
        selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
        selectedAttrs[NSForegroundColorAttributeName] = TabberGreen;
        UITabBarItem *item = [UITabBarItem appearance];
        [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
        [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
        
        //让图片保持原来的模样，未选中的图片
        vc.tabBarItem.image=[[UIImage imageNamed:str1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //图片选中时的图片
        NSString *str2=[selectedImgArr objectAtIndex:i];
        vc.tabBarItem.selectedImage=[[UIImage imageNamed:str2] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
        //页面的bar上面的title值
        NSString *str3=[barTitleArr objectAtIndex:i];
        vc.tabBarItem.title=str3;
        self.tabBar.tintColor=[UIColor blackColor];
        
        //给每个页面添加导航栏
        BaseNavigationController *nav=[[BaseNavigationController alloc] initWithRootViewController:vc];
        [arr addObject:nav];
    }
 
 
    self.viewControllers=arr;
    _mineNavi = arr.lastObject;
    self.tabBar.barTintColor = [UIColor whiteColor];
}

@end
