#import "IntroView.h"



@implementation IntroView

- (id)initWithFrame:(CGRect)frame model:(IntroModel*)model
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _exam = [[ExampleViewController alloc] init];
        UILabel *titleLabel = [[UILabel alloc] init];
        [titleLabel setText:model.titleText];
        [titleLabel setTextColor:[UIColor whiteColor]];
        [titleLabel setFont:[UIFont boldSystemFontOfSize:18]];
        [titleLabel setShadowColor:[UIColor blackColor]];
        [titleLabel setShadowOffset:CGSizeMake(1, 1)];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel sizeToFit];
        [titleLabel setCenter:CGPointMake(frame.size.width/2, frame.size.height-145)];
        [self addSubview:titleLabel];
        
        UILabel *descriptionLabel = [[UILabel alloc] init];
        [descriptionLabel setText:model.descriptionText];
        [descriptionLabel setFont:[UIFont systemFontOfSize:16]];
        [descriptionLabel setTextColor:[UIColor whiteColor]];
        [descriptionLabel setShadowColor:[UIColor blackColor]];
        [descriptionLabel setShadowOffset:CGSizeMake(1, 1)];
        [descriptionLabel setNumberOfLines:3];
        [descriptionLabel setBackgroundColor:[UIColor clearColor]];
        [descriptionLabel setTextAlignment:NSTextAlignmentCenter];
        descriptionLabel.userInteractionEnabled = YES;
        
      
        CGSize s = [descriptionLabel.text sizeWithFont:descriptionLabel.font constrainedToSize:CGSizeMake(frame.size.width-40, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
        
        //three lines height
        CGSize three = [@"1 \n 2 \n 3" sizeWithFont:descriptionLabel.font constrainedToSize:CGSizeMake(frame.size.width-40, CGFLOAT_MAX) lineBreakMode:NSLineBreakByWordWrapping];
        
        descriptionLabel.frame = CGRectMake((self.frame.size.width-s.width)/2, titleLabel.frame.origin.y+titleLabel.frame.size.height+4,s.width, MIN(s.height, three.height));
        
        NSLog(@"%f", s.height);

        [self addSubview:descriptionLabel];
        
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0 , 0, 50, 30)];
        [button setTitle:@"进入" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blackColor]];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(enterAction:) forControlEvents:UIControlEventTouchUpInside];
        [descriptionLabel addSubview:button];
    
    }
    return self;
}

- (void)enterAction:(id)sender{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CREATEANIMATION" object:nil];
}


@end
