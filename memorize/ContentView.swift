//
//  ContentView.swift
//  memorize
//  Created by Adam Mescher on 11/17/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String]
    @State var emojiCount: Int

    var vehicleEmojis: [String] = ["π", "π", "π", "π", "π²", "β΅οΈ", "π", "π", "π", "π", "π", "π₯", "πΆ", "π©", "βοΈ", "π‘"]
    var flagEmojis: [String] = ["π³οΈ", "π΄","π΄ββ οΈ", "π","π©","π¦πΆ","π","π³π΅","πΊπΈ","π΄σ §σ ’σ ³σ £σ ΄σ Ώ","πΈπͺ","π±π¨","πͺπΈ","π΅π¦","π²π½","π―π΅","π­π°","π¦πΊ","π§π·","π¦π·"]
    var clockEmojis: [String] = ["π","π","π","π","π","π","π","π","π","π","π","π","π","π","π","π","π ","π‘","π’","π£","π€","π₯","π¦","π§"]
    var sportsEmojis: [String] = ["β½οΈ","π","π","βΎοΈ","π₯","πΎ","π","π","π₯","π±","πͺ","π","πΈ","π","π","π₯","π","πͺ","π₯","β³οΈ","πͺ","πΉ","π£","π€Ώ","π₯","πΉ","πΌ","π·","π₯","β·","π","πͺ","π΅"]
    
    init() {
        emojis = flagEmojis
        emojiCount = Int.random(in: 4..<vehicleEmojis.count)
    }

    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis.shuffled()[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                Spacer()
                vehicles
                Spacer()
                flags
                Spacer()
                clocks
                Spacer()
                sports
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle.fill").font(.largeTitle)
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count - 1 {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle.fill").font(.largeTitle)
        }
    }
    
    var vehicles: some View {
        Button(action: {
            emojis = vehicleEmojis.shuffled()
            emojiCount = Int.random(in: 4..<vehicleEmojis.count)
        }) {
            VStack {
                Image(systemName: "car")
                Text("vehicles").font(.caption)
            }
            
        }
    }
    var flags: some View {
        Button(action: {
            emojis = flagEmojis.shuffled()
            emojiCount = Int.random(in: 4..<flagEmojis.count)
        }) {
            VStack {
                Image(systemName: "flag.and.flag.filled.crossed")
                Text("Flags").font(.caption)
            }
        }
    }
    var clocks: some View {
        Button(action: {
            emojis = clockEmojis.shuffled()
            emojiCount = Int.random(in: 4..<clockEmojis.count)
        }) {
            VStack {
                Image(systemName: "clock")
                Text("Clocks").font(.caption)
            }
        }
    }
    var sports: some View {
        Button(action: {
            emojis = sportsEmojis.shuffled()
            emojiCount = Int.random(in: 4..<sportsEmojis.count)
        }) {
            VStack {
                Image(systemName: "sportscourt")
                Text("Sports").font(.caption)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.landscapeLeft)
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
