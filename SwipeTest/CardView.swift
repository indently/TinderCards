//
//  CardView.swift
//  SwipeTest
//
//  Created by Federico on 06/02/2022.
//

import SwiftUI

struct CardView: View {
    @State var offset = CGSize.zero
    var person: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 320, height: 420)
                .cornerRadius(20)
                .foregroundColor(.white)
                .shadow(radius: 4)
            
            Text(person)
                .bold()
            
        }
        .offset(x: offset.width * 1, y: offset.height * 0.4)
        .rotationEffect(.degrees(Double(offset.width / 60)))
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { _ in
                    if offset.width > 150 {
                        print("Approved")
                        withAnimation {
                            offset = CGSize(width: 500, height: 0)
                        }
                        
                    } else if offset.width < -150 {
                        print("Rejected")
                        withAnimation {
                            offset = CGSize(width: -500, height: 0)
                        }
                    } else {
                        withAnimation {
                            offset = .zero
                        }
                    }
                }
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: "Mario")
    }
}
