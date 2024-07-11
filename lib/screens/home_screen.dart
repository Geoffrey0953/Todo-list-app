import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list_app/screens/add_todo_screen.dart';
import 'package:todo_list_app/services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO List'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              AuthService().signOut();
            },
          )
        ],
      ),
      body: StreamBuilder(
        stream: _firestore.collection('todos').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final todos = snapshot.data!.docs;

          List<Widget> todoWidgets = [];
          for (var todo in todos) {
            final todoTitle = todo['title'];
            final todoDescription = todo['description'];

            final todoWidget = ListTile(
              title: Text(todoTitle),
              subtitle: Text(todoDescription),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _firestore.collection('todos').doc(todo.id).delete();
                },
              ),
            );

            todoWidgets.add(todoWidget);
          }

          return ListView(
            children: todoWidgets,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
