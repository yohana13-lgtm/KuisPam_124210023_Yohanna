import 'package:flutter/material.dart';
import 'package:untitled2/halaman_detail.dart';
import 'package:untitled2/data_buku.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.purpleAccent],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Center(
          child: Text('Data Buku'),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: listBuku.length,
        itemBuilder: (context, index) {
          final DataBuku lokasi = listBuku[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Halamandetail(lokasi: lokasi),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 2 - 20,
                    child: Image.network(
                      lokasi.imageLink,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(lokasi.title),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}