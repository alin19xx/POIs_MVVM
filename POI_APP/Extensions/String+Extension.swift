//
//  String+Extension.swift
//  POI_APP
//
//  Created by Alex Lin on 8/2/23.
//

import Foundation

extension String {
    func substring(to : Int) -> String {
        let toIndex = self.index(self.startIndex, offsetBy: to - 1)
        return String(self[...toIndex])
    }
    
    func substring(from : Int) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: from + 1)
        return String(self[fromIndex...])
    }
    
    func lastIndexOfCharacter(_ c: Character) -> Int? {
        guard let index = range(of: String(c), options: .backwards)?.lowerBound else
        { return nil }
        return distance(from: startIndex, to: index)
    }
}
