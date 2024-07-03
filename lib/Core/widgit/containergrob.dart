import 'package:flutter/material.dart';

class ContainerGR extends StatefulWidget {
  ContainerGR({Key? key, required this.hintext, required this.onPressed}) : super(key: key);
  final String hintext;
  final VoidCallback onPressed;

  @override
  State<ContainerGR> createState() => _ContainerGRState();
}

class _ContainerGRState extends State<ContainerGR> {
  bool _isRed = true;

  void _changeColor() {
    setState(() {
      _isRed = !_isRed;
      widget.onPressed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _changeColor,
      child: Text(
        widget.hintext,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: _isRed ? Colors.white : Colors.orange,
        minimumSize: Size(200, 60), // Increase width and height
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Additional padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
      ),
    );

  }
}