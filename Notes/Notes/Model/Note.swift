//
//  Note.swift
//  Notes
//
//  Created by Anna on 11.02.2023.
//

import Foundation

struct Note: Codable {
    let title: String
    let text: String
    var id = UUID().uuidString
}
