//
//  Cart.swift
//  Food Ordering
//
//  Created by Shultan Alif on 04/03/21.
//

import SwiftUI

struct Cart: Identifiable {
    var id = UUID().uuidString
    var item: Item
    var quantity: Int
}
