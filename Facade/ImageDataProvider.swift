//
//  ImageDataProvider.swift
//  Facade
//
//  Created by Марк Фокша on 10.07.2023.
//

import UIKit

class ImageDataProvider {
    
    func data(from image: UIImage, type: ImageType) throws -> Data {
        switch type {
        case .jpeg(let compressionQuality):
            return try jpegData(from: image, compressionQuality: compressionQuality)
        case .png:
            return try pngData(from: image)
        }
    }
    
    private func jpegData(from image: UIImage, compressionQuality: CGFloat) throws -> Data {
        guard let jpegData = image.jpegData(compressionQuality: compressionQuality) else { throw ImageSaverError.couldNotCreateJPEGDataFromImage}
        return jpegData
    }
    
    private func pngData(from image: UIImage) throws -> Data {
        guard let pngData = image.pngData() else { throw ImageSaverError.couldNotCreatePNGDataFromImage}
        return pngData
    }
}

