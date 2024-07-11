import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurants/Featares/Home_screen/Presentation/pages/home_screen.dart';
import '../../../../generated/l10n.dart';
import '../cubit/loce_cubit.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).Settings,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'asses/image/backgrod.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    S.of(context).MyAccount,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        _buildListTile(
                          context,
                          icon: Icons.list,
                          title: S.of(context).myOrders,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          },
                        ),
                        Divider(),
                        _buildListTile(
                          context,
                          icon: Icons.lock,
                          title: S.of(context).ChangePassword,
                          onTap: () {
                            // Handle navigation to Change Password
                          },
                        ),
                        Divider(),
                        _buildListTile(
                          context,
                          icon: Icons.email,
                          title: S.of(context).ChangeEmail,
                          onTap: () {
                            // Handle navigation to Change Email
                          },
                        ),
                        Divider(),
                        _buildListTile(
                          context,
                          icon: Icons.location_on,
                          title: S.of(context).MyAddressBook,
                          onTap: () {
                            // Handle navigation to My Address Book
                          },
                        ),
                        Divider(),
                        _buildListTile(
                          context,
                          icon: Icons.credit_card,
                          title: S.of(context).ManageCards,
                          onTap: () {
                            // Handle navigation to Manage Cards
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    S.of(context).Help,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: _buildListTile(
                      context,
                      icon: Icons.language,
                      title: S.of(context).Language,
                      onTap: _showLanguageDialog,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange, size: 30),
      title: Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      onTap: onTap,
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
        );
      },
    );
  }
}
