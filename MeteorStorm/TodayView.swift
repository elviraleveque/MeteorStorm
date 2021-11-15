//
//  ContentView.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 13/11/21.
//

import SwiftUI

//MARK: TodayView

struct TodayView: View {
    
    @State var quote: String = "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. "
    
    @State var quoteArtist: String = "John Doe"
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("How do you feel today?")
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
                        Circle()
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                            .foregroundColor(Color(.systemRed))
                        
                        Spacer()
                        Circle()
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                            .foregroundColor(Color(.systemGreen))
                        
                        Spacer()
                        Circle()
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                            .foregroundColor(Color(.systemYellow))
                        
                        Spacer()
                        Circle()
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                            .foregroundColor(Color(.systemTeal))
                        Spacer()
                        
                    } // Hstack circles
                    
                    HStack{
                        Spacer()
                        Text("🤬")
                            .font(.system(size: 50))
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                        
                        Spacer()
                        Text("🥳")
                            .font(.system(size: 50))
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                        
                        Spacer()
                        Text("😐")
                            .font(.system(size: 50))
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                        
                        Spacer()
                        Text("😢")
                            .font(.system(size: 50))
                            .frame(width: 76, height: 76)
                            .padding(.bottom)
                        Spacer()
                    }// Hstack Emoji
                }// Zstack emotions
                
                //MARK: Check-in Button
                
                HStack{
                    Button{
                    } label: {
                        Text("Check-in")
                            .font(.system(size: 17, weight: .semibold, design: .default))
                    }
                }//HStack Check-in
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(Color(.systemIndigo))
                .cornerRadius(14)
                .padding(.horizontal)
                
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
        }
    }
}
