//
//  OnlineDataProtocol.swift
//  MovieListMVP
//
//  Created by Esraa Hassan on 4/8/20.
//  Copyright © 2020 Yahya. All rights reserved.
//

import Foundation

protocol OnlineDataProtocol{
    func requestMoviesOnline(action : @escaping () -> Void) 
}
