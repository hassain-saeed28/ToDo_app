//
//  AddTaskView.swift
//  todo_app
//
//  Created by Ahmed Almohammed on 18/04/2022.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss

    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Spacer()
            Text("Create a new task")
                .foregroundColor(.white)
            .font(.title3).bold()
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here", text: $title)
                .frame(height: 50)
                .textFieldStyle(AddTaskStyle())
                .background()
                .cornerRadius(20)
            
            Spacer()
            Spacer()
            
            Button{
                if title != ""{
                    realmManager.addTask(taskTitle: title)
                    realmManager.getTask()
                }
                dismiss()
            } label: {
                Text("Add Task")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .background(Color("button_color"))
                    .cornerRadius(30)
            }
            
            Spacer()
            
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color("background_color"))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}

// MARK: TextFieldStyle

struct AddTaskStyle: TextFieldStyle{
    public func _body(configuration: TextField<Self._Label>) -> some View{
        
        configuration
            .padding(.horizontal)
            .font(.subheadline)
        
    }
}
