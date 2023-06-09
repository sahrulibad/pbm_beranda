import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GridItem {
  final String title;
  final String imagePath;

  GridItem(this.title, this.imagePath);
}

class BerandaPage extends StatelessWidget {
  final List<GridItem> items = [
    GridItem('Wisata Budaya', 'assets/budaya.jpg'),
    GridItem('Wisata Kuliner', 'assets/kuliner.jpg'),
    GridItem('Wisata Alam', 'assets/alam.jpeg'),
    GridItem('Wisata Religi', 'assets/religi.jpg'),
    GridItem('Wisata Bahari', 'assets/desa_purba.jpeg'),
    GridItem('Wisata Agrowisata', 'assets/candi_brahu.jpg'),
  ];

  final List<String> slideImages = [
    'assets/budaya.jpg',
    'assets/kuliner.jpg',
    'assets/alam.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TripNow'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8.0),
            CarouselSlider(
              items: slideImages
                  .map(
                    (item) => Image.asset(
                      item,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
              options: CarouselOptions(
                height: 200.0,
                aspectRatio: 16/9,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.7,
                onPageChanged: (index, reason) {},
              ),
            ),
            SizedBox(height: 16.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(item: items[index]),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          items[index].imagePath,
                          width: 120.0,
                          height: 120.0,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          items[index].title,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  // Tambahkan fungsi untuk navigasi ke halaman Beranda
                },
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  // Tambahkan fungsi untuk navigasi ke halaman List
                },
                icon: Icon(Icons.list),
              ),
              IconButton(
                onPressed: () {
                  // Tambahkan fungsi untuk navigasi ke halaman Profil
                },
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  final GridItem item;

  DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              item.imagePath,
              width: 120.0,
              height: 120.0,
            ),
            SizedBox(height: 16.0),
            Text(
              item.title,
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}
