//
//  PathProvider.swift
//  Facade
//
//  Created by Марк Фокша on 10.07.2023.
//

import Foundation

class PathProvider {
    public func createDestinationPath(fileName: String) throws -> URL {
        guard let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { throw ImageSaverError.couldNotCreateDestinationPath }
        let destinationPath = path.appending(path: "\(fileName)")
        print(destinationPath)
        return destinationPath
    }
}
