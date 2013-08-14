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
    NSString *pickedCommand;
    NSArray *arrayOfTags;
    NSArray *commandArray;
    NSMutableArray *compareArray;
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
    compareArray = [[NSMutableArray alloc] initWithCapacity:4];

    [self randomCommand];
    [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
    
}

- (void)randomCommand {
    int command = arc4random()%commandArray.count;
    
    commandLabel.text = [NSString stringWithFormat:@"Tap the %@",[commandArray objectAtIndex:command]];
    pickedCommand = [commandArray objectAtIndex:command];
}



- (void)shapeColorAllViewsWithinArray:(NSArray *)tagArray atIndex:(NSUInteger)tagIndex {
    
    ShapeView *selectedView = nil;
    
    NSString *tagString = [tagArray objectAtIndex:tagIndex];
    
    for (ShapeView *subview in self.view.subviews) {
        if (![subview isKindOfClass:[UILabel class]]) {
            if (subview.tag == [tagString intValue]) {
                selectedView = subview;
                subview.delegate = self;
                break;
            }
        }
    }
    
    int r = arc4random_uniform(9);
    
    //Need to make a custom class with a property for color and shape
    
    //We only want one of the asked shape!
    
    if (r == 0) {
        UIImage *blueSquare = [UIImage imageNamed: @"blue_square.png"];
        [selectedView setImage:blueSquare];
        [compareArray addObject:@"Blue Square"];
    } else if (r == 1) {
        UIImage *blueCircle = [UIImage imageNamed: @"blue_circle.png"];
        [selectedView setImage:blueCircle];
        [compareArray addObject:@"Blue Circle"];
    } else if (r == 2){
        UIImage *blueTriangle = [UIImage imageNamed: @"blue_triangle.png"];
        [selectedView setImage:blueTriangle];
        [compareArray addObject:@"Blue Triangle"];
    } else if (r == 3){
        UIImage *greenSquare = [UIImage imageNamed: @"green_square.png"];
        [selectedView setImage:greenSquare];
        [compareArray addObject:@"Green Square"];
    } else if (r == 4){
        UIImage *greenCircle = [UIImage imageNamed: @"green_circle.png"];
        [selectedView setImage:greenCircle];
        [compareArray addObject:@"Green Circle"];
    } else if (r == 5){
        UIImage *greenTriangle = [UIImage imageNamed: @"green_triangle.png"];
        [selectedView setImage:greenTriangle];
        [compareArray addObject:@"Green Triangle"];
    } else if (r == 6){
        UIImage *redSquare = [UIImage imageNamed: @"pink_square.png"];
        [selectedView setImage:redSquare];
        [compareArray addObject:@"Red Square"];
    } else if (r == 7){
        UIImage *redCircle = [UIImage imageNamed: @"pink_circle.png"];
        [selectedView setImage:redCircle];
        [compareArray addObject:@"Red Circle"];
    } else if (r == 8){
        UIImage *redTriangle = [UIImage imageNamed: @"pink_triangle.png"];
        [selectedView setImage:redTriangle];
        [compareArray addObject:@"Red Triangle"];
    }
    
    if ([tagString isEqual:[tagArray lastObject]]) {
        //Run the fast enumeration to do the comparison between the command and randomly generated shapes
        for (NSString *object in compareArray) {
                if (object == pickedCommand) {
                    break;
                } else {
                    if ([object isEqual:[compareArray lastObject]]) {
                        NSLog(@"Command Object Not Found");
                    }
                }
        }
        return;
    }
    else {
        [self shapeColorAllViewsWithinArray:tagArray atIndex:tagIndex+1];
    }
    
}

- (void) didChooseView: (ShapeView *) shapeView{    
    if ([compareArray objectAtIndex:shapeView.tag] == pickedCommand) {
        NSLog(@"Cool Beans");
    } else {
        NSLog(@"YOU DUMB!");
    }
    
    
    //If shapeView == the command stuff then it is a match and they win, else nothing
    //objectAtIndex: shapeView.tag
    
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
