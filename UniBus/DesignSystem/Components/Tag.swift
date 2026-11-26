//
//  TagView.swift
//  UniBus
//
//  Created by Super Charge 1 on 26/11/26.
//

import SwiftUI

enum TagType
{
    case primary;
    case secondary;
    case accent;
    case success;
    case danger;
}

struct Tag: View
{
    private let text: String;
    private let type: TagType;
    
    private var backgroundColor: Color
    {
        switch(self.type)
        {
        case .primary:
            return AppColor.primary;
        case .secondary:
            return AppColor.primaryTint;
        case .accent:
            return AppColor.warningTint;
        case .success:
            return AppColor.successTint;
        case .danger:
            return AppColor.dangerTint;
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
        case .accent:
            return AppColor.warning;
        case .success:
            return AppColor.success;
        case .danger:
            return AppColor.danger;
        }
    }
    
    init(text: String, type: TagType = .primary)
    {
        self.text = text;
        self.type = type;
    }
    
    var body: some View
    {
        Text(self.text)
            .font(AppFont.captionStrong)
            .foregroundStyle(self.foregroundColor)
            .padding(.vertical, Spacing.xs)
            .padding(.horizontal, Spacing.md)
            .background(self.backgroundColor)
            .cornerRadius(Radius.xl);
    }
}

#Preview
{
    Tag(text: "On the way", type: .primary);
}
