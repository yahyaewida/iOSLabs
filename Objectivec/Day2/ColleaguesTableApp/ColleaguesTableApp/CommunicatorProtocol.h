//
//  CommunicatorProtocol.h
//  NavigationControllerApp
//
//  Created by Esraa Hassan on 3/7/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Colleague.h"
@protocol CommunicatorProtocol <NSObject>
- (void)insertNewColleague:(Colleague *) newColleague inSection:(int) section;

@end
