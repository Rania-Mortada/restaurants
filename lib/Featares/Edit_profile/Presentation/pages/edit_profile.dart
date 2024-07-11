import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  DateTime? selectedDate;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).Edit,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.orange),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              // Save action
            },
            child: Text(S.of(context).sava, style: TextStyle(color: Colors.orange)),
          ),
        ],
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Add image picker functionality
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.camera_alt, size: 40, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 30),
                  _buildCard(
                    context,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: S.of(context).name,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildCard(
                    context,
                    child: TextField(
                      controller: bioController,
                      decoration: InputDecoration(
                        labelText: S.of(context).Bio,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildCard(
                    context,
                    child: TextField(
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate ?? DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        labelText: selectedDate == null
                            ? S.of(context).Dateofbirth
                            : '${selectedDate!.toLocal()}'.split(' ')[0],
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildCard(
                    context,
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                gender = S.of(context).female;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gender == S.of(context).female ? Colors.orange : Colors.grey,
                            ),
                            child: Text(S.of(context).female),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                gender = S.of(context).male;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: gender == S.of(context).male ? Colors.orange : Colors.grey,
                            ),
                            child: Text(S.of(context).male),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, {required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      shadowColor: Colors.black.withOpacity(0.2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
