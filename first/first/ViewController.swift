//
//  ViewController.swift
//  first
//
//  Created by user149791 on 12/31/18.
//  Copyright © 2018 user149791. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherLabel: UILabel!
    
    @IBOutlet weak var touch: UIButton!
    
    @IBOutlet weak var temptext: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //  getWeather()
    }
    
    
    @IBAction func tembutton(_ sender: UIButton) {
        getWeather()
    }
    
    func getWeather(){
    let session = URLSession.shared
    let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?id=4699066&appid=aee27ba8d2fd7f00b6f55ca3dc3bf106")!
    let dataTask = session.dataTask(with: weatherURL) {
    (data: Data?, response: URLResponse?, error: Error?) in
        
    if let error = error {
    print("Error:\n\(error)")
    } else {
    if let data = data {
    let dataString = String(data: data, encoding: String.Encoding.utf8)
    print("All the weather data:\n\(dataString!)")
    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
    if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
    if let temperature = mainDictionary.value(forKey: "temp") {
    DispatchQueue.main.async {
    self.weatherLabel.text = "Texas Temperature: \(temperature)°F"
    }
    }
    } else {
    print("Error: unable to find temperature in dictionary")
    }
    } else {
    print("Error: unable to convert json data")
    }
    } else {
    print("Error: did not receive data")
    }
    }
    }
    dataTask.resume()    }
}


