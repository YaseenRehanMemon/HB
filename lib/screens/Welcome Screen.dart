import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/components.dart';
import 'loginscreen.dart';
import 'package:hingorja_buisness/screens/Registrationscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const id = "welcome_screen";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: const Text(
          "Welcome",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: "icon",
                      child: Expanded(
                        child: Image.asset(
                          "images/HB.png",
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            // Custom widget to display when an error occurs
                            return const Text("Image not found");
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: RoundedButton("Log In", Colors.lightBlueAccent, () {
                Navigator.pushNamed(context, LoginScreen.id);
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: RoundedButton("Register", Colors.blue, () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              }),
            ),
            Container(
              child: const Text(
                "basdmna",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
