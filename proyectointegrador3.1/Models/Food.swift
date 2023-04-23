//
//  Food.swift
//  proyectointegrador3
//
//  Created by Jose A Meza Mendoza on 4/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Food: Identifiable, Codable {
    @DocumentID var id: String?
    var title: String
    var employee: String
    var status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case employee
        case status
    }
}
