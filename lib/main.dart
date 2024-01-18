import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_hr_aaa/loginscreen.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options : const FirebaseOptions(
      apiKey: 'AIzaSyC1HidENekXu3JLUiIS40tKNJUR2UKxUsg',
      appId: '1:764910551841:android:a29c842e130355e5c67460',
      messagingSenderId: '764910551841',
      projectId: 'smart-hr-aaa'));
  runApp(const MyApp());
}

// void main() {
//
  // runApp(const MyApp());
 //}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const KeyboardVisibilityProvider(
        child: LoginScreen()
      ),
    );
  }
}

