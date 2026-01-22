import 'package:flutter/material.dart';
import 'todo_model.dart';
import 'todo_item.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';
import 'todo_filter.dart';

class TodoPage extends StatefulWidget{
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final _controller = TextEditingController();
  TodoPriority priority = TodoPriority.Normal;
  TodoCategory selectedCategory = TodoCategory.General;


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TodoProvider>().loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<TodoProvider>(
          builder: (context,provider,child) {
            return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(heroTag:"btn_add",
                  onPressed: (){addTodo();},backgroundColor: Colors.greenAccent, child: Icon(Icons.add),),
                provider.todos.any((todo) => todo.completed)?
                FloatingActionButton(heroTag: "btn_clear",
                  onPressed: () {
                    provider.deleteCompleted();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Completed tasks deleted!'),
                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  backgroundColor: Colors.redAccent, child: Icon(Icons.delete_forever),)
                    :SizedBox(),
              ],
            );
          }
        ),
      ),
      appBar: AppBar(title: Text('My Task List'),backgroundColor: Colors.greenAccent,),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              TodoFilter(),
              const Divider(height: 1,),
              Expanded(child: provider.todos.isNotEmpty?
              ListView.builder(
                itemCount: provider.todos.length,
                itemBuilder: (context, index) {
                  final todo = provider.todos[index];
                  return TodoItem(
                    todo: todo,
                    onChanged: (value) {
                      provider.toggleTodoStatus(index, value);
                    },
                  );
                },
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.search_off, size: 60, color: Colors.grey),
                    const SizedBox(height: 10),
                    Text(provider.filter == null ? 'You have no assignments!' : 'No tasks found.',
                      style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic, color: Colors.grey),),
                  ],
                ),
              )
              )
          ],
          );
        },
      ),
    );
  }

  void addTodo(){
    selectedCategory = TodoCategory.General;
    priority = TodoPriority.Normal;
    showModalBottomSheet(context: context,isScrollControlled: true, builder: (context) =>
        StatefulBuilder(builder: (context,setBuilderState) => Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(children:[
            TextField(controller: _controller,
                decoration: InputDecoration(hintText: 'What to do?',labelText: 'New Task',prefixIcon: Icon(Icons.search,color: Colors.green),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)
                    )
                )
            ),
              SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Select priority: ',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
            ),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Radio<TodoPriority>(value: TodoPriority.Low, groupValue: priority, onChanged: (value){setBuilderState(() {priority = value!;});},),Text(TodoPriority.Low.name),
                  Radio<TodoPriority>(value: TodoPriority.Normal, groupValue: priority, onChanged: (value){setBuilderState(() {priority = value!;});},),Text(TodoPriority.Normal.name),
                  Radio<TodoPriority>(value: TodoPriority.High, groupValue: priority, onChanged: (value){setBuilderState(() {priority = value!;});},),Text(TodoPriority.High.name)
              ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.folder_open, color: Colors.grey),
                    SizedBox(width: 10),
                    Text("Category: ", style: TextStyle(fontSize: 16)),
                    SizedBox(width: 10),
                    DropdownButton<TodoCategory>(
                      value: selectedCategory,
                      underline: Container(height: 2, color: Colors.greenAccent),
                      onChanged: (TodoCategory? newValue) {
                        setBuilderState(() {
                          selectedCategory = newValue!;
                        });
                      },
                      items: TodoCategory.values.map((TodoCategory category) {
                        return DropdownMenuItem<TodoCategory>(value: category, child: Text(category.name),);
                      }
                      ).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: _save,style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0))), child: Text('SAVE',style: TextStyle(fontSize: 20,color: Colors.black45),),)
            ],
                ),
          ),
        )
    );
  }

  void _save() {
    if(_controller.text.isEmpty){
      showMessage(context,'Input must not be empty.');
      return;
    }

    final todo = MyTodo(id: DateTime.now().millisecondsSinceEpoch, name: _controller.text, priority: priority,timestamp: DateTime.now(),category: selectedCategory);
    context.read<TodoProvider>().addTodo(todo);
    _controller.clear();
    setState(() {});
    Navigator.pop(context);

  }

  void showMessage(BuildContext context, String s) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title:Row(
        children: [
          Icon(Icons.dangerous_rounded,color: Colors.red,),
          SizedBox(width: 4,),
          Text('Caution',style: TextStyle(color: Colors.red),),
        ],
      ),
      content: Text(s,textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      actions: [
      TextButton(onPressed: () => Navigator.pop(context), child: Text('CLOSE'))
    ],
    )
    );
  }

}





