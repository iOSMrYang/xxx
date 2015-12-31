//
//  ViewController.m
//  iOS-Animation
//
//  Created by 杨杰 on 15/12/31.
//  Copyright © 2015年 Skill. All rights reserved.
//

#import "ViewController.h"

#import "arcView.h"
#define ANGLE2RADIUS(x) ((x) * M_PI / 180.0f)
@interface ViewController ()
{
    arcView *progress;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //    progress = [[arcView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //    [self.view addSubview:progress];
    //    progress.backgroundColor = [UIColor whiteColor];
    //    progress.trackColor = [UIColor blackColor];
    //    progress.progressColor = [UIColor orangeColor];
    //    progress.progress = 0.6;
    //    progress.progressWidth = 10;
    //    [progress setCenter:self.view.center];
    //    [self drawLine];
    
    //    arcView *arc = [[arcView alloc]initWithFrame:CGRectMake(60, 100, 300, 200)];
    //    arc.layer.cornerRadius = 4.0f;
    //    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self initScaleLayer];
    
    
    //    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    //    [button setTitle:@"Animate" forState:UIControlStateNormal];
    //    button.frame=CGRectMake(30, self.view.frame.size.height-60, self.view.frame.size.width-60, 40);
    //    [button setBackgroundColor:[UIColor redColor]];
    //    [self.view addSubview:button];
    //    [button addTarget:self action:@selector(animate) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)initScaleLayer
{
    //演员初始化
    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
    scaleLayer.frame = CGRectMake(60, 20, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
    
    
    //    //设定剧本
    //    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    //    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    //    scaleAnimation.toValue = [NSNumber numberWithFloat:1.5];
    //    scaleAnimation.autoreverses = YES;
    //    scaleAnimation.fillMode = kCAFillModeRemoved;
    //    scaleAnimation.repeatCount = MAXFLOAT;
    //    scaleAnimation.duration = 0.8;
    //
    //
    //    //开演
    //    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    animation.fromValue=[NSNumber
                         numberWithFloat:1.0];
    
    animation.toValue=[NSNumber
                       numberWithFloat:0.1];
    
    animation.repeatCount=MAXFLOAT;
    
    animation.duration=1;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    animation.timingFunction=[CAMediaTimingFunction
                              functionWithName:kCAMediaTimingFunctionEaseIn];
    
    animation.autoreverses=YES;
    [scaleLayer addAnimation:animation forKey:@"scaleAnimation"];
}

- (void)animate{
    
    [progress animate];
    
}

- ( void )drawLine{
    
    
    //view 是曲线的背景 view
    
    UIView *view = [[ UIView alloc ] initWithFrame : CGRectMake ( 10 , 10 , self.view.frame.size.width-20 , self.view.frame.size.height-20 )];
    view.layer.cornerRadius = view.frame.size.width/2;
    view. backgroundColor = [ UIColor whiteColor ];
    
    [self.view addSubview :view];
    
    // 第一、 UIBezierPath 绘制线段
    
    CGFloat radius = 4.0f;
    
    //    CGFloat dashPattern[]= {4, 2, 1};
    CGRect rectLines = CGRectMake(0, 0, view.frame.size.width-20, view.frame.size.height-20);
    UIBezierPath *bezier = [UIBezierPath bezierPathWithArcCenter:view.center radius:100 startAngle:0 endAngle:ANGLE2RADIUS(360) clockwise:YES];
    [UIBezierPath bezierPathWithRoundedRect:rectLines cornerRadius:radius];
    //    [bezier setLineCapStyle:kCGLineCapRound];
    //    [bezier setLineWidth:2.0f];
    //    [bezier setLineJoinStyle:kCGLineJoinRound];
    //    [bezier setLineDash:dashPattern count:1 phase:1];
    //    [[UIColor whiteColor]setFill];
    //    [[UIColor redColor]setStroke];
    //    [bezier stroke];
    //    [bezier fill];
    
    
    
    // 第二、 UIBezierPath 和 CAShapeLayer 关联
    
    CAShapeLayer *lineLayer2 = [CAShapeLayer layer];
    
    lineLayer2. frame = CGRectMake ( 10 , 10 , self.view.frame.size.width-20 , self.view.frame.size.height-20 );
    
    lineLayer2. fillColor = [ UIColor orangeColor ]. CGColor ;
    
    lineLayer2. path = bezier. CGPath ;
    
    lineLayer2. strokeColor = [ UIColor redColor ]. CGColor ;
    lineLayer2. lineWidth = 2.0f;
    NSArray * ary = @[@(4),@(2)];
    lineLayer2. lineDashPattern = ary;
    //第三，动画
    
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    
    ani. fromValue = @0 ;
    
    ani. toValue = @1 ;
    
    ani. duration = 3 ;
    
    [lineLayer2 addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
    
    [view. layer addSublayer :lineLayer2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
