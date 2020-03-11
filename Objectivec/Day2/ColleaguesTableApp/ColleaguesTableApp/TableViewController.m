//
//  TableViewController.m
//  ColleaguesTableApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "TableViewController.h"
#import "Colleague.h"
#import "ViewController.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Colleague* yahya =[Colleague new];
    yahya.name=@"yahya";
    yahya.phone=@"010";
    yahya.age = 24;
    yahya.address=@"Nasr City";
    yahya.email=@"yahya@gmail.com";
    
    Colleague* ibrahim = [Colleague new];
    ibrahim.name=@"ibrahim";
    ibrahim.phone=@"011";
    ibrahim.age = 24;
    ibrahim.address=@"El Marg";
    ibrahim.email=@"Hima@gmail.com";
    
    Colleague* manar = [Colleague new];
    manar.name=@"manar";
    manar.phone=@"012";
    manar.age = 24;
    manar.address=@"El Haram";
    manar.email=@"manar@gmail.com";
    
    Colleague* sarah = [Colleague new];
    sarah.name=@"sarah";
    sarah.phone=@"012";
    sarah.age = 22;
    sarah.address=@"El Mansoura";
    sarah.email=@"sarah@gmail.com";
    
    _malesColleagueArray = [NSMutableArray new];
    _femalesColleagueArray = [NSMutableArray new];
    
    [_malesColleagueArray addObject:yahya];
    [_malesColleagueArray addObject:ibrahim];
    
    [_femalesColleagueArray addObject:manar];
    [_femalesColleagueArray addObject:sarah];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    NSInteger numberOfRows=0;
    
    switch (section) {
        case 0:
            numberOfRows = _malesColleagueArray.count;
            break;
            
        case 1:
            numberOfRows = _femalesColleagueArray.count;
            break;
    }
    
    return numberOfRows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = [[_malesColleagueArray objectAtIndex:indexPath.row] name];
            cell.detailTextLabel.text = [[_malesColleagueArray objectAtIndex:indexPath.row] phone];
            break;
            
        case 1:
            cell.textLabel.text = [[_femalesColleagueArray objectAtIndex:indexPath.row] name];
            cell.detailTextLabel.text = [[_femalesColleagueArray objectAtIndex:indexPath.row] phone];
            break;
    }
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        switch (indexPath.section) {
            case 0:
                [_malesColleagueArray removeObject:[_malesColleagueArray objectAtIndex:indexPath.row]];
                
                break;
                
            case 1:
                [_femalesColleagueArray removeObject:[_femalesColleagueArray objectAtIndex:indexPath.row]];
                
                break;
        }
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    _dataTableView = tableView;
    NSString* title;
    switch (section) {
        case 0:
            title=@"males";
            break;
            
        case 1:
            title=@"females";
            break;
    }
    return title;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     ViewController* viewControllerObject=[self.storyboard instantiateViewControllerWithIdentifier:@"detailsStoryBoard"];
    
    switch (indexPath.section) {
        case 0:
            viewControllerObject.colleague = [_malesColleagueArray objectAtIndex:indexPath.row];
            break;
            
        case 1:
            viewControllerObject.colleague = [_femalesColleagueArray objectAtIndex:indexPath.row];
            break;
    }
    
    viewControllerObject.tableViewScreen = self;
    
    [self.navigationController pushViewController:viewControllerObject animated:YES];
}
- (void)insertNewColleague:(Colleague *) newColleague inSection:(int) section{
    switch (section) {
        case 0:
            [_malesColleagueArray addObject:newColleague];
            break;
        case 1:
            [_femalesColleagueArray addObject:newColleague];
            break;
    }
    
    [_dataTableView reloadData];
    
}

@end
