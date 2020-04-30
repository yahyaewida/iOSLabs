//
//  ViewController.swift
//  Day2
//
//  Created by Yahya Ewida on 4/24/20.
//  Copyright © 2020 Yahya Ewida. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ViewController: UIViewController {

    @IBOutlet weak private var throttleButton: UIButton!
    @IBOutlet weak private var debounceButton: UIButton!
    
    var disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupObservers()
    }
    private func setupObservers(){
        
        throttleButton.rx.tap
            .throttle(.seconds(5), scheduler: MainScheduler.asyncInstance)
            .subscribe{ value  in
                print("throttle tabbed")
                }.disposed(by: disposeBag)
        
        debounceButton.rx.tap
            .debounce(.seconds(1), scheduler: MainScheduler.asyncInstance)
            .subscribe{ value in
            print("debounce tabbed")
        }
        .disposed(by: disposeBag)
        
    }


}

