//
//  ViewController.m
//  LofterLogoDemo
//
//  Created by Cantoraz Chou on 7/19/16.
//
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIView* logoView;

@property (nonatomic, strong) CAShapeLayer* logoShapelayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Configure _logoView
    _logoView.tintColor = [UIColor whiteColor];
    _logoView.backgroundColor = [UIColor colorWithRed:.192
                                                green:.380
                                                 blue:.380
                                                alpha:1];
    _logoView.layer.cornerRadius = 150;
    
    // Setup _logoShapeLayer
    _logoShapelayer = [[CAShapeLayer alloc] init];
    _logoShapelayer.path = [self __caz__lofterLogoPath].CGPath;
    _logoShapelayer.lineWidth = 4;
    _logoShapelayer.lineCap = kCALineCapRound;
    _logoShapelayer.lineJoin = kCALineJoinRound;
    _logoShapelayer.strokeColor = [UIColor whiteColor].CGColor;
    _logoShapelayer.fillColor = [UIColor clearColor].CGColor;
    
    [_logoView.layer addSublayer:_logoShapelayer];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self __caz__beginAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -

- (UIBezierPath*)__caz__lofterLogoPath
{
    CGFloat w = _logoView.bounds.size.width;
    CGFloat h = _logoView.bounds.size.height;
    
    UIBezierPath* path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(.44 * w, .62 * h)];
    [path addLineToPoint:CGPointMake(.44 * w, .26 * h)];
    [path addQuadCurveToPoint:CGPointMake(.34 * w, .16 * h) controlPoint:CGPointMake(.44 * w, .16 * h)];
    [path addLineToPoint:CGPointMake(.34 * w, .60 * h)];
    [path addQuadCurveToPoint:CGPointMake(.44 * w, .70 * h) controlPoint:CGPointMake(.34 * w, .70 * h)];
    [path addLineToPoint:CGPointMake(.62 * w, .70 * h)];
    [path addQuadCurveToPoint:CGPointMake(.72 * w, .80 * h) controlPoint:CGPointMake(.72 * w, .70 * h)];
    [path addLineToPoint:CGPointMake(.54 * w, .80 * h)];
    [path addQuadCurveToPoint:CGPointMake(.45 * w, .75 * h) controlPoint:CGPointMake(.482 * w, .8 * h)];
    
    return path;
}

- (void)__caz__beginAnimation
{
    CABasicAnimation* strokeEndAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnim.fromValue = @(-0.2);
    strokeEndAnim.toValue = @1;
    
    strokeEndAnim.duration = 1;
    strokeEndAnim.repeatCount = HUGE;
    
    [_logoShapelayer addAnimation:strokeEndAnim forKey:nil];
}

@end
