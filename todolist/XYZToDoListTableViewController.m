//
//  XYZToDoListTableViewController.m
//  ToDoList
//
//  Created by Dulshan Kalpage on 30/06/2014.
//  Copyright (c) 2014 Swinburne. All rights reserved.
//

#import "XYZToDoListTableViewController.h"
#import "XYZToDoItem.h"
#import "XYZAddToDoItemViewController.h"

@interface XYZToDoListTableViewController ()

//item list only accessible to this class
@property NSMutableArray *toDoItems;

@end

@implementation XYZToDoListTableViewController

//load initial data
- (void) loadInitialData
{
    XYZToDoItem *item1 = [[XYZToDoItem alloc] init];
    item1.itemName = @"Buy Milk";
    [self.toDoItems addObject:item1];
    
    XYZToDoItem *item2 = [[XYZToDoItem alloc] init];
    item2.itemName = @"Buy eggs";
    [self.toDoItems addObject:item2];
    
    XYZToDoItem *item3 = [[XYZToDoItem alloc] init];
    item3.itemName = @"Read a book";
    [self.toDoItems addObject:item3];
    
    
    
}

//new data
- (void) loadNewData
{
    XYZToDoItem *item4 = [[XYZToDoItem alloc] init];
    item4.itemName = @"Here's another one!";
    [self.toDoItems addObject:item4];
}

//Unwind back to ToDoList from AddNewItem add/cancel buttons. You make the interface and implementation
//in the destination file, aka ToDoListTableViewController
//May or may not return data - CONFIRM?
- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    XYZAddToDoItemViewController *source = [segue sourceViewController];
    
    XYZToDoItem *item = source.toDoItem;
    
    //nothing typed in
    if (item != nil)
    {
        //add item if there is one in
        [self.toDoItems addObject:item];
        
        
        //reload table
        [self.tableView reloadData];
    }
}

//2nd test
/*- (IBAction)secondUnwindTest:(UIStoryboardSegue *)segue
{
    
}*/


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad //method that initializes items at start of controller load
{
    [super viewDidLoad];
    //toDoItems
    self.toDoItems = [[NSMutableArray alloc] init];
    
    //call loadInitialData method
    [self loadInitialData];
    
    //see if user has added any new data
    [self loadNewData];
    
    
    //generic xcode optimization comments
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ListPrototypeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    XYZToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    //show checkmark for completed items
    if (toDoItem.completed)
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//this handles what happens when you select a cell
#pragma mark - Table view delegate
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //deselect highlight once tapped
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //search for corresponding XYZToDoItem in array depending on what you tapped
    XYZToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    
    //toggle completion state of the item
    //found in XYZToDoItem, its own property- object of its class = one item/row
    tappedItem.completed = !tappedItem.completed;
    
    //reload row of updated items
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
}

@end
