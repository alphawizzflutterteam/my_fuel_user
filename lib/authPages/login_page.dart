import 'package:flutter/material.dart';
import 'package:test_prj/authPages/forgot_password.dart';
import 'package:test_prj/authPages/login_page_2.dart';
import 'package:test_prj/components/my_background.dart';
import 'package:test_prj/components/my_button.dart';
import 'package:test_prj/components/my_textfield.dart';
import 'package:test_prj/home.dart';
import 'package:test_prj/authPages/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyBackground(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Image.asset(
                    "assets/login-logo.png",
                    height: 62,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Please Sign in to your account",
                    style: TextStyle(
                      fontSize: 16,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45,
                        width: 160,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(138, 180, 2, 1),
                              Color.fromRGBO(59, 120, 31, 1),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Personal",
                          style: TextStyle(color: Colors.white,),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const LoginPage2())),
                        child: Container(
                          height: 45,
                          width: 160,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.grey.shade100),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: const Text(
                            "Business",
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Phone No. Or Email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text('Phone No. Or Email'),
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      enabled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                            });
                          },
                          icon: Icon(Icons.remove_red_eye)),
                      label: Text('Password'),
                      labelStyle: TextStyle(color: Colors.grey.shade700),
                      enabled: true,
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade200),
                          borderRadius: BorderRadius.circular(8)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade700),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Text("Forgot Password? ",style:TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetPassword(),
                            )),
                        child: Text(
                          "Reset It",
                          style: TextStyle(
                            color: Color.fromRGBO(138, 180, 2, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: (){
                      if(_formKey.currentState!.validate())
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                      }

                    },
                    child: const MyButton(text: "Login"),
                  ),
                  const SizedBox(height: 100),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an account? "),
                      GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>  SignUp())),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color.fromRGBO(138, 180, 2, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // child: Container(
        //   decoration: const BoxDecoration(
        //       gradient: LinearGradient(
        //           begin: Alignment.topCenter,
        //           end: Alignment.center,
        //           colors: [
        //         Color.fromRGBO(252, 130, 59, 1),
        //         Color.fromRGBO(211, 83, 7, 1),
        //       ])),
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 80.0),
        //     child: Container(
        //       decoration: const BoxDecoration(
        //         color: Colors.white38,
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(35),
        //           topRight: Radius.circular(35),
        //         ),
        //       ),
        //       child: Padding(
        //         padding: const EdgeInsets.only(top: 10),
        //         child: Container(
        //           decoration: const BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(35),
        //               topRight: Radius.circular(35),
        //             ),
        //           ),
        //           ),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
