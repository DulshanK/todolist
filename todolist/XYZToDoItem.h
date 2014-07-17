//
//  XYZToDoItem.h
//  ToDoList
//
//  Created by Dulshan Kalpage on 2/07/2014.
//  Copyright (c) 2014 Swinburne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYZToDoItem : NSObject

@property NSString *itemName;
@property BOOL completed;
@property (readonly) NSDate *creationDate;

@end
