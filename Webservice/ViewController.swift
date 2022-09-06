//
//  ViewController.swift
//  Webservice
//
//  Created by Pavankumar Arepu on 06/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webserviceStatusLabel: UILabel!
    
   // URL --> "https://www.fdfsdfsdfdsfsdfsdfds.comfdsfdsfdsfa" // Some valid URL, for now I gave dummy
    
    let urlString = "https://www.fdfsdfsdfdsfsdfsdfds.comfdsfdsfdsfa"
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        // Do any additional setup after loading the view.
    }


    @IBAction func hitAPI(_ sender: Any) {
        webServiceHit(url: urlString)
    }
    
    
    func webServiceHit(url: String) {
        
        let url  = NSURL.init(string: url)
        guard let urlString = url else {
            return
        }
        let urlRequest = URLRequest.init(url: urlString as URL)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            print("Data:", data as Any)
            print("Response:", response as Any)
            print("Error:", error as Any)
            DispatchQueue.main.async {
                self.webserviceStatusLabel.text = "Downloaded data!"
            }
        }
        task.resume()
    }
}



/*
 let task = URLSession.shared.dataTask(with: URL(string: "https://www.goodmorninghdloveimages.com/wp-content/uploads/2021/11/Pic-Of-Bal-Gopal-Images-Hd-Free-Download.jpg")!, completionHandler: { data, response, error in
     // Do something with image data...
     if let receivedData = data {
         DispatchQueue.main.async {
             self.dataImageView.image = UIImage.init(data: receivedData)
         }
         print("ReceivedData:", receivedData)
     }
 })
 
 task.resume()
 */
