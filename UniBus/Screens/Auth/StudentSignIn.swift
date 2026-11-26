//
//  StudentSignIn.swift
//  UniBus
//
//  Created by Super Charge 1 on 26/11/26.
//

import SwiftUI

struct StudentSignIn: View
{
    @State
    private var email = ""
    
    var body: some View
    {
        VStack(alignment: .leading, spacing: Spacing.lg)
        {
            VStack(alignment: .leading, spacing: Spacing.xs)
            {
                Text("Student Sign In")
                    .font(AppFont.largeTitle)
                Text("Enter your college mail")
                    .font(AppFont.body)
                    .foregroundStyle(AppColor.textSecondary)
            }
            
            CTextField(title: "College Mail", placeholder: "123abc@college.ac.in", isSecure: false, text: self.$email, icon: "envelope" )
            
            HStack
            {
                Image(systemName: "checkmark")
                    .foregroundColor(AppColor.success)
                
                VStack(alignment: .leading)
                {
                    Text("University Detected")
                        .font(AppFont.caption)
                        .foregroundStyle(AppColor.textSecondary)
                        Text("Graphic Era University")
                            .font(AppFont.headline)
                }
            }
            .padding(Spacing.md)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(AppColor.successTint)
            .cornerRadius(Radius.lg)
            
            Spacer()
            
            CButton(text: "Send OTP", type: .primary, action: { () -> Void in } )
        }
        .padding(.horizontal,Spacing.lg)
        .padding(.vertical,Spacing.md)
    }
}

#Preview {
    StudentSignIn()
}
