//
//  questionDetailView.swift
//  DDD_test_1
//
//  Created by Jeon Jimin on 2022/04/11.
//

import SwiftUI

struct ReminderDetailView: View {
    @State var seedCard: SeedCard
    
    var body: some View {
        VStack(spacing:0) {
            ForEach(seedCard.seedRetrospectQuestionList, id:\.self) { question in
                Text(question)
                    .font(.system(size: 16/*, weight: .bold*/))
                    .frame(width: 300, alignment: .center)
                    .frame(minHeight: 20)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 5)
                    .minimumScaleFactor(0.2)
                    .multilineTextAlignment(.center)
                Divider()
                 .frame(width: 200, height: 1)
                 .padding(.horizontal, 30)
                 .background(Color(red: 200/255, green: 200/255, blue: 200/255))
            }
            
        }
    }
}

struct ReminderDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderDetailView(seedCard: SeedCard.sampleSeedCard2)
    }
}
