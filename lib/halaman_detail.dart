import 'package:flutter/material.dart';
import 'package:untitled2/data_buku.dart';
import 'package:url_launcher/url_launcher.dart';

class Halamandetail extends StatefulWidget {
  final DataBuku lokasi;

  Halamandetail({super.key, required this.lokasi});

  @override
  State<Halamandetail> createState() => _HalamandetailState();
}

class _HalamandetailState extends State<Halamandetail> {
  final Uri_url = Uri.parse('https://flutter.dev');

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = false;
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
          child: Text(widget.lokasi.title),
        ),
        actions: [
          IconButton(
            icon: isBookmarked ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border),
            onPressed: () {
              setState(() {
                isBookmarked = !isBookmarked;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height/3,
                  child : Image.network(widget.lokasi.imageLink)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Author: ${widget.lokasi.author}'),
                  SizedBox(height: 3),
                  Text('Country: ${widget.lokasi.country}'),
                  SizedBox(height: 3),
                  Text('Language: ${widget.lokasi.language}'),
                  SizedBox(height: 3),
                  Text('Pages: ${widget.lokasi.pages}'),
                  SizedBox(height: 3),
                  Text('Year: ${widget.lokasi.year}'),
                ],
              )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _launchUrl(widget.lokasi.link);
        },
        child: Icon(Icons.open_in_browser),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    } else {
    }
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
    if (widget.lokasi.isBookmarked) {
      setState(() {

        widget.lokasi.isBookmarked = true;
      });
    } else {

      widget.lokasi.isBookmarked = false;
    }
  }
}
