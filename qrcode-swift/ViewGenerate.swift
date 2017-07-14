//
//  ViewGenerate.swift
//  qrcode-swift
//
//  Created by McSpicy on 14/7/17.
//  Copyright © 2017 McSpicy. All rights reserved.
//

import Foundation
import UIKit

class ViewGenerate: ViewController {
    
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imgQRCode: UIImageView!
    override func viewDidLoad() {
        //
    }
    
    @IBAction func btnActionProses(_ sender: Any) {
        let image = generateQRCode(from: textField.text!)
        imgQRCode.image = image
    }
    
    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.isoLatin1)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 2, y: 2)
            
            if let output = filter.outputImage?.applying(transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
    }
}
