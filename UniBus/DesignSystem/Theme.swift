//
//  Theme.swift
//  UniBus
//
//  Created by Super Charge 1 on 23/11/26.
//

import SwiftUI

// MARK: - Color helpers
/// Extending Color initializer to convert HEX value into RGB
extension Color
{
    init(hex: UInt32, opacity: Double = 1)
    {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        );
    }
    
    /// Hex initializer for both dark and light mode colors
    /// Swift automatically selects the right color according to the user environment
    init(light: UInt32, dark: UInt32, opacity: Double = 1)
    {
        self.init(
            uiColor: UIColor{ traits in
                let hex = .dark == traits.userInterfaceStyle ? dark : light;
                
                return UIColor(
                    red: CGFloat((hex >> 16) & 0xFF) / 255,
                    green: CGFloat((hex >> 8) & 0xFF) / 255,
                    blue: CGFloat(hex & 0xFF) / 255,
                    alpha: CGFloat(opacity)
                );
            }
        );
    }
}

// MARK: - Design enums
/// Helper to build UI and UI Components
/// Colors, spacing, radius, font for the applications

enum AppColor
{
    static let primary = Color(hex: 0x2F5BFF);
    static let primaryTint = Color(hex: 0xEAF0FF);
    static let accent = Color(hex: 0xFFD43B);
    static let navy = Color(hex: 0x0F1B4D);

    static let background = Color(hex: 0xF5F7FB);
    static let surface = Color.white;
    static let border = Color(hex: 0xE5E7EB);

    static let textPrimary = Color(hex: 0x111827);
    static let textSecondary = Color(hex: 0x6B7280);

    static let success = Color(hex: 0x16A34A);
    static let successTint = Color(hex: 0xDCFCE7);
    static let warning = Color(hex: 0xB45309);
    static let warningTint = Color(hex: 0xFEF3C7);
    static let danger = Color(hex: 0xDC2626);
    static let dangerTint = Color(hex: 0xFEE2E2);
}

enum Spacing
{
    static let xs: CGFloat = 4;
    static let sm: CGFloat = 8;
    static let md: CGFloat = 12;
    static let lg: CGFloat = 16;
    static let xl: CGFloat = 24;
    static let xxl: CGFloat = 32;
}

enum Radius
{
    static let sm: CGFloat = 8;
    static let md: CGFloat = 12;
    static let lg: CGFloat = 16;
    static let xl: CGFloat = 24;
}

enum AppFont
{
    static let largeTitle = Font.system(size: 32, weight: .bold);
    static let title = Font.system(size: 26, weight: .bold);
    static let headline = Font.system(size: 17, weight: .semibold);
    static let body = Font.system(size: 15, weight: .regular);
    static let bodyStrong = Font.system(size: 15, weight: .semibold);
    static let caption = Font.system(size: 12, weight: .regular);
    static let captionStrong = Font.system(size: 12, weight: .semibold);
}
