import SwiftUI

struct ToDOCustomCellView: View {
    @StateObject var viewmodel = TodoListitemviewModel()
    let item: ToDo
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.task)
                    .font(.title)
                Text(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Button {
                viewmodel.toggle(item: item)
                // Action when the button is tapped
            } label: {
                Image(systemName: item.isdone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct ToDOCustomCellView_Previews: PreviewProvider {
    static var previews: some View {
        let todo = ToDo(id: "1", task: "Sample Task", dueDate: Date().timeIntervalSince1970, currentDate: Date().timeIntervalSince1970, isdone: false)
        ToDOCustomCellView(item: todo)
    }
}
