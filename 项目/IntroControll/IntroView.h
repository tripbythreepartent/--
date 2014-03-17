#import <UIKit/UIKit.h>
#import "IntroModel.h"
#import "ExampleViewController.h"

@interface IntroView : UIView

@property (nonatomic,strong)ExampleViewController * exam;
- (id)initWithFrame:(CGRect)frame model:(IntroModel*)model;
@end
