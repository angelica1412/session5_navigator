import 'package:flutter/material.dart';
import 'detail_item.dart';

class DynamicScreen extends StatefulWidget {
  final int routeNumber;
  int numberOfScreens;
  List<String> routeList = [];

  DynamicScreen({required this.routeNumber, required this.numberOfScreens});

  final TextEditingController _controller = TextEditingController();

  @override
  _DynamicScreenState createState() => _DynamicScreenState();
}

class _DynamicScreenState extends State<DynamicScreen> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: widget._controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukkan jumlah dynamic screen',
                contentPadding: EdgeInsets.all(14.0),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onHover: (hovered) {
                setState(() {
                  isHovered = hovered;
                });
              },
              onTap: () {
                try {
                  int numberOfNewScreens = int.parse(widget._controller.text);
                  widget.numberOfScreens += numberOfNewScreens;
                  for (int i = 0; i < numberOfNewScreens; i++) {
                    widget.routeList.add(
                        'Dynamic Screen ${widget.numberOfScreens - numberOfNewScreens + i}');
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Terjadi kesalahan: $e'),
                    ),
                  );
                }
                setState(
                    () {}); // Memperbarui tampilan setelah menambahkan rute
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                decoration: BoxDecoration(
                  color: isHovered
                      ? Colors.orange
                      : Color.fromARGB(255, 28, 172, 23),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  'Generate Dynamic Screens',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: widget.routeList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Dynamic Screen ${index + 1}'),
                    onTap: () {
                      try {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NextScreen(
                              title: 'Dynamic Screen ${index + 1}',
                              description:
                                  'Deskripsi singkat untuk Dynamic Screen ${index + 1}',
                            ),
                          ),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Terjadi kesalahan: $e'),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
