//
//  TableViewController.h
//  MapViewDemo
//
//  Created by Esraa Hassan on 3/22/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunicatorProtocol.h"
@interface TableViewController : UITableViewController{
    @private
    NSArray* avatarsArray;
}
@property id<CommunicatorProtocol> registerationView;

@end
