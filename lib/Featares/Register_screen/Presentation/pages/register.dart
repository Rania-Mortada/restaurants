import 'package:flutter/material.dart';
import 'package:restaurants/Featares/login_screen/Presentation/pages/Login_screen.dart';

import '../../../../generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  var firstNameController = TextEditingController();
  var emailController = TextEditingController();
  var lastNameController = TextEditingController();
  var passwordController = TextEditingController();
  var company_NameController = TextEditingController();
  var tax_NumberController = TextEditingController();
  var tax_RegisterController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var ssnController = TextEditingController();
  var userNameController = TextEditingController();
  bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor:const Color(0xFFE6E8ED),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 1,
            decoration: const BoxDecoration(
              // color: Color(0xFFA08E51),
              image: DecorationImage(
                image: AssetImage("asses/image/backgrod.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 120,right: 50),
                  child: Text(S.of(context).create,style:
                  TextStyle(fontSize: 36,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 40,

                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              // contentPadding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide(
                                //   width: 2,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.orange,
                                  //width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "First name",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Correct First name";
                              } else {
                                return null;
                              }
                            },
                          ),

                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 50,
                        ),

                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 40,

                          child: TextFormField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              // contentPadding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide(
                                //   width: 2,
                                // ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.orange,
                                  //width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Last name",
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Enter Correct Last name";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,

                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          // contentPadding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   width: 2,
                            // ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              //width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Phone number",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter Correct Phone number";
                          } else {
                            return null;
                          }
                        },
                      ),

                    ),


                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,

                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                           //contentPadding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   width: 2,
                            // ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              //width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Address",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter Correct Address";
                          } else {
                            return null;
                          }
                        },
                      ),

                    ),


                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,

                      child: TextFormField(
                        controller: emailController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                           //contentPadding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   width: 2,
                            // ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              //width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 15
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter Correct email";
                          } else {
                            return null;
                          }
                        },
                      ),

                    ),


                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 40,

                      child: TextFormField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          //contentPadding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                          enabledBorder: OutlineInputBorder(
                            // borderSide: BorderSide(
                            //   width: 2,
                            // ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              //width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Password",
                          hintStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold, fontSize: 15),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Enter Correct password";
                          } else {
                            return null;
                          }
                        },
                      ),

                    ),
                    SizedBox(height: 30,),
                    MaterialButton(
                      color: Colors.orange,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // LoginCubit.get(context).Login(
                          //   email: emailController.text,
                          //   password: passwordController.text,
                          // );
                        }

                      },

                      elevation: 5,

                      minWidth: MediaQuery.of(context).size.width / 1.7,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("sign up",

                        style: TextStyle(
                          fontSize: 25,color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "Already have account"


                        ),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                          child: GestureDetector(
                              onTap: (){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text( "Sign in",style:
                              TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),)),
                        ),
                            // child: Text( "Sign in",style:
                            // TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),)),

                      ],
                    ),
                    Text(
                        "Forget Password? "


                    ),


                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
