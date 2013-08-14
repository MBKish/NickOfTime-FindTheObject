//
//  ViewController.h
//  NickOfTime-FindTheObject
//
//  Created by Matthew Kish on 8/13/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PickedDelegate.h"

@interface ViewController : UIViewController <PickedDelegate>

- (void) didChooseView: (ShapeView *) shapeView;

@end
