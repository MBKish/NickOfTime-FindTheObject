//
//  ViewController.m
//  NickOfTime-FindTheObject
//
//  Created by Matthew Kish on 8/13/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import "ViewController.h"
#import "ShapeView.h"

@interface ViewController (){
    NSArray *arrayOfTags;
    NSArray *commandArray;
    __weak IBOutlet UILabel *commandLabel;
    //an array to randomize the shape of the objects
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayOfTags = @[@"0",@"1",@"2",@"3"];
    commandArray = @[@"Red Square", @"Blue Square", @"Green Square", @"Red Circle", @"Blue Circle", @"Green Circle", @"Red Triangle", @"Blue Triangle", @"Green Triangle"];
    
    int command = arc4random()%commandArray.count;
    //NSLog(@"picked problem: %@", [commandArray objectAtIndex:command]);
    
    commandLabel.text = [NSString stringWithFormat:@"Tap the %@",[commandArray objectAtIndex:command]];
    
    //NSLog(@"problemArray Count: %i", problemArray.count);
    [self recolorAllViewsWithinArray:arrayOfTags atIndex:0];
    
}



-(void)recolorAllViewsWithinArray:(NSArray *)tagArray atIndex:(NSUInteger)tagIndex {
    
    UIView *selectedView = nil;
    
    NSString *tagString = [tagArray objectAtIndex:tagIndex];
    
    for (UIView *subview in self.view.subviews) {
        if (subview.tag == [tagString intValue]) {
            selectedView = subview;
            break;
        }
    }
    
    int r = arc4random_uniform(4);
    
    //Need to make a custom class with a property for color and shape
    
    //We only want one of the asked shape!
    
    if (r == 0) {
        selectedView.backgroundColor = [UIColor redColor];
    } else if (r == 1) {
        selectedView.backgroundColor = [UIColor blueColor];
    } else {
        selectedView.backgroundColor = [UIColor greenColor];
    }
    
    if ([tagString isEqual:[tagArray lastObject]]) {
        return;
    }
    else {
        [self recolorAllViewsWithinArray:tagArray atIndex:tagIndex+1];
    }
    
}

/*-(void) didChooseView(ShapeView *)shapeView{
    for (UIImageView *subview in self.view.subviews){
        
    }
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
