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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).profile,
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
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('asses/image/images.png'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).nam,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                            S.of(context).egp,
                            style: TextStyle(fontSize: 18, color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Card(
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.person, color: Colors.orange),
                            title: Text(S.of(context).nam, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            subtitle: Text(S.of(context).egp, style: TextStyle(color: Colors.grey)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.email, color: Colors.orange),
                            title: Text('Email', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            subtitle: Text('RaniaMortada.com', style: TextStyle(color: Colors.grey)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.phone, color: Colors.orange),
                            title: Text('Phone', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            subtitle: Text('+20 123 456 7890', style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        icon: Icon(Icons.edit, color: Colors.white),
                        label: Text(S.of(context).Edit, style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfileScreen()));
                        },
                      ),
                      SizedBox(width: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        ),
                        icon: Icon(Icons.settings, color: Colors.white),
                        label: Text(S.of(context).Settings, style: TextStyle(color: Colors.white)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
