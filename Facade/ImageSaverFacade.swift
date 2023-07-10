//
//  ImageSaverFacade.swift
//  Facade
//
//  Created by Марк Фокша on 10.07.2023.
//

import Foundation
import UIKit

class ImageSaverFacade {
    private let pathProvider = PathProvider()
    private let imageDataProvider = ImageDataProvider()
    
    func save(image: UIImage, type: ImageType, fileName: String, overwrite: Bool) throws {
        
        let destinationURL = try pathProvider.createDestinationPath(fileName: fileName)
        let imageData = try imageDataProvider.data(from: image, type: type)
        
        let writingOptions: Data.WritingOptions = overwrite ? .atomic : .withoutOverwriting
        try imageData.write(to: destinationURL, options: writingOptions)
    }
    
    
}
