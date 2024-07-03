import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  DateTime? selectedDate; // Make selectedDate nullable
  String? gender; // Make gender nullable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          TextButton(
            onPressed: () {
              // Save action
            },
            child: Text('Save', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // Add image picker functionality
              },
              child: CircleAvatar(
                radius: 40,
                child: Icon(Icons.camera_alt),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: bioController,
              decoration: InputDecoration(
                labelText: 'Bio',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
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
                    ? 'Date of birth'
                    : '${selectedDate!.toLocal()}'.split(' ')[0],
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calendar_today),
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gender = 'Female';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gender == 'Female' ? Colors.pink : Colors.grey,
                    ),
                    child: Text('Female'),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        gender = 'Male';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gender == 'Male' ? Colors.blue : Colors.grey,
                    ),
                    child: Text('Male'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
