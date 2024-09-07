import 'package:flutter/material.dart';

class SimpleTodo extends StatefulWidget {
  const SimpleTodo({ super.key });

  @override
  SimpleTodoState createState() => SimpleTodoState();
}

class SimpleTodoState extends State<SimpleTodo> {
  final List<String> items = [];

  void addItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        items.add(task);
      });
    }
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void promptAddTodoItem() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();

        return AlertDialog(
          title: const Text('Add a new task'),
          content: TextField(
            controller: controller,
            autofocus: true,
            onSubmitted: (val) {
              addItem(val);
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                addItem(controller.text);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      }
    );
  }

  Widget buildItem(String task, int index) {
    return ListTile(
      title: Text(task),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          removeItem(index);
        },
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return buildItem(items[index], index);
        },
      ),floatingActionButton: FloatingActionButton(
        onPressed: promptAddTodoItem,
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}