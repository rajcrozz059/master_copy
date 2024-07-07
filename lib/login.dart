import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sql.dart';



class LoginPage extends StatefulWidget {
  static const String path = "lib/src/pages/login/login13.dart";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorMessage;
  // Future<void> _login() async {
  //   final phone = _phoneController.text;
  //   final password = _passwordController.text;
  //
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final storedPhone = prefs.getString('phone');
  //   final storedPassword = prefs.getString('password');
  //
  //   if (phone == storedPhone && password == storedPassword) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Login successful!')),
  //     );Navigator.pushReplacementNamed(context, '/home');
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Invalid phone number or password')),
  //     );
  //   }
  // }
  Future<void> _login() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    final user = await dbHelper.getUser(_phoneController.text);

    if (user != null && user['password'] == _passwordController.text) {
      // Navigate to home screen
      Navigator.pushReplacementNamed(context, '/home');
      print(_phoneController.text);
      print(_passwordController.text);
      ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Login successful!')),
              );
    } else {
      setState(() {
        _errorMessage = 'Invalid phone number or password';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      //topLeft: Radius.circular(60),
                      // topRight: Radius.circular(60),
                      //bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(300),
                    ),
                    image: DecorationImage(
                        image:
                        NetworkImage(
                            'https://static.vecteezy.com/system/resources/thumbnails/002/238/966/small/cute-water-characters-with-quotes-free-vector.jpg'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                           // image: DecorationImage(
                                // image: NetworkImage(
                                //     'https://cdn.pixabay.com/photo/2019/12/24/08/54/flying-dandelions-4716287__340.png')
                           // )
                      ),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        // decoration: const BoxDecoration(
                        //     image: DecorationImage(
                        //         image: NetworkImage(
                        //             'https://cdn.pixabay.com/photo/2016/08/25/07/30/red-1618916__340.png'))),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                      //  decoration: const BoxDecoration(
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         'https://cdn.pixabay.com/photo/2019/10/22/07/52/dandelions-4567966__340.png'))),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        child: const Center(
                          // child: Text(
                          //   "Login",
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontSize: 40,
                          //       fontWeight: FontWeight.bold),
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(143, 148, 251, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey[100]!))),
                            child: TextField( controller: _phoneController,

                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Email or Phone number",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField( controller: _passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle:
                                  TextStyle(color: Colors.grey[400])),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                       //   gradient: const LinearGradient(
                           color:Colors.blueAccent.withOpacity(0.9),
                            //Color.fromRGBO(143, 148, 251, 1),
                        //    Color.fromRGBO(143, 148, 251, .6),
                       //  ]
                          //)
                    ),
                      child:  Center(
                        child: TextButton(
                          onPressed: _login, child: Text( "Login",
                          style: TextStyle(
                             // color: Colors.white,
                              fontWeight: FontWeight.bold),),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),TextButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/signup');
                      }, child: Text( "sign-up",
                      style: TextStyle(
                         // color: Colors.white,
                          fontWeight: FontWeight.bold),),
                    ), const SizedBox(
                      height: 70,
                    ),
                    const Text(
                      "Forgot Password?",
                      style:
                      TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}