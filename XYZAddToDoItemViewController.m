//
//  XYZAddToDoItemViewController.m
//  ToDoList
//
//  Created by Dulshan Kalpage on 30/06/2014.
//  Copyright (c) 2014 Swinburne. All rights reserved.
//

//own little header for main file
#import "XYZAddToDoItemViewController.h"
#import "XYZToDoListTableViewController.h"

@interface XYZAddToDoItemViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneButton;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end


@implementation XYZAddToDoItemViewController

//prepareForSegue method is the first step of logic after user taps the Done button
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender!= self.doneButton)
        return;
    
    //Is there any text in the textfield?
    if (self.textField.text.length > 0)
    {
        self.toDoItem = [[XYZToDoItem alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
