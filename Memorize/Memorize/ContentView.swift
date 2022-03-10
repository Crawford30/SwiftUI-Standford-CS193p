//
//  ContentView.swift
//  Memorize
//
//  Created by Joel Crawford on 3/2/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚃","🚁","🏡","🚕", "🎰" ]
    var body: some View {
        HStack{
            
            ForEach(emojis, id: \.self) { emoji in
                CardView(content: emoji)
            }
//            CardView(content: emojis[0])
//            CardView(content: emojis[1])
//            CardView(content: emojis[2])
//            CardView(content: emojis[3])
//            CardView(content: emojis[4])
            
        }
        .padding(.horizontal)
        .foregroundColor(.red)
    }
}







struct CardView: View {
    var content:  String
    @State var isFaceUp:Bool = true
    //    var isFaceUp:Bool = false
    //    var isFaceUp: Bool {
    //        return false
    //    }
    var body: some View{
        ZStack(content: {
            let shape =  RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
                
            } else{
                shape.fill()
                
            }
            
        }).onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
        ContentView().preferredColorScheme(.light)
    }
}
