//
//  MoodEntryModal.swift
//  MoodTracker
//
//  Created by Connor Walker on 30/05/2021.
//

import SwiftUI

struct MoodEntryModal: View {
    @Binding var shouldShowModal: Bool
    @State var shouldShowMore = false
    
    private let avaiableEmotions = ["Angry", "Sad", "Meh", "Happy", "Excited"]
    private let modalPadding: CGFloat = 15
    
    var body: some View {
        Spacer()
            .fullScreenCover(isPresented: $shouldShowModal, content: {
                ZStack {
                    Color.black
                        .opacity(0.15)
                        .ignoresSafeArea()
                    Group {
                        VStack(alignment: .leading) {
                            HStack {
                                Button(action: { shouldShowModal.toggle() }, label: {
                                    Image(systemName: "xmark")
                                        .opacity(0.6)
                                })
                                Spacer()
                                Text("I Am Feeling")
                                Spacer()
                                Image(systemName: "xmark")
                                    .opacity(0)
                            }
                            .padding(modalPadding)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .none, alignment: .leading)
                            .foregroundColor(.white)
                            .background(Color.accentColour)
                            
                            HStack {
                                ForEach(0..<avaiableEmotions.count) { i in
                                    Spacer()
                                    VStack {
                                        Image(systemName: "face.smiling")
                                            .redacted(reason: /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/)
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                        Text(avaiableEmotions[i])
                                            .font(.callout)
                                    }
                                    Spacer()
                                }
                            }
                            .padding(modalPadding)
                            Divider()
                            HStack {
                                Button(action: { shouldShowMore.toggle() }, label: {
                                    Text("Show \(shouldShowMore ? "Less" : "More")")
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                })
                                .padding([.leading, .trailing, .top], modalPadding / 2)
                                .padding(.bottom, modalPadding)
                                .foregroundColor(.black)
                                
                                Divider()
                                
                                Button(action: handleAddButtonClick, label: {
                                    Text("Add")
                                        .frame(minWidth: 0, maxWidth: .infinity)
                                })
                                .padding([.leading, .trailing, .top], modalPadding / 2)
                                .padding(.bottom, modalPadding)
                                .foregroundColor(.black)
                            }
                            .fixedSize(horizontal: false, vertical: true)
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .font(.callout)
                        }
                        .background(Color.white)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .none, alignment: .leading)
                        .cornerRadius(10)
                    }
                    .padding()
                }
            })
    }
    
    func handleAddButtonClick() {
        // TODO: save changes
    }
}

struct MoodEntryModal_Previews: PreviewProvider {
    @State static var shouldShowModal = true
    
    static var previews: some View {
        MoodEntryModal(shouldShowModal: $shouldShowModal)
    }
}
