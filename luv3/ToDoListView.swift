import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoViewModel()
    @State private var showingAddItemView = false
    @State private var itemToEdit: ToDoItem? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Text(item.priority.rawValue)
                            .foregroundColor(self.priorityColor(item.priority))
                            .padding(4)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(4)
                    }
                    .onTapGesture {
                        itemToEdit = item
                        showingAddItemView.toggle()
                    }
                }
                .onDelete(perform: deleteItem)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddItemView.toggle() }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddItemView) {
                AddItemView(viewModel: viewModel, itemToEdit: $itemToEdit)
            }
        }
    }
    
    private func deleteItem(at offsets: IndexSet) {
        offsets.map { viewModel.items[$0].id }.forEach(viewModel.deleteItem)
    }
    
    private func priorityColor(_ priority: Priority) -> Color {
        switch priority {
        case .high:
            return .red
        case .medium:
            return .orange
        case .low:
            return .green
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
