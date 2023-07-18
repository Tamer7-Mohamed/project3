import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taam_app/screens/homelayout.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
  var emailcontroller = TextEditingController();

  var passwordcontroller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple

                    ),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      };
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: " Emile adress",
                      prefixIcon: Icon(
                          Icons.email
                      ),
                      border: OutlineInputBorder(),
                    ),

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    keyboardType: TextInputType.phone,
                    obscureText: passwordVisible,
                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '';
                      };
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: " password",
                      prefixIcon: Icon(
                          Icons.lock
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                                () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      alignLabelWithHint: false,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 30,
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signinUsingFirebase(emailcontroller.text, passwordcontroller.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    homelayout(
                                      email: emailcontroller.text,
                                    )),
                          );
                        } else {
                          emailcontroller.clear();
                        }
                      },
                      // child: const Text('Submit'),

                      child: Text('LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                          )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(""
                          "don\'t have an account? "),
                      TextButton(onPressed: () {},
                          child: Text(
                              'Register Now'
                          )),
                    ],

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  saveemail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', email);
  }

  signinUsingFirebase(String email, String password) async {
    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
    final user = userCredential.user;
    print(user?.uid);
    saveemail(user!.email!);
  }
}