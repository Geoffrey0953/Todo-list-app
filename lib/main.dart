import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_list_app/screens/home_screen.dart';
import 'package:todo_list_app/screens/login_screen.dart';
import 'package:todo_list_app/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyByWdHziCcf6m2Y00eR7bxQPP89t6dgYyE",
      authDomain: "todolistapp-a73f7.firebaseapp.com",
      projectId: "todolistapp-a73f7",
      storageBucket: "todolistapp-a73f7.appspot.com",
      messagingSenderId: "212249574640",
      appId: "1:212249574640:web:2065278e15c998b5061635",
      measurementId: "G-HHH1QXM9Z7",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().handleAuth(),
    );
  }
}
