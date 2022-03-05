import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:realtime_app/screen/auth_screen.dart';
import 'package:realtime_app/screen/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'chat-app',
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBEDbWXCdX5X2KeWCmhtNtMz8Y6IJquqEs',
        appId: '1:835853711099:android:4a1fd3d49752e22392a25e',
        projectId: 'chat-app-f9ba7',
        messagingSenderId: '',
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.pink,
          accentColor: Colors.deepPurple,
          accentColorBrightness: Brightness.dark,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.pink,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          )),
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (ctx, userSnapshot) {
        if(userSnapshot.hasData) {
          return ChatScreen();
        }

        return AuthScreen();
      }),
    );
  }
}
