import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TodoListPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do list')
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Add a task',
                      border: OutlineInputBorder(),
                    ),
                  )
                ),
                const SizedBox(width: 8,),
                ElevatedButton(
                  onPressed: addTask,
                  child: const Text('Add'),
                )
              ]
            )
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('tasks').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final tasks = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    var task = tasks[index];
                    return ListTile(
                      title: Text(task['title']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => deleteTask(task.id),
                      ),
                    );
                  },
                );
              },
            )
          )
        ]
      ),
    );
  }

  void addTask() {
    if (controller.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('task').add({
        'title': controller.text,
      });
      controller.clear();
    }
  }

  void deleteTask(String id) {
    FirebaseFirestore.instance.collection('task').doc(id).delete();
  }
}

