//
//  ViewController.swift
//  myLotto
//
//  Created by 장성구 on 2020/03/26.
//  Copyright © 2020 com.sg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* 각 번호 표시 레이블 연결 */
    @IBOutlet weak var showPrint1: UILabel!
    @IBOutlet weak var showPrint2: UILabel!
    @IBOutlet weak var showPrint3: UILabel!
    @IBOutlet weak var showPrint4: UILabel!
    @IBOutlet weak var showPrint5: UILabel!
    @IBOutlet weak var showPrint6: UILabel!
    
    /* 전체 결과 표시 레이블 연결 */
    @IBOutlet weak var totalPrint: UILabel!
    
    /* 버튼 연결 및 클릭시 동작 */
    @IBAction func runButton(_ sender: Any) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

