//
//  CardEvolutionView.swift
//  selectQuestions
//
//  Created by Park Sungmin on 2022/04/11.
//

import SwiftUI

struct CardEvolutionView: View {
    @State var seedCard: SeedCard
    @State var notRetroSpectingCard: Bool = false
    @State var evolveBtn: Bool = false
    @State var isFront: Bool = false
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor").edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center) {
//                    Text("카드를 만든 날을 돌아보면\n씨앗이 진화할거야")
                    Text("Reflect on the past to help \nyour seed grow")
                        .frame(width: 300, height: 50, alignment: .leading)
                        .padding(.top, 70)
                        .font(.system(size:20, weight: .regular))
                        .foregroundColor(Color.white)
                    
                    ZStack {
                        Button() {
                            withAnimation {
                                isFront.toggle()
                            }
                        } label: {
                            ZStack {
                                SeedCardBackView(seedCard: seedCard)
                                    .rotation3DEffect(.degrees(isFront ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                                    .opacity(isFront ? 1.0 : 0.0)
                                
                                SeedCardView(seedCard: seedCard)
                                    .rotation3DEffect(.degrees(isFront ? -180 : 0), axis: (x: 0, y: 1, z: 0))
                                    .opacity(isFront ? 0.0 : 1.0)
                            }
                        }
                        .frame(width: 300, height: 500, alignment: .center)
                        .padding(30)
                    }
                    
                    
                    HStack {
                       
                        
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
//                            Text("나중에 하기")
                            Text("Later")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(width: 145, height: 48)
                        }
                        .frame(width: 150, height: 48)
                        .foregroundColor(.white)
                        .background(Color("Color1"))
                        .cornerRadius(40)
                        
                        Spacer()
                        
                        Button {
                            evolveBtn = true
                        } label: {
//                            Text("진화하기")
                            Text("Grow")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(width: 145, height: 48)
                            
                            NavigationLink(isActive: $evolveBtn) {
                                RetrospectMakingView(seedCard: seedCard)
                                .navigationBarHidden(true)
                                .navigationBarTitle("", displayMode:.inline)
                            } label: {}
                        }
                        .frame(width: 150, height: 48)
                        .foregroundColor(.white)
                        .background(Color("Color4"))
                        .cornerRadius(40)
                    }
                    .frame(width:315)
                    
                    
                }
                .frame(maxWidth: 300)
                .padding(.bottom, 40)
            }
            //        .background(Color(red:40/255, green: 40/255, blue: 40/255))
            .navigationBarHidden(true)
            .navigationBarTitle("", displayMode:.inline)
        }
    }
}

struct CardEvolutionView_Previews: PreviewProvider {
    static var previews: some View {
        CardEvolutionView(seedCard: SeedCard.sampleSeedCard1)
    }
}
