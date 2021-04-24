//
//  ItemView.swift
//  Food Ordering
//
//  Created by Shultan Alif on 04/03/21.
//

import SwiftUI
import SDWebImageSwiftUI
 
struct ItemView: View {
  //:Propertie
  var item: Item
  //:Body
  var body: some View {
 
    VStack{
 
      WebImage(url: URL(string: item.item_image))
        .resizable()
        .frame(width: UIScreen.main.bounds.width - 30, height: 250)
        .scaledToFill()
 
      HStack(spacing: 8){
        Text(item.item_name)
          .font(.title2)
          .fontWeight(.bold)
          .foregroundColor(.black)
 
        Spacer(minLength: 0)
 
        // Ratings view
        ForEach(1...5, id: \.self){ index in
          Image(systemName: "star.fill")
            .foregroundColor(index <= Int(item.item_ratings) ?? 0 ? Color.pink : .gray)
        }//:Rating view
      }//:HStack
 
      HStack{
        Text(item.item_details)
          .font(.caption)
          .foregroundColor(.gray)
          .lineLimit(2)
 
        Spacer(minLength: 0)
      }//HStack Item Detail
    }
  }
}
