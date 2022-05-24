//
//  ViewController.swift
//  reciprocalApp
//
//  Created by 曾曜澤 on 2022/5/24.
//

import UIKit

class ViewController: UIViewController {
    //倒數更改數字前
    @IBOutlet weak var num1Label: UILabel!
    @IBOutlet weak var num2Label: UILabel!
    @IBOutlet weak var num3Label: UILabel!
    @IBOutlet weak var num4Label: UILabel!
    @IBOutlet weak var num5Label: UILabel!
    //倒數更改數字後
    @IBOutlet weak var num11Label: UILabel!
    @IBOutlet weak var num12Label: UILabel!
    @IBOutlet weak var num13Label: UILabel!
    @IBOutlet weak var num14Label: UILabel!
    @IBOutlet weak var num15Label: UILabel!
    //事件名稱更改
    @IBOutlet weak var eventNameLabel: UILabel!
    //下一頁頁面
    @IBOutlet var pageView: UIView!
    //輸入事件名稱
    @IBOutlet weak var nameTextField: UITextField!
    //輸入時間
    @IBOutlet weak var timeDatePicker: UIDatePicker!
    //宣告timer
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //隱藏頁面
        pageView.isHidden = true
    }
    //無數值不顯示
    override func viewDidDisappear(_ animated: Bool) {
        if time != nil {
            timer?.invalidate()
        }
    }
    //下一頁
    @IBAction func addNewThing(_ sender: Any) {
        //顯示頁面
        pageView.isHidden = false
    }
    //確認鈕
    @IBAction func okButton(_ sender: Any) {
        //更改主頁事件名稱
        let event = nameTextField.text!
        eventNameLabel.text = "\(event)"
        //獲取時間
        let dueDate = timeDatePicker.date
        //
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ [self] (_) in
        //換算時間
        let interval = Int(dueDate.timeIntervalSinceNow)
        let mth = interval / ( 60 * 60 * 24 * 30)
        let day = interval / ( 60 * 60 * 24 ) % 30
        let hrs = interval / ( 60 * 60 ) % 24
        let min = interval / 60 % 60
        let sec = interval % 60
            
        //數字顯示
        let numberFormatter = NumberFormatter()
        numberFormatter.formatWidth = 2
        numberFormatter.paddingCharacter = "0"
        //數字前
        num1Label.text = numberFormatter.string(from: NSNumber(value: mth))
        num2Label.text = numberFormatter.string(from: NSNumber(value: day))
        num3Label.text = numberFormatter.string(from: NSNumber(value: hrs))
        num4Label.text = numberFormatter.string(from: NSNumber(value: min))
        num5Label.text = numberFormatter.string(from: NSNumber(value: sec))
        //數字後
        num11Label.text = numberFormatter.string(from: NSNumber(value: mth))
        num12Label.text = numberFormatter.string(from: NSNumber(value: day))
        num13Label.text = numberFormatter.string(from: NSNumber(value: hrs))
        num14Label.text = numberFormatter.string(from: NSNumber(value: min))
        num15Label.text = numberFormatter.string(from: NSNumber(value: sec))
        }
        //空白處收鍵盤
        view.endEditing(true)
        pageView.isHidden = true
    }
    //取消鈕
    @IBAction func cancelButton(_ sender: Any) {
        pageView.isHidden = true
    }
    

}

