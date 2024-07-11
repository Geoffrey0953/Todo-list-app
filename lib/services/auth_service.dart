import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/home_screen.dart';
import 'package:todo_list_app/screens/login_screen.dart';

class AuthService {
  // Handle Authentication
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  // Sign Out
  signOut() {
    FirebaseAuth.instance.signOut();
  }

  // Sign In
  signIn({required String email, required String password}) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      print(e);
    });
  }

  // Sign Up
  signUp({required String email, required String password}) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError((e) {
      print(e);
    });
  }
}
