//
//  PickedDelegate.h
//  NickOfTime-FindTheObject
//
//  Created by Matthew Kish on 8/14/13.
//  Copyright (c) 2013 TimeMonkeys. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ShapeView;

@protocol PickedDelegate <NSObject>

- (void) didChooseView: (ShapeView *) shapeView;

@end
