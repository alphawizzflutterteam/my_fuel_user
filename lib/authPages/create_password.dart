import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_prj/authPages/login_page.dart';
import 'package:test_prj/components/my_background2.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';

class CreatePasswordPage extends StatelessWidget {
  CreatePasswordPage({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      Color.fromRGBO(252, 130, 59, 1),
                      Color.fromRGBO(211, 83, 7, 1),
                    ])),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(35),
                            topRight: Radius.circular(35),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 50),
                                // App Icon
                                Image.asset(
                                  "assets/login-logo.png",
                                  height: 62,
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Create New Password",
                                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  "Enter the OTP sent to +91 9556654328",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 56,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter New Password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.person_2_outlined),
                                      label: Text('Create New Password'),
                                      labelStyle: TextStyle(color: Colors.grey.shade700),
                                      enabled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade200),
                                          borderRadius: BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade700),
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                // MyTextField(
                                //   labelText: Text("Create New Password"),
                                // ),
                                SizedBox(height: 20),
                                SizedBox(
                                  height: 56,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter Confirm Password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_open_sharp),
                                      label: Text('Confirm Password'),
                                      labelStyle: TextStyle(color: Colors.grey.shade700),
                                      enabled: true,

                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade200),
                                          borderRadius: BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.grey.shade700),
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                                //
                                // MyTextField(
                                //   labelText: Text("Confirm Password"),
                                // ),
                                SizedBox(height: 40),
                                GestureDetector(

                                    onTap: (){
                                      if(_formKey.currentState!.validate())
                                      {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                                      }

                                    },
                                    // onTap: () => Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //       builder: (context) => LoginPage(),
                                    //     )),
                                    child: MyButton(text: "Create Password")),
                                SizedBox(height: 30),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                    top: 50,
                    left: 20,
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back,color: Colors.white,),
                        SizedBox(width: 80,),
                        Text('Create Password',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                      ],
                    ))
              ],
            ),
          ),
        )

      // MyBackground2(
      //   child:
      //
      //
      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(height: 50),
      //         // App Icon
      //         Image.asset(
      //           "assets/login-logo.png",
      //           height: 62,
      //         ),
      //         SizedBox(height: 10),
      //         Text(
      //           "Create New Password",
      //           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      //         ),
      //         SizedBox(height: 8),
      //         Text(
      //           "Enter the OTP sent to +91 9556654328",
      //           style: TextStyle(
      //             fontSize: 16,
      //           ),
      //         ),
      //         SizedBox(height: 20),
      //         MyTextField(
      //           labelText: Text("Create New Password"),
      //         ),
      //         SizedBox(height: 20),
      //         MyTextField(
      //           labelText: Text("Confirm Password"),
      //         ),
      //         SizedBox(height: 40),
      //         GestureDetector(
      //             onTap: () => Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => LoginPage(),
      //                 )),
      //             child: MyButton(text: "Create Password")),
      //         SizedBox(height: 30),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
