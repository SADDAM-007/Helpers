//
//  ViewController.swift
//  Helpers
//
//  Created by Saddam on 28/08/18.
//  Copyright © 2018 SaddamHusain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         self.view.backgroundColor = UIColor.FlatColor.IndianFlatUIPalette.ClearChill
        APIManager.postService(url: "http://merp.intermesh.net/index.php/userlist/mycompany?empid=29412&usertype=1&sorting=&native=yes", params: [:], success: { (json) in
                        print(json as Any)
                    }) { (error) in
            
                    }
        
        // hello test git
        // fack git issue
        // dsfdsjkhdfsj
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

