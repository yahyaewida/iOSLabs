//
//  TableViewController.m
//  webServiceDeom
//
//  Created by Esraa Hassan on 3/11/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import "TableViewController.h"
#import "Colleague.h"
#import "DetailsViewController.h"
#import <UIImageView+WebCache.h>


@implementation TableViewController{
    BOOL isFiltered;
    NSMutableArray *filteredArray;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [_searchBar setDelegate:self];
    filteredArray = [NSMutableArray new];
    
    
    [_dataTableView setDelegate:self];
    [_dataTableView setDataSource:self];
    [super viewDidLoad];
    Colleague* yahya =[Colleague new];
    yahya.name=@"yahya";
    yahya.phone=@"010";
    yahya.imagePath=@"https://icon-icons.com/descargaimagen.php?id=17359&root=108/PNG/256/&file=males_male_avatar_man_people_faces_18340.png";
    
    
    Colleague* ibrahim = [Colleague new];
    ibrahim.name=@"ibrahim";
    ibrahim.phone=@"011";
    ibrahim.imagePath = @"https://icon-icons.com/descargaimagen.php?id=17381&root=108/PNG/256/&file=males_male_avatar_man_people_faces_18362.png";
    Colleague* manar = [Colleague new];
    manar.name=@"manar";
    manar.phone=@"012";
    manar.imagePath = @"https://icon-icons.com/descargaimagen.php?id=17425&root=108/PNG/128/&file=females_female_avatar_woman_people_faces_18406.png";
    Colleague* sarah = [Colleague new];
    sarah.name=@"sarah";
    sarah.phone=@"012";
    sarah.imagePath=@"https://icon-icons.com/descargaimagen.php?id=17412&root=108/PNG/128/&file=females_female_avatar_woman_people_faces_18393.png";
    _malesColleagueArray = [NSMutableArray new];
    _femalesColleagueArray = [NSMutableArray new];
    
    [_malesColleagueArray addObject:yahya];
    [_malesColleagueArray addObject:ibrahim];
    
    [_femalesColleagueArray addObject:manar];
    [_femalesColleagueArray addObject:sarah];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    if(isFiltered){
        return 1;
    }
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
    if(isFiltered){
        return filteredArray.count;
    }
        return numberOfRows;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if(!isFiltered){
    //if no filters applied
    switch (indexPath.section) {
            case 0:
           
                cell.textLabel.text = [[_malesColleagueArray objectAtIndex:indexPath.row] name];
                cell.detailTextLabel.text = [[_malesColleagueArray objectAtIndex:indexPath.row] phone];
                [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[[_malesColleagueArray objectAtIndex:indexPath.row]imagePath]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
                break;
            
            case 1:
                cell.textLabel.text = [[_femalesColleagueArray objectAtIndex:indexPath.row] name];
                cell.detailTextLabel.text = [[_femalesColleagueArray objectAtIndex:indexPath.row] phone];
                [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[[_femalesColleagueArray objectAtIndex:indexPath.row]imagePath]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
                break;
        }
    }else{
        //if filter is applied
        cell.textLabel.text = [[filteredArray objectAtIndex:indexPath.row] name];
        cell.detailTextLabel.text = [[filteredArray objectAtIndex:indexPath.row] phone];
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:[[filteredArray objectAtIndex:indexPath.row]imagePath]] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
       
    }
    return cell;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!isFiltered){
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            switch (indexPath.section) {
                case 0:
                    [_malesColleagueArray removeObject:[_malesColleagueArray objectAtIndex:indexPath.row]];
                    break;
                    
                case 1:
                    [_femalesColleagueArray removeObject:[_femalesColleagueArray objectAtIndex:indexPath.row]];
                    
                    break;
            }
            
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView reloadData];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    _dataTableView = tableView;
    NSString* title;
    if(!isFiltered){
        switch (section) {
            case 0:
                title=@"males";
                break;
                
            case 1:
                title=@"females";
                break;
        }
    }
    else{
        title = @"filtered Data";
    }
    return title;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsViewController* viewControllerObject=[self.storyboard instantiateViewControllerWithIdentifier:@"detailsView"];
    
    if(!isFiltered){
        switch (indexPath.section) {
            case 0:
                viewControllerObject.colleague = [_malesColleagueArray objectAtIndex:indexPath.row];
                break;
                
            case 1:
                viewControllerObject.colleague = [_femalesColleagueArray objectAtIndex:indexPath.row];
                break;
        }
    }
    else{
        viewControllerObject.colleague = [filteredArray objectAtIndex:indexPath.row];
    }
    viewControllerObject.image = [[[tableView cellForRowAtIndexPath:indexPath] imageView] image];
    
    [self presentViewController:viewControllerObject animated:YES completion:nil];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if(searchText.length == 0){
        isFiltered = NO;
    }else{
        
        isFiltered = YES;
        [filteredArray removeAllObjects];
        for(int i = 0; i < [_malesColleagueArray count]; i++){
            if([[[[_malesColleagueArray objectAtIndex:i]name]lowercaseString]containsString:[searchText lowercaseString]]){
                [filteredArray addObject:[_malesColleagueArray objectAtIndex:i]];
            }
        }
        for(int i = 0; i < [_femalesColleagueArray count]; i++){
            if([[[[_femalesColleagueArray objectAtIndex:i]name]lowercaseString]containsString:[searchText lowercaseString]]){
                [filteredArray addObject:[_femalesColleagueArray objectAtIndex:i]];
            }
        }
    }
    
    [self.dataTableView reloadData];
}

    


@end
