import 'package:flutter/material.dart';
import 'package:restaurants/Featares/Basket_Screen/Presentation/pages/basket_screen.dart';
import 'package:restaurants/Featares/Home_screen/Presentation/pages/home_screen.dart';

import '../../../../generated/l10n.dart';



class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String? _selectedSize;
  final List<String> _sizes = ['Small', 'Regular', 'Large'];
  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  var specila = TextEditingController();
  bool _passwordVisible = true;
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( S.of(context).menu),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.orange,),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'asses/image/immm.jpg', // Replace with the actual image URL
                  width: MediaQuery.of(context).size.width * 3,
                  height: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  S.of(context).Pasta,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  S.of(context).cheese,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  S.of(context).size,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: DropdownButton<String>(
                    hint: Text(
                      S.of(context).size,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    value: _selectedSize,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedSize = newValue;
                      });
                    },
                    items: _sizes.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      );
                    }).toList(),
                    isExpanded: true,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  S.of(context).Special,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: specila,
                  decoration: InputDecoration(
                    hintText:  S.of(context).onion,
                    border: OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please complete the information";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 200),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Colors.orange,
                            size: 25,
                          ),
                          onPressed: _decrementCounter,
                        ),
                        Text(
                          '$_counter',
                          style: TextStyle(fontSize: 25.0),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Colors.orange,
                            size: 25,
                          ),
                          onPressed: _incrementCounter,
                        ),
                      ],
                    ),
                    MaterialButton(
                      color: Colors.orange,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MyBasketScreen()));
                        }
                      },
                      elevation: 5,
                      minWidth: MediaQuery.of(context).size.width / 2,
                      height: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        S.of(context).basket,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
