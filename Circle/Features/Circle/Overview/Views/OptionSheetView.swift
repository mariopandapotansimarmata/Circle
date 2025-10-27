//
//  OptionSheetView.swift
//  Circle
//
//  Created by Mario Pandapotan Simarmata on 26/10/25.
//

import SwiftUI

struct OptionSheetView: View {
    @Binding var isShowSheet: Bool
    
    var body: some View {
        VStack (spacing: 33){
            Divider()
                .frame(width: 57.5)
                .frame(height: 3)
                .background(.black)
            
            VStack{
                VStack (spacing: 16){
                    Text("Unfollow")
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .padding(.top, 16)
                        .onTapGesture {
                            // action
                        }
                    
                    Divider()
                        .padding(.horizontal, 16)
                    
                    Text("Share this circle")
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .onTapGesture {
                            // action
                        }
                    
                    Divider()
                        .padding(.horizontal, 16)
                    
                    Text("Block")
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .onTapGesture {
                            // action
                        }
                    
                    Divider()
                        .padding(.horizontal, 16)
                    
                    Text("Report")
                        .foregroundStyle(.red)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .onTapGesture {
                            // action
                        }
                    
                    Divider().padding(.horizontal, 16)
                        .foregroundStyle(.red)
                    
                    Text("Leave circle")
                        .foregroundStyle(.red)
                        .padding(.bottom, 16)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .onTapGesture {
                            // action
                        }
                }
                .font(.custom(DesignFonts.InterMedium, size: 12))
                .frame(maxWidth: .infinity)
                .background(.white)
                .overlay {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                }
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .circular))
                
                Spacer()
                
                Button {
                    isShowSheet = false
                } label: {
                    Text("Cencel")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 54)
                        .background(Color.black)
                        .cornerRadius(12)
                }
            }
            .padding(.horizontal, 20)
            .presentationDetents([.height(355), .medium])
            .presentationDragIndicator(.hidden)
            .presentationBackground(LinearGradient(colors: [Color(DesignColors.sheetBackground2),Color(DesignColors.sheetBackground1)], startPoint: .top, endPoint: .bottom))
        }
    }
}

#Preview {
    OptionSheetView(isShowSheet: .constant(false))
}
