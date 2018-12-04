//
//  ViewController.swift
//  getImageFromInternet
//
//  Created by Jack on 2018/12/3.
//  Copyright © 2018年 Jack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageViewFromInternet: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlStr = "https://solarsystem.nasa.gov/system/feature_items/images/17_earth.png"
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url)
            { (data, response, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageViewFromInternet.image = image
                    }
                }
            }
            task.resume()
            
        }
                
    }


}

