import 'package:flutter/material.dart';
import 'DynamicRoutesScreen.dart'; // Impor DynamicRoutesScreen

class FourthScreen extends StatefulWidget {
  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  bool isHoveredFirstButton = false;
  bool isHoveredSecondButton = false;
  bool isHoveredThirdButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fourth Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onHover: (hovered) {
                setState(() {
                  isHoveredSecondButton = hovered;
                });
              },
              onTap: () {
                try {
                  Navigator.pop(context);
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Terjadi kesalahan: $e'),
                    ),
                  );
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: isHoveredSecondButton
                      ? Colors.blue
                      : Color.fromARGB(208, 140, 212, 77),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Return to The Previous Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isHoveredSecondButton
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onHover: (hovered) {
                setState(() {
                  isHoveredThirdButton = hovered;
                });
              },
              onTap: () {
                try {
                  Navigator.pushNamed(context, '/dynamic_routes_screen');
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Terjadi kesalahan: $e'),
                    ),
                  );
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: isHoveredThirdButton
                      ? Colors.blue
                      : Color.fromARGB(208, 140, 212, 77),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  'Go to Dynamic Routes Screen',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isHoveredThirdButton
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'First',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Second',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Third',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: 'Fourth',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/second_screen');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/third_screen');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/fourth_screen');
          }
        },
      ),
    );
  }
}
