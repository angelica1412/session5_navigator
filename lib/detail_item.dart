import 'package:flutter/material.dart';

class NextScreen extends StatelessWidget {
  final String title;
  final String description;

  NextScreen({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Item'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: 16.0, top: 16.0), // Menambahkan padding ke atas dan kiri
            child: Row(
              children: [
                Text(
                  'Nama Dynamic: ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0), // Menambahkan padding
            child: Text('Deskripsi: $description'),
          ),
          // Isi halaman selanjutnya sesuai keinginan Anda
        ],
      ),
    );
  }
}
