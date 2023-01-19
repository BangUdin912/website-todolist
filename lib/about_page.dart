import 'package:flutter/material.dart';
import 'package:todolist_kegiatan_kampus/colors.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: tdBlue,
        title: Text(
          'About',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Title(
                color: Colors.white,
                child: Text(
                  'KELOMPOK 10',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                builCard(
                  'assets/images/udin.jpg',
                  "Nama   : Nur Khoerudin",
                  "NIM    : 20103065",
                  "Kelas  : SI04B",
                ),
                builCard(
                  "assets/images/lanjar.jpeg",
                  "Nama   : Lanjar Pamungkas",
                  "NIM    : 20103043",
                  "Kelas  : SI04B",
                ),
                builCard(
                  "assets/images/opik.jpeg",
                  "Nama   : Raopik Ahmad",
                  "NIM    : 20103070",
                  "Kelas  : SI04B",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card builCard(String img, String data, String caption, String desc) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30.30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(img, height: 250, width: 250),
            Padding(padding: EdgeInsets.all(20)),
            Text(data,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal)),
            Text(
              caption,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
              textAlign: TextAlign.justify,
              maxLines: 1,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
              textAlign: TextAlign.justify,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
