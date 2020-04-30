//
//  CurrencyCollectionViewCell.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/23/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import UIKit

class CurrencyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var currencyNameLabel: UILabel!
    @IBOutlet weak private var currencyValueLabel: UILabel!
    var currencyReducer : CurrencyReducer? {
        didSet{
            currencyNameLabel.text = currencyReducer?.currencyName
            currencyValueLabel.text = String(currencyReducer!.currencyValue)
        }
    }
    
}
