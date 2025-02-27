//
//  PlantingSeedView.swift
//  ios-MC1-DDD-project
//
//  Created by kimhyeongmin on 2022/04/10.
//

import SwiftUI

struct PlantingSeedView: View {
    
    @State var seedCard: SeedCard
    @State var viewTranseform = false
    @State private var moving = -80
    @State var bool: Bool = false
    
    var body: some View {
        
        NavigationView {
            ZStack {
                Rectangle()
                    .foregroundColor(Color(seedCard.seedColor))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("SeedBackImage")
                        .renderingMode(.template)
                        .foregroundColor(Color("Color"))
                        .offset(x: 0, y: -10)
                }
                .frame(alignment: .top)
                .scaleEffect(1.05)
                .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Blur(seedCard: seedCard)
                            .padding(.bottom, 500)
                    }
                }
                
                VStack {
                    Spacer()
                    
                    ZStack{
                        Image(seedCard.seedShape)
                            .renderingMode(.template)
                            .foregroundColor(Color(seedCard.seedColor))
                            .scaleEffect(1.8)
        //                            .offset(x: 0, y: -260)

                        Image(seedCard.seedFace)
                            .renderingMode(.template)
                            .foregroundColor(Color("darkcolor"))
                            .offset(x: 0, y: 3)

                    }
                    .frame(width: 100, height: 100, alignment: .center)
                    .offset(y: CGFloat(moving))
                    .scaleEffect(1.3)
                    .onAppear(){
                        if(!bool) {
                            bool.toggle()
                            print("onAppear")
                            DispatchQueue.main.asyncAfter(deadline: .now()){
                                withAnimation(.spring(response:  1, dampingFraction: 0.7, blendDuration: 0).delay(0.5)){ moving = 70 }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .fullScreenCover(isPresented: $viewTranseform) {
                    MainPageView()
                }
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                self.viewTranseform = true
            }
//            withAnimation(.spring(response:  1, dampingFraction: 0.7, blendDuration: 0).delay(0.5)){ moving = 70 }
        })
    }
    
    struct Blur: View {
        let seedCard: SeedCard
        let characters = Array("너의 씨앗은 멋진 나무가 될거야")
        @State var blurValue: Double = 10
        @State var opacity: Double = 0
        
        var body: some View {
            
            VStack {
                HStack(spacing: 1){
                    ForEach(0..<17) { num in
                        Text(String(self.characters[num]))
                            .font(.system(size: 25))
                            .foregroundColor(Color.white)
                            .bold()
                            .blur(radius: blurValue)
                            .opacity(opacity)
                            .animation(.easeInOut.delay( Double(num) * 0.05 ),
                                       value: blurValue)
                    }
                }.onTapGesture {
                    if blurValue == 0 {
                        blurValue = 10
                        opacity = 0.01
                    } else {
                        blurValue = 0
                        opacity = 1
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if blurValue == 0{
                            blurValue = 10
                            opacity = 0.01
                        }
                        else {
                            blurValue = 0
                            opacity = 1
                        }
                    }
                    
                }
                
                Text("")
                
                Text(seedCard.seedCreatedDate, formatter: SeedCard.dateFormat)
                    .font(.system(size: 20))
                    .foregroundColor(Color(seedCard.seedColor))
                    .bold()
                    .blur(radius: blurValue)
                    .opacity(opacity)
                    .animation(.easeInOut.delay(1),
                               value: blurValue)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {}
                    }
                }
            
            // Reference from :
            // https://github.com/chitomo12/SwiftUI-Text-Animation-Library?ref=iosexample.com#blur
        }
        
    }
    
}


struct PlantingSeedView_Preview: PreviewProvider {
    static var previews: some View {
        PlantingSeedView(seedCard: .sampleSeedCard1)
    }
}

