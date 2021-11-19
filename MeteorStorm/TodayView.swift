//
//  ContentView.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 13/11/21.
//
//  Manca il check della data per capire se c'è bisogno di una nuova emoji

import SwiftUI

//MARK: TodayView

struct TodayView: View {
    
    @State private var showCheckInView = false
    //boolean var shared with CheckInView to create a modal view
    
    @State var quote: String = "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. "
    
    @State var quoteArtist: String = "John Doe"
    
    @State var emotionSelected: Int = 0
    
    @State var doneCheck = false
    
    let emotionList: [notTappableEmoji] = [
        notTappableEmoji(emoji: Image(""), color: .white),
        notTappableEmoji(emoji: Image("festa"), color: Color(.systemGreen)),
        notTappableEmoji(emoji: Image("innamorato"), color: Color(.systemOrange)),
        notTappableEmoji(emoji: Image("felice"), color: Color(.systemPurple)),
        notTappableEmoji(emoji: Image("sonno"), color: Color(.systemTeal).opacity(0.75)),
        notTappableEmoji(emoji: Image("neutro"), color: Color(.systemYellow)),
        notTappableEmoji(emoji: Image("rabbia"), color: Color(.systemRed)),
        notTappableEmoji(emoji: Image("triste"), color: Color(.systemBlue)),
        notTappableEmoji(emoji: Image("paura"), color: Color(.systemBrown)),


    ]
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text(doneCheck ? "Your daily feeling is:" : "How do you feel today?")
                        .font(.system(size: 48, weight: .bold, design: .default))
                        .foregroundColor(Color(.systemGray))
                        .padding(.horizontal)
                    //The attributes below are used to scale the size on iphone 8
                        .minimumScaleFactor((UIScreen.main.bounds.size.width > 375) ? 1 : 0.1)
                        .lineLimit((UIScreen.main.bounds.size.width > 375) ? 2 : 1)
                }//HStack
                .frame(maxWidth: .infinity, alignment: .leading)
                //In order to be more adaptive we pick the width from the screen we are using
                
                //In the Zstack we have 2 HStack one with circles background and one with the emojis both with spacer in order to adapt to each screen size
                
                ZStack{
                    HStack{
                        Spacer()
                        
                        CircleEmoji(emoji: Image("rabbia"), emotionIndex: 6, color: Color(.systemRed), emotionSelected: $emotionSelected, showCheckInView: $showCheckInView)
                        
                        Spacer()
                        
                        CircleEmoji(emoji: Image("festa"), emotionIndex: 1, color: Color(.systemGreen), emotionSelected: $emotionSelected, showCheckInView: $showCheckInView)
                        
                        Spacer()
                        
                        CircleEmoji(emoji: Image("neutro"),emotionIndex: 5, color: Color(.systemYellow), emotionSelected: $emotionSelected, showCheckInView: $showCheckInView)
                        
                        
                        Spacer()
                        
                        CircleEmoji(emoji: Image("triste"), emotionIndex: 7, color: Color(.systemBlue).opacity(0.75), emotionSelected: $emotionSelected, showCheckInView: $showCheckInView)
                        
                        Spacer()
                    }
                    .opacity(doneCheck ? 0 : 1)// Hstack circles
                    
                    emotionList[emotionSelected]
                        .opacity(doneCheck ? 1 : 0)
                }
                
                //MARK: Check-in Button
                
                HStack{
                    Button(action: {
                        self.showCheckInView.toggle()
                    }, label: {
                        Text(doneCheck ? "Redo" : "Check-in")
                            .font(.system(size: 17, weight: .semibold, design: .default))
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color(.systemIndigo))
                            .cornerRadius(14)
                            .padding(.horizontal)
                    }
                    )
                        .sheet(isPresented: $showCheckInView){
                            CheckInView(showCheckInView: $showCheckInView, emotionSelected: $emotionSelected, doneCheck: $doneCheck)
                            //when showCheckInView is true the view is presented, $ to bind the value from and to another view
                        }
                }//HStack Check-in
                
                
                HStack{
                    Text("Daily quote")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(Color(.systemGray))
                        .padding()
                }//HStack
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("\(Image(systemName: "quote.opening"))")
                        .padding(.leading)
                    
                    
                    HStack{
                        Text("\(quote)")
                            .font(.system(size: 17, weight: .regular, design: .default))
                    }//Hstack of quote, 3 padding in order to centre it
                    .padding(.horizontal)
                    .padding(.horizontal)
                    .padding(.horizontal)
                    
                    HStack{
                        VStack(alignment: .trailing){
                            Text("\(Image(systemName: "quote.closing"))")
                            
                            Text("- \(quoteArtist)")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .italic()
                                .padding(.trailing)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding(.trailing)
                    }//Hstack Closing quote + artist
                    
                    
                }//VStack daily quote
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(Color(.systemGray6))
                .cornerRadius(32)
                .padding(.horizontal)
                
                //                Spacer()
                
                
            }//Vstack
            .navigationTitle("Today")
            .padding(.bottom) //Add to prevent overlay with tabBar
            .toolbar{
                
                Button{
                    //Place the action that the button performs
                } label: {
                    Image(systemName: "gearshape")
                        .foregroundColor(Color(.systemIndigo))
                }
                
            }//Toolbar
            
        }//Navigation View
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TodayView()
                .preferredColorScheme(.light)
            TodayView()
                .preferredColorScheme(.dark)
        }
    }
}
