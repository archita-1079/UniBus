import SwiftUI

struct CTextField: View {
    
    private let title: String;
    private let placeholder: String;
    private let isSecure: Bool;
    
    @Binding
    private var text: String;
    
    private let icon: String?;
    
    @FocusState
    private var isFocused: Bool;
    
    @ViewBuilder
    private var field: some View
    {
        if self.isSecure
        {
            SecureField(self.placeholder, text: self.$text);
        }
        else
        {
            TextField(self.placeholder, text: self.$text);
        }
    }
    
    init(
        title: String,
        placeholder: String,
        isSecure: Bool,
        text: Binding<String>,
        icon: String? = nil
    ) {
        self.title = title;
        self.placeholder = placeholder;
        self.isSecure = isSecure;
        self._text = text;
        self.icon = icon;
    }
    
    var body: some View
    {
        VStack
        {
            Text(self.title)
                .foregroundStyle(AppColor.textSecondary)
                .font(AppFont.captionStrong)
                .frame(maxWidth: .infinity, alignment: .leading);
            
            HStack(spacing: Spacing.md)
            {
                if let icon = self.icon
                {
                    Image(systemName: icon)
                        .foregroundStyle(AppColor.textSecondary)
                        .font(AppFont.body)
                        .aspectRatio(1, contentMode: .fit)
                }
                
                self.field
                    .font(AppFont.body)
                    .keyboardType(.default)
                    .autocorrectionDisabled()
                    .focused(self.$isFocused);
            }
            .padding(Spacing.lg)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.lg)
                    .stroke(
                        self.isFocused ? AppColor.primary : AppColor.border,
                        lineWidth: CGFloat(self.isFocused ? 2 : 1)
                    )
            )
            .background(self.isFocused ? .clear : AppColor.background)
            .cornerRadius(Radius.lg)
            .animation(.easeInOut(duration: 0.25), value: self.isFocused);
        }
    }
}

#Preview {
    @Previewable
    @State
    var name = "Ramesh";
    
    CTextField(
        title: "Name",
        placeholder: "Enter your name",
        isSecure: false,
        text: $name,
        icon: "person"
    );
}
