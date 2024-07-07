import 'package:flutter/material.dart';
import 'package:restaurants/Featares/Menu/Presentation/pages/menu_screen.dart';

import '../../../../generated/l10n.dart';
import '../../../Profile_Screen/presentation/pages/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).restaurants,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'asses/image/backgrod.png',
              fit: BoxFit.cover,
            ),
          ),
          // Restaurant List
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: RestaurantList(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black54,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

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
            label: S.of(context).delivery,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: S.of(context).myOrders,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: S.of(context).my,
          ),
        ],
      ),
    );
  }
}

class RestaurantList extends StatefulWidget {
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  final List<String> categories = [
    'Dishes',
    'Offers',
    'Restaur',
    'Restaurss',
    'Restaurrr',
  ];
  int? _value = 1;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> restaurants = [
      {
        'name': '${S.of(context).dishes}',
        'description': 'Mercury is the smallest planet in the Solar System and the closest to the Sun.',
        'image': 'assets/mercury.jpg',
      },
      {
        'name': '${S.of(context).offers}',
        'description': 'Venus is the second planet from the Sun and is Earth\'s closest planetary neighbor.',
        'image': 'assets/venus.jpg',
      },
      {
        'name': '${S.of(context).restaurants}',
        'description': 'Earth is an ellipsoid with a circumference of about 40,000 km. It is the densest planet in the Solar System.',
        'image': 'assets/earth.jpg',
      },
      {
        'name': '${S.of(context).restaurants}',
        'description': 'Earth is an ellipsoid with a circumference of about 40,000 km. It is the densest planet in the Solar System.',
        'image': 'assets/earth.jpg',
      },
      {
        'name': '${S.of(context).restaurants}',
        'description': 'Earth is an ellipsoid with a circumference of about 40,000 km. It is the densest planet in the Solar System.',
        'image': 'assets/earth.jpg',
      },
    ];
    return Column(
      children: [
        Container(
          height: 50.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ChoiceChip(
                  label: Text(categories[index]),
                  selected: _value == index,
                  selectedColor: Colors.orange,
                  selectedShadowColor: Colors.red,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                  backgroundColor: Colors.black54,
                  labelStyle: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 70),
        Expanded(
          child: ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return Card(
                margin: EdgeInsets.all(10.0),
                color: Colors.black12,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.asset(
                      'asses/image/image 8.png',
                      width: 50,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      restaurant['name'] ?? 'Unknown', // Ensure non-null
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    subtitle: Text(
                      restaurant['description'] ?? 'No description', // Ensure non-null
                      style: TextStyle(
                          fontSize: 16, color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add_box_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MenuScreen()),
                        );
                      },
                    ),
                    onTap: () {
                      // Handle onTap
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
