//
//  arcView.h
//  arcGroup
//
//  Created by 杨杰 on 15/12/22.
//  Copyright © 2015年 Skill. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ANGLE2RADIUS(x) ((x) * M_PI / 180.0f)
#define CLIPANGLE 30.0f
@interface arcView : UIView
{
    CAShapeLayer *_trackLayer;
    UIBezierPath *_trackPath;
    CAShapeLayer *_progressLayer;
    UIBezierPath *_progressPath;
}

@property (nonatomic, strong) UIColor *trackColor;
@property (nonatomic, strong) UIColor *progressColor;
@property (nonatomic) float progress;
@property (nonatomic) float progressWidth;

-(void)animate;
@end
