//
//  ContentView.swift
//  Murmur
//
//  Created by Teo I on 12/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("logo")
                    .offset(CGSize(width: 0, height: -23))
                
                NavigationLink(destination: NewScreen(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                
                Button(action: {
                    isLoggedIn.toggle()
                }) {
                    Text("Get Started!")
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue.opacity(0.65))
                                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
                        )
                        .padding(.horizontal, 50)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct NewScreen: View {
    @State private var name: String = ""
    @State private var school: String = ""
    @State private var shouldNavigate = false
    
    var body: some View {
        VStack {
            Image("page")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .padding(.bottom, 20)
            
            Text("General Information")
                .font(Font.custom("ComicSansMS", size: 32))
                .foregroundColor(.purple)
                .padding()
                .offset(CGSize(width: 0, height: -40))
            
            TextField("Enter your name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -35))
            
            TextField("Enter your school", text: $school)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .font(.system(size: 23, weight: .semibold))
                .offset(CGSize(width: 0, height: -33))
            
            NavigationLink(destination: NextScreen(), isActive: $shouldNavigate) {
                Text("Next")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
                    .offset(CGSize(width: 0, height: -10))
                    .onTapGesture {
                        shouldNavigate = true
                    }
            }
        }
        .padding()
    }
}

struct NextScreen: View {
    @State private var numberOfTextFields = 1
    let maxNumberOfTextFields = 10
    @State private var isSubmitTapped = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("List of Crushes")
                    .font(.title)
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0..<min(numberOfTextFields, maxNumberOfTextFields), id: \.self) { index in
                        TextField("Enter name", text: .constant(""))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                Button(action: {
                    if numberOfTextFields < maxNumberOfTextFields {
                        numberOfTextFields += 1
                    }
                }) {
                    Text("Add Name")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                Spacer()
                
                NavigationLink(destination: NewPage(), isActive: $isSubmitTapped) {
                    EmptyView()
                }
                
                Button(action: {
                    isSubmitTapped = true
                }) {
                    Text("SUBMIT")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct NewPage: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .navigationBarTitle("", displayMode: .inline)
            
            VStack {
                Spacer()
                
                Text("Thank you for using MurMur!")
                    .font(.system(size: 50, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: EmptyView())
        .onAppear {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
