//
//  CartView.swift
//  Food Ordering
//
//  Created by Shultan Alif on 16/03/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CartView: View {
  
  @ObservedObject var homeData: HomeViewModel
  @Environment(\.presentationMode) var present
  
  var body: some View {
    VStack{
      
      HStack(spacing: 20){
        
        Button(action: {present.wrappedValue.dismiss()}, label: {
          Image(systemName: "chevron.left")
            .font(.system(size: 24, weight: .heavy))
            .foregroundColor(.pink)
        })
        
        Text("My Cart")
          .font(.title)
          .fontWeight(.heavy)
          .foregroundColor(.black)
        
        Spacer()
      }
      .padding()
      
      ScrollView(.vertical, showsIndicators: false){
        LazyVStack(spacing: 0){
          ForEach(homeData.cartItems){ cart in
            
            // keranjang item
            HStack(spacing: 15){
              WebImage(url: URL(string: cart.item.item_image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 130)
                .cornerRadius(15)
              
              VStack(alignment: .leading, spacing: 30){
                Text(cart.item.item_name)
                  .fontWeight(.semibold)
                  .foregroundColor(.black)
                
                Text(cart.item.item_details)
                  .fontWeight(.semibold)
                  .foregroundColor(.gray)
                  .lineLimit(2)
                
                HStack(spacing: 15){
                  Text(homeData.getPrice(value: Float(truncating: cart.item.item_cost)))
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.gray)
                  
                  Spacer()
                  
                //Button untuk menambahkan item dan murangi item di keranjang
                  Button(action: {
                    if cart.quantity > 1{
                      homeData.cartItems[homeData.getIndex(item: cart.item, isCartIndex: true)].quantity -= 1
                    }
                  }){
                    Image(systemName: "minus")
                      .font(.system(size: 16, weight: .heavy))
                      .foregroundColor(.black)
                  }
                  
                  Text("\(cart.quantity)")
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color.black.opacity(0.06))
                  
                  Button(action: {
                    homeData.cartItems[homeData.getIndex(item: cart.item, isCartIndex: true)].quantity += 1
                  }){
                    Image(systemName: "plus")
                      .font(.system(size: 16, weight: .heavy))
                      .foregroundColor(.black)
                  }
                }
              }
            }
            .padding()
            .contextMenu{
                
              // untuk menghapus data dari keranjang
              Button(action: {
                let index = homeData.getIndex(item: cart.item, isCartIndex: true)
                let itemIndex = homeData.getIndex(item: cart.item, isCartIndex: false)
                
                homeData.items[itemIndex].isAdded = false
                homeData.filtered[itemIndex].isAdded = false
                homeData.cartItems.remove(at: index)
              }){
                Text("Remove")
              }
            }
          }
        }
      }
      
      // Buttom View
      VStack{
        HStack{
          Text("Total")
            .fontWeight(.heavy)
            .foregroundColor(.gray)
          
          Spacer()
          
          // Menghitung total harga
          Text(homeData.calculateTotalPrice())
            .font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.black)
        }
        .padding([.top, .horizontal])
        
        Button(action: homeData.updateOrder, label: {
          Text(homeData.ordered ? "Cancel Order" : "Check Out")
            .font(.title2)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(Color.pink)
            .cornerRadius(15)
        })
      }
      .background(Color.white)
    }
    .navigationBarHidden(true)
    .navigationBarBackButtonHidden(true)
  }
}
