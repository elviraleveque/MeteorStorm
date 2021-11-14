//
//  ContentView.swift
//  MeteorStorm
//
//  Created by Vincenzo Pascarella on 13/11/21.
//

import SwiftUI

//MARK: ContentView

struct ContentView: View {
    
    @State var quote: String = "Lorem ipsum dolor sit amet, consectetur adipisci elit, sed do eiusmod tempor incidunt ut labore et dolore magna aliqua. "
    
    @State var quoteArtist: String = "John Doe"
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("How do you feel today?")
                        .font(.system(size: 48, weight: .bold, design: .default))
                        .foregroundColor(Color(.systemGray))
                        .padding(.leading)
//                        .minimumScaleFactor(0.01)//Added to scale on screens like iphone 8
//                        .lineLimit(1)
                }//HStack
                .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
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
                
                HStack{
                    Button{
                    } label: {
                        Text("Check-in")
                            .font(.system(size: 17, weight: .semibold, design: .default))
                    }
                }//HStack Check-in
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.size.width - 32)
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
                .frame(width: UIScreen.main.bounds.size.width, alignment: .leading)
                                
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
//                    .minimumScaleFactor(0.5)//Added to scale on screens like iphone 8
                    
                    HStack{
                        VStack(alignment: .trailing){
                            Text("\(Image(systemName: "quote.closing"))")
                            
                            Text("- \(quoteArtist)")
                                .font(.system(size: 14, weight: .regular, design: .default))
                                .italic()
                                .padding(.trailing)
//                                .minimumScaleFactor(0.5) //Added to scale on screens like iphone 8

                        }
                        .frame(width: UIScreen.main.bounds.size.width - 32, alignment: .trailing)
                        .padding(.trailing)
                    }//Hstack Closing quote + artist
                    
                    
                }//VStack daily quote
                .frame(width: UIScreen.main.bounds.size.width - 32)
                .padding(.vertical)
                .background(Color(.systemGray6))
                .cornerRadius(32)
                
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

//MARK: TabBar View

struct TabBar: View{
    var body: some View{
        TabView{
            ContentView()
                .tabItem{
                    Label("Today", systemImage: "sun.max")
                }
            
            Text("Calendar")
                .tabItem{
                    Label("Calendar", systemImage: "calendar")
                }
            
            Text("Training")
                .tabItem{
                    Label("Training", systemImage: "brain")
                }

        }
        //This is the color of the labels in the tabBar
        .accentColor(Color(.systemIndigo))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
                .preferredColorScheme(.light)
        }
    }
}
