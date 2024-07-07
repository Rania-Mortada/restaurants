import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/Featares/Home_screen/Presentation/pages/home_screen.dart';

import '../../../../generated/l10n.dart';
import '../cubit/loce_cubit.dart';
import '../cubit/loce_state.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(S.of(context).Settings,style: TextStyle
          (fontSize:35,fontWeight: FontWeight.bold,color: Colors.orange ),),
      ),
      body:
      Container(
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
          padding: const EdgeInsets.only(left: 35,top: 35),

          child: BlocConsumer<LocaleCubit, ChangeLocaleState>(
            listener: (BuildContext context, ChangeLocaleState state) {  },
            builder: (BuildContext context, ChangeLocaleState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      S.of(context).MyAccount,
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.list,size: 25,),
                    title: Text(S.of(context).myOrders,style: TextStyle(fontSize: 25),),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.lock,size: 25,),
                    title: Text(S.of(context).ChangePassword,style: TextStyle(fontSize: 25),),
                    onTap: () {
                      // Handle navigation to Change Password
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.email,size: 25,),
                    title: Text(S.of(context).ChangeEmail,style: TextStyle(fontSize: 25),),
                    onTap: () {
                      // Handle navigation to Change Email
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.location_on,size: 25,),
                    title: Text(S.of(context).MyAddressBook,style: TextStyle(fontSize: 25),),
                    onTap: () {
                      // Handle navigation to My Address Book
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.credit_card,size: 25,),
                    title: Text(S.of(context).ManageCards,style: TextStyle(fontSize: 25),),
                    onTap: () {
                      // Handle navigation to Manage Cards
                    },
                  ),
                  SizedBox(height: 20),
                  Text(
                    S.of(context).Help,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.language,size: 25,),
                    title: Text(S.of(context).Language,style: TextStyle(fontSize: 25),),
                    onTap: () {
                      _showLanguageDialog();
                    },
                  ),
                ],
              );

            },

          ),
        ),
      ),
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).SelectLanguage),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text(S.of(context).ar),
                value: S.of(context).ar,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  context.read<LocaleCubit>().changeLanguage('ar');
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.of(context).pop();
                },
              ),
              RadioListTile<String>(
                title: Text(S.of(context).English),
                value: S.of(context).English,
                groupValue: _selectedLanguage,
                onChanged: (value) {
                  context.read<LocaleCubit>().changeLanguage('en');
                  setState(() {
                    _selectedLanguage = value!;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          // actions: [
          //   TextButton(
          //     onPressed: () {
          //
          //       Navigator.of(context).pop();
          //     },
          //     child: Text(S.of(context).SaveChange),
          //   ),
          // ],
        );
      },
    );
  }
}

