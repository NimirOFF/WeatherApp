//
//  ExtensionAC.swift
//  WeatherApp
//
//  Created by Mac mini on 26.05.2021.
//

import UIKit

extension ViewController {
    
    func searchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { (textField) in
            textField.placeholder = "Например Moscow"
        }
        
        let search = UIAlertAction(title: "Поиск", style: .default) { (action) in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                completionHandler(city)
            } else {
                self.showEmptyString()
            }
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
    
    
    func showEmptyString() {
        
        let alert = UIAlertController.init(title: "Город не введен", message: "Введите название города", preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Ok", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    
    func getCurrentDate() -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM"
        formatter.setLocalizedDateFormatFromTemplate("dMMM")
        formatter.locale = Locale(identifier: "ru_RU")
        let currentDate = formatter.string(from: Date())
        return currentDate
    }
    
    
    func getCurrentDay() -> String {
         
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier: "ru_RU")
        let currentDay = formatter.string(from: Date())
        return currentDay
    }
}
