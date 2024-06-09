import 'package:flutter/material.dart';
import 'package:hingorja_buisness/chemistry/chemistry.dart';
import 'package:hingorja_buisness/physics/physics.dart';
import 'package:hingorja_buisness/screens/Welcome%20Screen.dart';
import 'screens/loginscreen.dart';
import 'package:hingorja_buisness/screens/Registrationscreen.dart';
import "package:firebase_core/firebase_core.dart";
import "components/constants.dart";
import 'package:flutter/foundation.dart' show kIsWeb;
import 'screens/mainpage.dart';
import 'sections/biology.dart';
import 'dart:ui';
import 'sections/biology.result.dart';
import 'dart:typed_data';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: Constants.apiKey,
        appId: Constants.appId,
        messagingSenderId: Constants.messagingSenderId,
        projectId: Constants.projectId,
      ),
    );
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      // Handle platform-level errors here
      print('Platform error: $error');
      print('Stack trace: $stack');
      return true; // Return true to indicate the error was handled
    };
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Mainpage.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        Mainpage.id: (context) => Mainpage(),
        Biology.id: (context) => Biology(),
        Physics.id: (context) => Physics(),
        Chemistry.id: (context) => Chemistry(),
      },
    );
  }
}
