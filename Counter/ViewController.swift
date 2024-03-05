//
//  ViewController.swift
//  Counter
//
//  Created by Maks on 01.03.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var counterButton: UIButton!
    var count = 0
    @IBOutlet weak var historyTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    @IBAction func tapButton(_ sender: Any) {
        count += 1
        updateCountLabelAndHistory(value: 1)
    }
    
    
    @IBAction func resetButton(_ sender: Any) {
        count = 0
        updateCountLabelAndHistory(value: 0)
    }
    
    @IBAction func minusButton(_ sender: Any) {
        if count > 0 {
            count -= 1
            updateCountLabelAndHistory(value: -1)
        } else {
            addToHistory("Нельзя уменьшить значение счетчика ниже 0")
        }
        
    }
    
    @IBAction func plusButton(_ sender: Any) {
        count += 1
        updateCountLabelAndHistory(value: 1)
        
    }
    
    func addToHistory(_ action: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let timestamp = formatter.string(from: Date())
        historyTextView.text.append("\(timestamp): \(action)\n")
        historyTextView.scrollRangeToVisible(NSRange(location: historyTextView.text.count - 1, length: 0))
        
    }
    
    func updateCountLabelAndHistory(value: Int) {
        counterLabel.text = "Значение счетчика: \(count)"
        addToHistory("Значение счетчика изменено на \(value > 0 ? "+\(value)" : "\(value)")")
    }
    
}

