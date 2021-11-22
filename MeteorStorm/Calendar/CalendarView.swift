//
//  CalendarView.swift
//  MeteorStorm esercizio
//
//  Created by Vincenzo Pascarella on 14/11/21.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedYear: Int = Calendar.current.component(.year, from: Date())
    
    @State var selectedMonth: Int = Calendar.current.component(.month, from: Date()) - 1
    
    let months: [String] = Calendar.current.shortMonthSymbols
    
    
    @State var isActive: [Bool] = [false, false, false, false, false, false]
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 12.0){
                    
                    HStack{
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.primary)
                            .onTapGesture {
                                selectedYear -= 1
                            }
                            .scaleEffect(0.8)
                        
                        Text(String(selectedYear)).foregroundColor(Color.primary).font(.title)
                            .scaleEffect(0.7)
                            .transition(.move(edge: .trailing))
                            .frame(width: UIScreen.main.bounds.size.width / 6)
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.primary)
                            .onTapGesture {
                                if !(Calendar.current.component(.year, from: Date()) == selectedYear){
                                    selectedYear += 1
                                    if (Calendar.current.component(.year, from: Date()) == selectedYear) && (Calendar.current.component(.month, from: Date()) - 1 < selectedMonth){
                                        selectedMonth = Calendar.current.component(.month, from: Date()) - 1
                                    }
                                }
                            }
                            .scaleEffect(0.8)
                            .opacity((Calendar.current.component(.year, from: Date()) == selectedYear) ? 0.3 : 1)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color.primary)
                            .onTapGesture {
                                if selectedMonth > 0{
                                    selectedMonth -= 1
                                }
                                else {
                                    if Calendar.current.component(.year, from: Date()) == selectedYear{
                                        selectedMonth = Calendar.current.component(.month, from: Date()) - 1
                                    }
                                    else
                                    {
                                        selectedMonth = 11
                                    }
                                    
                                }
                            }
                            .scaleEffect(0.8)
                        
                        Text(String(months[selectedMonth])).foregroundColor(Color.primary).font(.title)
                            .scaleEffect(0.7)
                            .transition(.move(edge: .trailing))
                            .frame(width: UIScreen.main.bounds.size.width / 6)
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.primary)
                            .onTapGesture {
                                if !((Calendar.current.component(.month, from: Date()) - 1 == selectedMonth) && (Calendar.current.component(.year, from: Date()) == selectedYear)){
                                    if selectedMonth < 11 {
                                        selectedMonth += 1
                                    }
                                    else {
                                        selectedMonth = 0
                                    }
                                }
                            }
                            .scaleEffect(0.8)
                            .opacity((Calendar.current.component(.month, from: Date()) - 1 == selectedMonth) && (Calendar.current.component(.year, from: Date()) == selectedYear) ? 0.3 : 1)
                    }
                    .padding(.horizontal)
                    
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("felice"), color: Color(.systemPurple)), emoname: "Happy", days: "10", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("neutro"), color: Color(.systemYellow)), emoname: "Blank", days: "6", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("triste"), color: Color(.systemBlue)), emoname: "Sad", days: "5", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("rabbia"), color: Color(.systemRed)), emoname: "Angry", days: "3", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("paura"), color: Color(.systemBrown)), emoname: "Scared", days: "2", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                    CalendarCard(emotion: notTappableEmoji(emoji: Image("innamorato"), color: Color(.systemOrange)), emoname: "In Love", days: "2", destination: HappyView(rootIsActive: self.$isActive[0]), isActive: $isActive[0])
                    
                }
                .padding(.top)
            }
            .navigationTitle("Calendar")
            .background(Color(.systemGray6))
            
        }
        
        
        
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
