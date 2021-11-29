import 'package:flutter/material.dart';
import 'package:flutter_state/widgets/home/exclusive_hotels.dart';
import 'package:flutter_state/widgets/home/top_destinations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectMenu = 0;
  int _currentTab = 0;

  void _onTab(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  final _icons = [
    Icons.home_rounded,
    Icons.pedal_bike_rounded,
    Icons.restaurant_menu_rounded,
    Icons.car_rental_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
          children: [
            //Top Text
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: size.width * 0.2),
              child: const Text(
                'What you would like to find?',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            //Icon Menu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (e) => _buildMenu(e.key),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20.0),
            //Top Destinations
            const TopDestinations(),
            //Exclusive Hotels
            const ExclusiveHotels(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentTab,
        selectedItemColor: Colors.blue[400],
        onTap: _onTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_rounded),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectMenu = index;
        });
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          color: _selectMenu == index ? Colors.blue[50] : Colors.grey[200],
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectMenu == index ? Colors.blue[400] : Colors.grey,
        ),
      ),
    );
  }
}
