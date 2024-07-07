import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:master_food/sql.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


class SignUpPage extends StatefulWidget {
  static var tag = "/DemoT3SignUp";

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  bool passwordVisible = false;
  bool isRemember = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
var t3_ic_icon='https://cdn.pixabay.com/photo/2015/03/30/12/37/jellyfish-698521__340.jpg';
  Future<void> _signUp() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    await dbHelper.insertUser({
      'name': _nameController.text,
      'phone': _phoneController.text,
      'password': _passwordController.text,
    }); ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sign-up successful!')),
    );
    print(_phoneController.text);
    print(_passwordController.text);
    // Navigate to login screen
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            child:  TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone')),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child:
                            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
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
                        child:TextButton(child: Text('sign_up'),
                                                  onPressed: _signUp),
                        //                           child: Text( "Login",
                        //   style: TextStyle(
                        //     // color: Colors.white,
                        //       fontWeight: FontWeight.bold),),
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: TextButton(child: Text('sign_up'),
                          onPressed: _signUp),
                    ),const SizedBox(
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
      // body: Observer(
      //   builder: (_) => Container(
      //     color: Colors.black12,
      //     height: MediaQuery.of(context).size.height,
      //     child: SingleChildScrollView(
      //       child: Column(
      //         children: <Widget>[
      //           Container(
      //             height: (MediaQuery.of(context).size.height) / 3.5,
      //             child: Stack(
      //               children: <Widget>[
      //                 Image.asset(
      //
      //                 'https://i.pinimg.com/736x/79/c6/3a/79c63ab006005955cfaaa830f76f0727.jpg',
      //                   fit: BoxFit.fill,
      //                   width: MediaQuery.of(context).size.width,
      //                 ),
      //                 Container(
      //                   margin: EdgeInsets.only(left: 16),
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: <Widget>[
      //                       Text('create_account', style:TextStyle(fontSize: 20, color: Colors.white))
      //                     ],
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //           Container(
      //               alignment: Alignment.topRight, margin: EdgeInsets.only(right: 45), transform: Matrix4.translationValues(0.0, -40.0, 0.0), child: Image.asset(t3_ic_icon, height: 70, width: 70)),
             //   TextField(controller: _nameController, decoration: InputDecoration(labelText: 'Name')),
              //  TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone')),
               // TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
               //  SizedBox(height: 35),
               //  Padding(
               //    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
               //    child: TextButton(child: Text('sign_up'),
               //        onPressed: _signUp),
               //  ),
      //           SizedBox(height: 20),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: <Widget>[
      //               Text('already_have_account ?',  ),
      //               Container(
      //                 margin: EdgeInsets.only(left: 4),
      //                 child: GestureDetector(child: Text('sign_in', style: TextStyle(fontSize: 18.0, decoration: TextDecoration.underline, color: Colors.orangeAccent)), onTap: () {}),
      //               )
      //             ],
      //           ),
      //           Container(
      //             alignment: Alignment.bottomLeft,
      //             margin: EdgeInsets.only(top: 50, left: 16, right: 16, bottom: 20),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: <Widget>[
      //                 // Image.asset(t3_ic_sign2, height: 50, width: 70, color: appStore.iconColor),
      //                 // Container(margin: EdgeInsets.only(top: 25, left: 10), child: Image.asset(t3_ic_sign4, height: 50, width: 70, color: appStore.iconColor)),
      //                 // Container(margin: EdgeInsets.only(top: 25, left: 10), child: Image.asset(t3_ic_sign3, height: 50, width: 70, color: appStore.iconColor)),
      //                 // Image.asset(t3_ic_sign1, height: 80, width: 80, color: appStore.iconColor),
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}