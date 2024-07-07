import 'package:flutter/material.dart';
import 'package:restaurants/Featares/Home_screen/Presentation/pages/home_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../Edit_profile/Presentation/pages/edit_profile.dart';
import '../../../Seting_Screen/Presentation/pages/seting_screen.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);



  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text( S.of(context).profile,style: TextStyle(
              fontSize: 35,fontWeight: FontWeight.bold,color: Colors.orange),),
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 1,
          decoration: const BoxDecoration(
            // color: Color(0xFFA08E51),
            image: DecorationImage(
              image: AssetImage("asses/image/backgrod.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('asses/image/immm.jpg'), // Replace with your image
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).nam,
                            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            S.of(context).egp,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                ),
                Divider(),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(

                      color: Colors.orange,
                      onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EditProfileScreen()));
                        // if (formKey.currentState!.validate()) {
                        //   // LoginCubit.get(context).Login(
                        //   //   email: emailController.text,
                        //   //   password: passwordController.text,
                        //   // );
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => HomeScreen()));
                        // }

                      },

                      elevation: 5,

                      minWidth: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text( S.of(context).Edit,

                        style: TextStyle(
                          fontSize: 18,color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    MaterialButton(

                      color: Colors.orange,
                      onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SettingsPage()));


                        // if (formKey.currentState!.validate()) {
                        //   // LoginCubit.get(context).Login(
                        //   //   email: emailController.text,
                        //   //   password: passwordController.text,
                        //   // );
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(builder: (context) => HomeScreen()));
                        // }

                      },

                      elevation: 5,

                      minWidth: MediaQuery.of(context).size.width / 3,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.settings,color: Colors.white,),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.black54,
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });

              if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              }

              if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.delivery_dining),
                label:  S.of(context).delivery,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.assignment),
                label:  S.of(context).myOrders,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label:  S.of(context).my,
              ),
            ],
          )


      ),
    );
  }
}
