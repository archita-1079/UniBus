//
//  ManagerSignIn.swift
//  UniBus
//
//  Created by Super Charge 1 on 26/11/26.
//

import SwiftUI

struct ManagerSignIn: View
{
    @State
    private var email = "";
    @State
    private var password = "";
    
    var body: some View
    {
        VStack(spacing: Spacing.lg)
        {
            VStack(alignment: .leading, spacing: Spacing.xs)
            {
                Text("Transport Manager")
                    .font(AppFont.largeTitle)
                    .foregroundStyle(AppColor.textPrimary);
                
                Text("Sign in with the credentials given to you.")
                    .font(AppFont.body)
                    .foregroundStyle(AppColor.textSecondary);
            }
            .frame(maxWidth: .infinity, alignment: .leading);
            
            CTextField(
                title: "Manager ID",
                placeholder: "Email",
                isSecure: false,
                text: self.$email,
                icon: "person"
            );
                
            CTextField(
                title: "Password",
                placeholder: "xYhuowl",
                isSecure: true,
                text: self.$password,
                icon: "lock"
            );
                
            Text("Forgot password?")
                .foregroundStyle(AppColor.primary)
                .font(AppFont.bodyStrong)
                .frame(maxWidth: .infinity, alignment: .leading);
            
            Spacer();
            
            HStack(spacing: Spacing.md)
            {
                Image(systemName: "lock")
                    .foregroundStyle(AppColor.primary);
                Text("No sign up. Your account belongs to one university and only shows its data.")
                    .font(AppFont.caption);
            }
            .padding(Spacing.lg)
            .background(AppColor.primaryTint)
            .foregroundStyle(AppColor.textSecondary)
            .cornerRadius(Radius.lg);
            
            CButton(
                text: "Sign in",
                type: .primary,
                action: { () -> Void in }
            );
        }
        .padding(Spacing.lg);
    }
}

#Preview
{
    ManagerSignIn();
}
