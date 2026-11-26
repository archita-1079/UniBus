//
//  CModifiers.swift
//  UniBus
//
//  Created by Super Charge 1 on 26/11/26.
//

import SwiftUI

struct CardStyle: ViewModifier
{
    var padding: CGFloat;
    var background: Color;
    var border: Color;
    
    func body(content: Content) -> some View
    {
        content
            .padding(self.padding)
            .background(
                self.background,
                in: RoundedRectangle(
                    cornerRadius: Radius.lg,
                    style: .continuous
                )
            )
            .overlay(
                RoundedRectangle(cornerRadius: Radius.lg, style: .continuous)
                    .stroke(self.border, lineWidth: 1)
            );
    }
}

extension View
{
    func cardStyle(
        padding: CGFloat = Spacing.md,
        background: Color = AppColor.surface,
        border: Color = AppColor.border
    ) -> some View {
        modifier(
            CardStyle(padding: padding, background: background, border: border)
        );
    }
}
