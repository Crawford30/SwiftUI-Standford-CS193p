//
//  ContentView.swift
//  Memorize
//
//  Created by Joel Crawford on 3/2/22.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🚃","🚁","🏡","🚕", "🎰","🎲","🚎","🧩","🏎", "🚞" ,"🚆","🚧","🪤","🪛", "⚙️" ,"🛋","📦","📋","📕", "🔗"  ]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                    
                    
                    //            CardView(content: emojis[0])
                    //            CardView(content: emojis[1])
                    //            CardView(content: emojis[2])
                    //            CardView(content: emojis[3])
                    //            CardView(content: emojis[4])
                    
                }
            }.foregroundColor(.red)
            
            // Spacer()
            
            HStack{
                remove
                Spacer()
                add
                
            }.padding(.horizontal).font(.largeTitle)
            
            
        }.padding(.horizontal)
        
    }
    
    
    var remove: some View {
        
        Button( action: {
            if emojiCount > 1 {
                emojiCount -= 1
                
            }
            
            
        }, label: {
            Image(systemName: "minus.circle")
        })
        
    }
    
    var add: some View {
        Button( action: {
            if emojiCount < emojis.count{
                emojiCount += 1
                
            }
            
            
        }, label: {
            Image(systemName: "plus.circle")
        })
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
                shape.strokeBorder(lineWidth: 3)
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
