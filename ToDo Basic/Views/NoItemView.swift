//
//  NoItemView.swift
//  ToDo Basic
//
//  Created by Golyakovph on 23.04.2023.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    let secondatyAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView() {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person? I think you should click the add button and add a bunch of itrms to your todo list!")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView()) {
                    Text("Add note 🍀")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? secondatyAccentColor : Color.accentColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(color: animate ? secondatyAccentColor : Color.accentColor,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 50 : 30)
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NoItemView()
                .navigationTitle("NoItem")
        }
    }
}
