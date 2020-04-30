//
//  ViewController.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/23/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CurrencyViewController: UIViewController {

    @IBOutlet weak private var collectionView: UICollectionView!
    @IBOutlet weak private var searchBar: UISearchBar!
    
    private var currencyReducer = [CurrencyReducer]()
    private var  viewModel = MainViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewModel.getCurrency()
        
        setupCollectionObserverData()
        setupSearchObserver()
    }
    

    func setupSearchObserver(){
          searchBar.rx.text
              .orEmpty
              .distinctUntilChanged()
              .throttle(.milliseconds(300), scheduler: MainScheduler.asyncInstance)
              .subscribe(onNext: {[weak self] (value) in
                  guard case self = self else {return}                    
                  self?.viewModel.filterSearchData(value)
          }).disposed(by: disposeBag)
      }
    func setupCollectionObserverData(){
        viewModel.dataDriver.drive(collectionView.rx.items(cellIdentifier: "cell", cellType: CurrencyCollectionViewCell.self)){
            (row, data, cell) in
            cell.currencyReducer = data
        }.disposed(by: disposeBag)
    }
    
  


}

