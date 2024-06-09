import 'package:flutter/material.dart';
import '../components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'mainpage.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "registration_screen";

  const RegistrationScreen({super.key});
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  var email;
  var password;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "icon",
                child: Container(
                  height: 400.0,
                  child: Image.asset('images/HB.png'),
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  textAlign: TextAlign.center,
                  // This will obscure the text
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: "Enter Your Email",
                  )),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                  onChanged: (value) {
                    password = value;
                  },
                  textAlign: TextAlign.center,
                  obscureText: true,
                  // This will obscure the text
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    hintText: "Enter Your Password",
                  )),
              const SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                "Register",
                Colors.blueAccent,
                () async {
                  setState(() {
                    _saving = true;
                  });
                  try {
                    final newuser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.pushNamed(context, Mainpage.id);
                  } catch (e) {
                    setState(() {
                      _saving = false;
                    });
                    print(e);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
