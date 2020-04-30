//
//  MainViewModel.swift
//  CurrencyExchange
//
//  Created by Yahya Ewida on 4/25/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel{
    
    private var currencyDataSubject: PublishSubject<[CurrencyReducer]> = PublishSubject()
    private var networkRepository =  NetworkRepository()
    private var currencyReducedData = [CurrencyReducer]()
    private var disposeBag = DisposeBag()
    internal var dataDriver: Driver<[CurrencyReducer]>
    
    init(){        
        dataDriver = currencyDataSubject.asDriver(onErrorJustReturn: [])
    }
    
    func filterSearchData(_ currencyName: String) {
        print(currencyName)
        let filteredData = currencyReducedData.filter{ reducedCurrency in reducedCurrency.currencyName.starts(with: currencyName)}
        currencyDataSubject.onNext(filteredData)
    }
    
    
    func getCurrency(){
        let observable: Observable<[Currency]> = networkRepository.getCurrency()!
        
        observable.subscribeOn(ConcurrentDispatchQueueScheduler.init(qos: .background))
        .map{currency in currency[0].rates }
        .flatMap{data in
            Observable.from(data).map{(key, value) in CurrencyReducer(currencyName: key, currencyValue: value)}.toArray()
        }.subscribe({[weak self] reducedCurrenyData in
            self?.currencyReducedData = reducedCurrenyData.element ?? [CurrencyReducer]()
            self?.currencyDataSubject.onNext(reducedCurrenyData.element!)}).disposed(by: disposeBag)
    }
    
}

