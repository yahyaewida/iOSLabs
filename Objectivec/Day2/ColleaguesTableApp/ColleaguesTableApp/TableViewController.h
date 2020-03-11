//
//  TableViewController.h
//  ColleaguesTableApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunicatorProtocol.h"
@interface TableViewController : UITableViewController <CommunicatorProtocol>
@property (strong, nonatomic) IBOutlet UITableView *dataTableView;
@property NSMutableArray* malesColleagueArray;
@property NSMutableArray* femalesColleagueArray;

@end
