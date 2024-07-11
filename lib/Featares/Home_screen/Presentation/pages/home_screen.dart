import 'package:flutter/material.dart';
import 'package:restaurants/Featares/Menu/Presentation/pages/menu_screen.dart';
import '../../../../generated/l10n.dart';
import '../../../Profile_Screen/presentation/pages/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final List<Widget> _screens = [
    RestaurantList(),
    Center(child: Text("My Orders")),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final List<Tab> myTabs = <Tab>[
      Tab(icon: Icon(Icons.delivery_dining,size: 50,), text: S.of(context).delivery),
      Tab(icon: Icon(Icons.assignment,size: 50,), text: S.of(context).card),
      Tab(icon: Icon(Icons.person,size: 50,), text: S.of(context).my),
    ];
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                'asses/image/backgrod.png', // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                // TabBar View
                Expanded(
                  child: TabBarView(
                    children: _screens,
                  ),
                ),
              ],
            ),
          ],
        ),
        // TabBar at the bottom
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            tabs: myTabs,
            labelColor: Colors.orange,
            unselectedLabelColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.orange,
          ),
        ),
      ),
    );
  }
}

class RestaurantList extends StatefulWidget {
  @override
  _RestaurantListState createState() => _RestaurantListState();
}

class _RestaurantListState extends State<RestaurantList> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      S.of(context).dishes,
      S.of(context).offers,
      S.of(context).restaurants,
      S.of(context).restaurants,
      S.of(context).restaurants
    ];
    final List<Map<String, String>> restaurants = [
      {
        'name': S.of(context).dishes,
        'description': S.of(context).imag,
        'image': 'asses/image/burger-with-melted-cheese (1).webp',
      },
      {
        'name': S.of(context).offers,
        'description': S.of(context).imag,
        'image': 'asses/image/burger-with-melted-cheese (1).webp',
      },
      {
        'name': S.of(context).restaurants,
        'description': S.of(context).imag,
        'image': 'asses/image/burger-with-melted-cheese (1).webp',
      },
      {
        'name': S.of(context).restaurants,
        'description': S.of(context).imag,
        'image': 'asses/image/burger-with-melted-cheese (1).webp',
      },
      {
        'name': S.of(context).restaurants,
        'description': S.of(context).imag,
        'image': 'asses/image/burger-with-melted-cheese (1).webp',
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          // Category Selector
          Container(
            height: 60,
            margin: EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: _selectedCategory == index ? Colors.orange : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: _selectedCategory == index ? Colors.white : Colors.black54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          // Restaurant List
          Expanded(
            child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                final restaurant = restaurants[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  color: Colors.white.withOpacity(0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        restaurant['image']!,
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      restaurant['name']!,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    subtitle: Text(
                      restaurant['description']!,
                      style: TextStyle(fontSize: 18, color: Colors.black54,),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.orange,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MenuScreen()),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
