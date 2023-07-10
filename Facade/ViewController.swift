//
//  ViewController.swift
//  Facade
//
//  Created by Марк Фокша on 10.07.2023.
//

import UIKit

enum ImageSaverError: Error {
    case couldNotCreateDestinationPath
    case couldNotCreateJPEGDataFromImage
    case couldNotCreatePNGDataFromImage
    case couldNotSaveImageDestinationPath
}

enum ImageType {
    case jpeg(compressionQuality: CGFloat)
    case png
}

class ViewController: UIViewController {

    let imageSaver = ImageSaverFacade()
    let image = UIImage(named: "image")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let image = image else { return }
        do {
            try imageSaver.save(image: image, type: .png, fileName: "Butterfly", overwrite: true )
        } catch {
            print(String(describing: error))
        }
    }


}

