//
//  TasksView.swift
//  todo_app
//
//  Created by Ahmed Almohammed on 18/04/2022.
//

import SwiftUI

struct TasksView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack{
            Text("My Tasks")
                .foregroundColor(.white)
                .font(.title).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List{
                ForEach(realmManager.tasks, id: \.id){
                    task in
                    
                    if !task.isInvalidated{
                        
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing){
                                Button(role: .destructive){
                                    realmManager.deleteTask(id: task.id)
                                }label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                            .listRowSeparator(.hidden)
                    }
                    
                }
                .listRowBackground(Color("task_color"))
            }
            .onAppear(){
                UITableView.appearance().backgroundColor = UIColor.clear

            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("background_color"))
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .previewDevice("iPhone 13 Pro Max")
            .environmentObject(RealmManager())
    }
}


// MARK: UIColor extention to define my func

extension UIColor {
    class var taskColor: UIColor {
        return UIColor(named: "task_color")!
    }
}
