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
    NSMutableArray *unpickedCommandsArray;
    NSMutableArray *compareArray;
    
    __weak IBOutlet UILabel *commandLabel;
    int badCount;
    //an array to randomize the shape of the objects
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    badCount = 0;
    arrayOfTags = @[@"0",@"1",@"2",@"3"];
    
    commandArray = @[@"Red Square", @"Blue Square", @"Green Square", @"Red Circle", @"Blue Circle", @"Green Circle", @"Red Triangle", @"Blue Triangle", @"Green Triangle"];
    unpickedCommandsArray = [[NSMutableArray alloc] initWithArray:commandArray];
    
    compareArray = [[NSMutableArray alloc] initWithCapacity:4];

    [self randomCommand];
    [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
    
}

- (void)randomCommand {
    int command = arc4random()%commandArray.count;
    
    commandLabel.text = [NSString stringWithFormat:@"Tap the %@",[commandArray objectAtIndex:command]];
    pickedCommand = [commandArray objectAtIndex:command];
    [unpickedCommandsArray removeObjectAtIndex:command];
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
    int r = arc4random_uniform(unpickedCommandsArray.count);
    NSLog(@"%i",r);
    
    //Need to make a custom class with a property for color and shape
    
    //We only want one of the asked shape!
    
    if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Blue Square"]) {
        UIImage *blueSquare = [UIImage imageNamed: @"blue_square.png"];
        [selectedView setImage:blueSquare];
        [compareArray addObject:@"Blue Square"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Blue Circle"]) {
        UIImage *blueCircle = [UIImage imageNamed: @"blue_circle.png"];
        [selectedView setImage:blueCircle];
        [compareArray addObject:@"Blue Circle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Blue Triangle"]) {
        UIImage *blueTriangle = [UIImage imageNamed: @"blue_triangle.png"];
        [selectedView setImage:blueTriangle];
        [compareArray addObject:@"Blue Triangle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Green Square"]) {
        UIImage *greenSquare = [UIImage imageNamed: @"green_square.png"];
        [selectedView setImage:greenSquare];
        [compareArray addObject:@"Green Square"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Green Circle"]) {
        UIImage *greenCircle = [UIImage imageNamed: @"green_circle.png"];
        [selectedView setImage:greenCircle];
        [compareArray addObject:@"Green Circle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Green Triangle"]) {
        UIImage *greenTriangle = [UIImage imageNamed: @"green_triangle.png"];
        [selectedView setImage:greenTriangle];
        [compareArray addObject:@"Green Triangle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Red Square"]) {
        UIImage *redSquare = [UIImage imageNamed: @"pink_square.png"];
        [selectedView setImage:redSquare];
        [compareArray addObject:@"Red Square"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Red Circle"]) {
        UIImage *redCircle = [UIImage imageNamed: @"pink_circle.png"];
        [selectedView setImage:redCircle];
        [compareArray addObject:@"Red Circle"];
    } else if ([[unpickedCommandsArray objectAtIndex:r] isEqual: @"Red Triangle"]) {
        UIImage *redTriangle = [UIImage imageNamed: @"pink_triangle.png"];
        [selectedView setImage:redTriangle];
        [compareArray addObject:@"Red Triangle"];
    }
    
    if ([tagString isEqual:[tagArray lastObject]]) {
        //Run the fast enumeration to do the comparison between the command and randomly generated shapes
        /*for (NSString *object in compareArray) {
                if (object == pickedCommand) {
                    break;
                } else {
                    if ([object isEqual:[compareArray lastObject]]) {
                        [compareArray removeAllObjects];
                        [self shapeColorAllViewsWithinArray:tagArray atIndex:0];
                        badCount++;
                        NSLog(@"Bad Count = %i", badCount);
                        break;
                    }
                }
        }*/
        return;
    } else {
        [self shapeColorAllViewsWithinArray:tagArray atIndex:tagIndex+1];
    }
    
}

- (void) didChooseView: (ShapeView *) shapeView{    
    if ([compareArray objectAtIndex:shapeView.tag] == pickedCommand) {
        NSLog(@"Cool Beans");
        [compareArray removeAllObjects];
        badCount = 0;
        [self randomCommand];
        [self shapeColorAllViewsWithinArray:arrayOfTags atIndex:0];
    } else {
        NSLog(@"Not Cool");
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
