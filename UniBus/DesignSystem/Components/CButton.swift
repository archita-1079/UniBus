//
//  CButton.swift
//  UniBus
//
//  Created by Super Charge 1 on 25/11/26.
//

import SwiftUI

enum CButtonType
{
    case primary;
    case secondary;
    case destructive;
    case accent;
    case text;
}

struct CButton: View
{
    private let text: String;
    private let type: CButtonType;
    private let action: () -> Void;
    private let icon: String?;
    
    @State
    private var isLoading: Bool = false;
    
    init(
        text: String,
        type: CButtonType,
        action: @escaping () -> Void,
        icon: String? = nil
    ) {
        self.text = text;
        self.type = type;
        self.action = action;
        self.icon = icon;
    }
    
    private var backgroundColor: Color
    {
        switch(self.type)
        {
        case .primary:
            return AppColor.primary;
        case .secondary:
            return AppColor.primaryTint;
        case .destructive:
            return AppColor.dangerTint;
        case .accent:
            return AppColor.accent;
        case .text:
            return Color.clear;
        }
    }
    
    private var foregroundColor: Color
    {
        switch(self.type)
        {
        case .primary:
            return AppColor.surface;
        case .secondary:
            return AppColor.primary;
        case .destructive:
            return AppColor.danger;
        case .accent:
            return AppColor.navy;
        case .text:
            return AppColor.primary;
        }
    }
    
    var body: some View
    {
        Button
        {
            self.isLoading = true;
            
            /// Perform the Button action
            self.action();
            
            self.isLoading = false;
        } label: {
            HStack
            {
                if self.isLoading
                {
                    ProgressView();
                }
                else
                {
                    if let icon = self.icon
                    {
                        Image(systemName: icon);
                    }
                    Text(self.text)
                        .font(AppFont.headline);
                }
            }
            .disabled(self.isLoading)
            .tint(AppColor.surface)
            .padding(Spacing.lg)
            .frame(maxWidth: .infinity)
            .foregroundStyle(self.foregroundColor)
            .background(self.backgroundColor)
            .cornerRadius(Radius.lg);
        }
    }
}

#Preview {
    CButton(text: "Continue", type: .secondary, action: {() -> Void in print("Hello")}, icon: nil );
}
