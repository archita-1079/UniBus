//
//  StartScreen.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import SwiftUI

struct StartScreen: View
{
    
    var body: some View
    {
        VStack
        {
            ZStack(alignment: .bottomLeading){
                
                GeometryReader{
                    geometry in
                    let screenWidth = geometry.size.width
                    Color(AppColor.primary)
                        .ignoresSafeArea()
                        .overlay{
                            Circle()
                                .fill(AppColor.accent)
                                .frame(width: 380)
                                .offset(x: screenWidth / 2, y: -screenWidth )
                        }
                        .overlay{
                            Circle()
                                .fill(AppColor.primaryTint.opacity(0.2))
                                .frame(width: 240)
                                .offset(x: -screenWidth / 2, y: screenWidth / 3 )
                        }
                }
                
                VStack(alignment: .leading, spacing: Spacing.lg){
                    VStack(alignment: .leading){
                        Text("Your Campus")
                        Text("Your Bus")
                        Text("No GuessWork.")
                            .foregroundColor(AppColor.accent)
                    }
                    .font(.system(size: 44, weight: .bold))
                    .foregroundColor(AppColor.surface)
                    
                    VStack{
                        CButton(text: "Continue As Student",type: .accent, action: { () -> Void in  })
                        CButton(text: "Continue As Manager", type: .secondary, action: { () -> Void in  })
                    }
                }
                .padding(.horizontal, Spacing.xl)
            }
        }
        
        
        
    }
}

#Preview{
    StartScreen();
}
