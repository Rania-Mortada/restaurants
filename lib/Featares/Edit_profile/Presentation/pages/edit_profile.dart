import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

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
        title: Text(S.of(context).Edit,style: TextStyle
          (fontSize: 35,color: Colors.orange,fontWeight: FontWeight.bold),),

        actions: [
          TextButton(
            onPressed: () {
              // Save action
            },
            child: Text(S.of(context).sava, style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 80),
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
                labelText: S.of(context).name,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: bioController,
              decoration: InputDecoration(
                labelText:S.of(context).Bio,
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
                    ? S.of(context).Dateofbirth
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
          ],
        ),
      ),
    );
  }
}
