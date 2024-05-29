import 'package:flutter/material.dart';
import 'package:restaurants/Featares/Home_screen/Presentation/pages/home_screen.dart';
import 'package:restaurants/Featares/Register_screen/Presentation/pages/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool _passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                image: AssetImage("asses/image/White and Orange Healthy Food Instagram Post (14).png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 160),
                  child: Text("Login",style:
                  TextStyle(fontSize: 75,fontWeight: FontWeight.bold),),
                ),
                Text("Sign in to continue",style: TextStyle(fontSize:25 ),),
                SizedBox(height: 20,),
                Column(
                  children: [
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
                          hintText: "Email",
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                              fontWeight: FontWeight.bold, fontSize: 17),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()));
                        }

                      },

                      elevation: 5,

                      minWidth: MediaQuery.of(context).size.width / 1.7,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("LOGIN",

                        style: TextStyle(
                          fontSize: 18,color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "don’t have an account? "


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
                            child: Text( "create a new account",style:
                            TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),)),
                      ],
                    )


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


