//
//  TableViewController.h
//  webServiceDeom
//
//  Created by Esraa Hassan on 3/11/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property NSMutableArray* malesColleagueArray;
@property NSMutableArray* femalesColleagueArray;
@property (weak, nonatomic) IBOutlet UITableView *dataTableView;

@end
