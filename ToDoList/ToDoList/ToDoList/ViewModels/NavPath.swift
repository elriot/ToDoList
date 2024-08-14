//
//  NavPath.swift
//  ToDoList
//
//  Created by SOOPIN KIM on 2024-08-05.
//

import SwiftUI

enum NavPath: Hashable {
    case newItem
    case userInfo
    case details(Item)
}
