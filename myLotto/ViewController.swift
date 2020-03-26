//
//  ViewController.swift
//  myLotto
//
//  Created by 장성구 on 2020/03/26.
//  Copyright © 2020 com.sg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /* 추첨된 로또 번호를 저장할 공간 */
    var lottoScore: [Int] = []
    

    
    
    /* 각 번호 표시 레이블 연결 */
    @IBOutlet weak var showPrint1: UILabel!
    @IBOutlet weak var showPrint2: UILabel!
    @IBOutlet weak var showPrint3: UILabel!
    @IBOutlet weak var showPrint4: UILabel!
    @IBOutlet weak var showPrint5: UILabel!
    @IBOutlet weak var showPrint6: UILabel!
    
    /* 전체 결과 표시 레이블 연결 */
    @IBOutlet weak var totalPrint: UILabel!
    
    override func viewDidLoad() {
          super.viewDidLoad()
          
      }
    
    /* 버튼 연결 및 클릭시 동작 */
    @IBAction func runButton(_ sender: Any) {
        
        /* 버튼 클릭시 페이드 효과 주기 위해 초기 값 설정 */
        totalPrint.alpha = 0
        showPrint1.alpha = 0
        showPrint2.alpha = 0
        showPrint3.alpha = 0
        showPrint4.alpha = 0
        showPrint5.alpha = 0
        showPrint6.alpha = 0
        
        refrash() // 버튼클릭 할 때마다 로또 추첨 함수 불러오기
        
        /* 페이드 효과 주기 */
        UIView.animate(withDuration:1.0,animations:({ // -> withDuration: 1.0 , 1.0 값은 나타나는 속도
            self.totalPrint.alpha = 1
            self.showPrint1.alpha = 1
            self.showPrint2.alpha = 1
            self.showPrint3.alpha = 1
            self.showPrint4.alpha = 1
            self.showPrint5.alpha = 1
            self.showPrint6.alpha = 1
            
        }))
        
    }
    
    func refrash(){
        var i = 1
        while i < 7 { // 로또 번호가 6개이므로 개수 6개될때까지 반복
        
            let randomPrice = arc4random_uniform(45) + 1 // arc4random_uniform 는 입력 수 안에서 랜덤으로 추출
            let currentValue = Int(randomPrice) // arc4randomd으로 추출한 값을 다시 변수에 넣기 위해 Int형으로 변환 후 값을 저장
            lottoScore.append(currentValue) // 추첨된 숫자를 append를 이용하여 배열에 저장.
            let distictScore = Set(lottoScore) // Set을 사용하여 배열의 중복된 값을 체크후 제거
            lottoScore = Array(distictScore) // 중복제거가 완료된 값을 다시 배열에 저장
            i = lottoScore.count // 중복검사 후 제거된 중복 값이 있으면 개수가 줄어들기 때문에 카운트에 다시 넣어 부족한 수만큼 로직 재기동 하기.
            i+=1
        }
        
        /* sorted를 이용하여 추첨번호를 오름 차순으로 정렬  [by:<]는 오름차순, [by:>]는 내림차순 */
        lottoScore = lottoScore.sorted(by:<)
        
        totalPrint.text = "행운번호\(lottoScore)"
        
        showPrint1.text="\(lottoScore[0])"
        showPrint2.text="\(lottoScore[1])"
        showPrint3.text="\(lottoScore[2])"
        showPrint4.text="\(lottoScore[3])"
        showPrint5.text="\(lottoScore[4])"
        showPrint6.text="\(lottoScore[5])"
        
        /* 직전에 뽑았던 번호가 저장 되어 있음으로 다음 추첨 시 오류가 생겨 초기화 */
        lottoScore = []
        
        
    }
    
}

