//
//  arcView.m
//  arcGroup
//
//  Created by 杨杰 on 15/12/22.
//  Copyright © 2015年 Skill. All rights reserved.
//

#import "arcView.h"

@implementation arcView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _trackLayer = [CAShapeLayer new];
        [self.layer addSublayer:_trackLayer];
        _trackLayer.fillColor = nil;
        _trackLayer.frame = self.bounds;
        
        _progressLayer = [CAShapeLayer new];
        CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
        
        ani. fromValue = @0 ;
        
        ani. toValue = @1 ;
        
        ani. duration = 2 ;
        
        [_progressLayer addAnimation :ani forKey : NSStringFromSelector ( @selector (strokeEnd))];
        [self.layer addSublayer:_progressLayer];
        _progressLayer.fillColor = nil;
        _progressLayer.lineCap = kCALineCapRound;
        _progressLayer.frame = self.bounds;
    
        self.progressWidth = 5;
    }
    return self;
}

- (void)setTrack
{
    _trackPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.center.x-self.frame.origin.x, self.center.y-self.frame.origin.y) radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:- M_PI_2 endAngle:M_PI * 2- M_PI_2 clockwise:YES];;
    _trackLayer.path = _trackPath.CGPath;
}

- (void)setProgress
{
    _progressPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.center.x-self.frame.origin.x, self.center.y-self.frame.origin.y) radius:(self.bounds.size.width - _progressWidth)/ 2 startAngle:- M_PI_2 endAngle:(M_PI * 2) * _progress - M_PI_2 clockwise:YES];
    _progressLayer.path = _progressPath.CGPath;
}


- (void)setProgressWidth:(float)progressWidth
{
    _progressWidth = progressWidth;
    _trackLayer.lineWidth = _progressWidth;
    _progressLayer.lineWidth = _progressWidth;
    
    [self setTrack];
    [self setProgress];
}

- (void)setTrackColor:(UIColor *)trackColor
{
    _trackLayer.strokeColor = trackColor.CGColor;
}

- (void)setProgressColor:(UIColor *)progressColor
{
    _progressLayer.strokeColor = progressColor.CGColor;
}

- (void)setProgress:(float)progress
{
    _progress = progress;
    
    [self setProgress];
}


-(void)animate
{
    CABasicAnimation *ani = [ CABasicAnimation animationWithKeyPath : NSStringFromSelector ( @selector (strokeEnd))];
    
    ani. fromValue = @0 ;
    
    ani. toValue = @1 ;
    
    ani. duration = 2 ;

    [_progressLayer addAnimation:ani forKey:NSStringFromSelector(@selector (strokeEnd))];

}
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    // 右下
//    CGFloat aRadius = self.frame.size.width/2;
//    CGFloat aCenter = self.frame.size.width/2;
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
//    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    
//    CGContextAddArc(context, aCenter, aCenter, aRadius, ANGLE2RADIUS((CLIPANGLE)), ANGLE2RADIUS( CLIPANGLE+60), 1);
//
//    CGContextAddArcToPoint(context,
//                          ((tan(ANGLE2RADIUS(CLIPANGLE)))*(aRadius/2)) + aRadius,
//                           (aRadius*3)/2,
//                            (aRadius * cos(ANGLE2RADIUS(CLIPANGLE))) + aRadius,
//                           (aRadius * sin(ANGLE2RADIUS(CLIPANGLE))) + aRadius,
//                           aRadius);
//    
//CGContextClosePath(context);
//    CGContextStrokePath(context);
//    CGContextFillPath(context);
    
    //右上
//    CGFloat aRadius = self.frame.size.width/2;
//    CGFloat aCenter = self.frame.size.width/2;
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    //    CGContextSetRGBFillColor(context, 0, 0, 1, 1);
//    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
//    
//    CGContextAddArc(context, aCenter, aCenter, aRadius, ANGLE2RADIUS((CLIPANGLE * 11)), ANGLE2RADIUS( CLIPANGLE*9), 0);
//    
//    CGContextAddArcToPoint(context,
//                           ((tan(ANGLE2RADIUS(CLIPANGLE)))*(aRadius/2)) + aRadius,
//                           aRadius/2,
//                           (aRadius * cos(ANGLE2RADIUS(CLIPANGLE))) + aRadius,
//                           aRadius/2,
//                           aRadius);
//    
//    
//    CGContextClosePath(context);
//    //    CGContextStrokePath(context);
//    CGContextFillPath(context);
    
    /****************** UIBezierPath *******************/
//    UIColor * color = [UIColor redColor];
//    [color set];
//    bezier = [UIBezierPath bezierPath];
//    bezier.lineWidth = 3.0f;
//    bezier.lineJoinStyle = kCGLineJoinRound;
//    
//    [bezier addArcWithCenter:CGPointMake(100, 100) radius:50 startAngle:0 endAngle:180 clockwise:1];
//    [bezier moveToPoint:CGPointMake(0, 0)];
//    [bezier addLineToPoint:CGPointMake(100, 100)];
//    [bezier addCurveToPoint:CGPointMake(200, 100) controlPoint1:CGPointMake(115, 175) controlPoint2:CGPointMake(185, 25)];
//    [[UIColor orangeColor]setStroke];
//    [[UIColor whiteColor]setFill];
//     [bezier stroke];
//    [bezier fill];

}


@end
