import 'package:flutter/material.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/clubs_screen.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/home_screen.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/internship_screen/internships_screen.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/jobs_screen.dart';

import 'courses_screen.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;

  final List<Widget> _screens = [
    const HomeScreen(),
    const InternshipsScreen(),
    const JobsScreen(),
    const ClubsScreen(),
    const CoursesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.home),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Internships',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Jobs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Clubs',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_outline),
            label: 'Courses',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}