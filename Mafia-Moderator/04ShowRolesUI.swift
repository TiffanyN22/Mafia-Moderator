//
//  ShowRolesUI.swift
//  Mafia-Moderator
//  Description: Card Flip (with buttons for next/back) for View Roles Page to display player roles
//  Acknowledgement: Code Logic for Card Flip came from Swift Arcade (https://youtu.be/7rxaRn-XK28)
//  Created by Tiffany Nguyen on 12/13/22.
//

import SwiftUI

struct card<Front, Back>: View where Front: View, Back: View{
    var front: () -> Front
    var back: () -> Back
    
    @State var flipped: Bool = false
    @State var flashcardRotation = 0.0
    @State var contentRotation = 0.0 //so text doesn't get flipped
    
    //take in view builder content and pass into local properties
    init(@ViewBuilder front: @escaping () -> Front, @ViewBuilder back: @escaping () -> Back){
        self.front = front
        self.back = back
    }
    
    var body: some View{
        ZStack {
            if flipped {
                back()
            } else{
                front()
            }
        }
        .rotation3DEffect(.degrees(contentRotation), axis: (x: 0, y: 1, z: 0))
        .padding()
        .frame(height: 300)
        .frame(maxWidth: 200)
        .background(Color(UIColor(named: "CyanAccent")!))
        .overlay(
            Rectangle()
                .stroke(Color.black, lineWidth: 2))
        .padding()
        .onTapGesture {
            flipFlashcard()
        }
        .rotation3DEffect(.degrees(flashcardRotation), axis: (x: 0, y: 1, z: 0))
    }
    
    func flipFlashcard(){
        let animationTime = 0.5
        withAnimation(Animation.linear(duration: animationTime)){
            flashcardRotation += 180
        }
        //flip content at 90 degrees (when it's hidden from viewer)
        withAnimation(Animation.linear(duration: 0.001).delay(animationTime/2)){
            contentRotation += 180
            flipped.toggle()
        }
    }
}
    
struct ShowRolesUI: View {
    @State var curPlayerID = 0;
    @State var fontRoleColor = "Navy";
    var body: some View {
        ZStack{
            Color(UIColor(named: "Maroon")!).ignoresSafeArea()
            VStack{
                card(front: {
                    Text("View\nyour role\n \(gameSetting.playerList[curPlayerID].name)")
                        .font(Font.custom("Chalkboard SE Regular", size: 30))
                        .foregroundColor(Color(UIColor(named: "Navy")!))
                        .multilineTextAlignment(.center)


                }, back: {
                    VStack{
                        Text("You are a")
                            .font(Font.custom("Chalkboard SE Regular", size: 30))
                            .foregroundColor(Color(UIColor(named: "Navy")!))
                            .multilineTextAlignment(.center)
                            .lineLimit(0)
                        Text("\(gameSetting.playerList[curPlayerID].role)")
                            .font(Font.custom("Chalkduster", size: 32))
                            .foregroundColor(Color(UIColor(named: fontRoleColor)!))
                            .multilineTextAlignment(.center)
                            .padding([.vertical], 1)
                    }
                })
                HStack{
                    Button(action:{
                        if(curPlayerID>0){
                            curPlayerID -= 1
                            checkRoleColor()
                        }
                    }, label: {
                        Text("Back")
                            .font(Font.custom("Chalkboard SE Regular", size: 20))
                            .padding([.horizontal], 25)
                            .padding([.vertical], 7)
                            .foregroundColor(Color(UIColor(named: "Maroon")!))
                            .background(Color(UIColor(named: "GhostlyBlue")!))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                    })
                    
                    Button(action:{
                        if(curPlayerID<(gameSetting.numOfPlayers-1)){
                            curPlayerID += 1
                            checkRoleColor()
                        }
                    }, label: {
                        Text("Next")
                            .font(Font.custom("Chalkboard SE Regular", size: 20))
                            .padding([.horizontal], 25)
                            .padding([.vertical], 7)
                            .foregroundColor(Color(UIColor(named: "Maroon")!))
                            .background(Color(UIColor(named: "GhostlyBlue")!))
                            .cornerRadius(5)
                            .multilineTextAlignment(.center)
                    })
                    
                }
            }
        }
    }
    
    func checkRoleColor(){
        switch gameSetting.playerList[curPlayerID].role{
        case "Mafia":
                fontRoleColor="Maroon"
        case "Civilian":
                fontRoleColor="DarkCyan"
        default: //also nurse and detective
            fontRoleColor="Navy"
        }
    }
}

struct ShowRolesUI_Previews: PreviewProvider {
    static var previews: some View {
        ShowRolesUI()
    }
}
