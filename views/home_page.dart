import 'package:flutter/material.dart';
import 'package:helloworld/models/task_model.dart';
import 'package:helloworld/seervices/task_services.dart';
import 'package:helloworld/views/profile_page.dart';
import 'package:helloworld/views/scound_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  var emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.blue[10],
        primarySwatch: Colors.blue,
      ),
      child: Form(
        key: _formKey,
        child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 300,
                    padding: EdgeInsetsDirectional.all(10),
                    child: Image(
                        image: NetworkImage(
                            "https://logowik.com/content/uploads/images/flutter5786.jpg")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value!.contains("@")) {
                          return null;
                        } else {
                          return "Email should contain '@' ";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.length > 7) {
                          return null;
                        } else {
                          return "the password be longer than 7 characters!";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 30,
                      end: 30,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 350.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),
                          );
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Forget Password ?",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Tap me",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      start: 30,
                      end: 30,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 350.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "No Accounts ? Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  savedEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', emailController.text);
  }
}
