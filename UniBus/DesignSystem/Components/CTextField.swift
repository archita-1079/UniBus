import SwiftUI

struct CTextField: View {
    
    let title: String;
    let placeholder: String;
    let isSecure: Bool;
    
    @Binding
    var text: String;
    
    let icon: String?;
    
    @FocusState
    private var isFocused: Bool;
    
    @ViewBuilder
    private var field: some View
    {
        if isSecure
        {
            SecureField(self.placeholder, text: self.$text);
        }
        else
        {
            TextField(self.placeholder, text: self.$text);
        }
    }
    
    var body: some View
    {
        VStack
        {
            Text(self.title)
                .foregroundStyle(AppColor.textSecondary)
                .font(AppFont.captionStrong)
                .frame(maxWidth: .infinity, alignment: .leading);
            
            HStack
            {
                if let icon = self.icon
                {
                    Image(systemName: icon)
                        .foregroundStyle(AppColor.textSecondary);
                }
                
                field
                    .font(AppFont.body)
                    .keyboardType(.default)
                    .autocorrectionDisabled()
                    .focused(self.$isFocused);
            }
            .padding(Spacing.lg)
            .background(self.isFocused ? .clear : AppColor.background)
            .overlay(
                RoundedRectangle(cornerRadius: Radius.lg)
                    .stroke(self.isFocused ? AppColor.primary : AppColor.border, lineWidth: CGFloat(2))
            )
            .animation(.easeInOut(duration: 0.25), value: self.isFocused);
        }
    }
}

#Preview {
    CTextField(
        title: "Name",
        placeholder: "Enter your name",
        isSecure: false,
        text: .constant("Ramesh"),
        icon: "person"
    );
}
