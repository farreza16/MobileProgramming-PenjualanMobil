import 'package:flutter/material.dart';
import 'package:anisa_uts/profile_page.dart';
import 'show_car_detail.dart'; // Import file ShowCarDetail.dart
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Cari Mobil...',
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
        automaticallyImplyLeading: false, // Hapus tombol panah kembali
      ),
      body: Container(
        color: Colors.blue, // Set warna latar belakang
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Menampilkan 2 item per baris
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 10, // Ganti dengan jumlah mobil yang tersedia
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Panggil ShowCarDetail dengan parameter yang sesuai
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShowCarDetail(carIndex: index)),
                );
              },
              child: Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1, // Sesuaikan dengan proporsi gambar
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/mobil${index + 1}.jpg'), // Path ke gambar
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: BottomAppBar(
          color: Color.fromARGB(255, 228, 228, 231),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleIconButton(
                icon: Icons.shopping_cart,
                onPressed: () {
                  // Tambahkan logika untuk navigasi ke keranjang pemesanan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
              Divider(
                height: 24,
                thickness: 2,
                color: Colors.white,
              ),
              CircleIconButton(
                icon: Icons.history,
                onPressed: () {
                  // Tambahkan logika untuk navigasi ke histori transaksi
                },
              ),
              Divider(
                height: 24,
                thickness: 2,
                color: Colors.white,
              ),
              CircleIconButton(
                icon: Icons.person,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CircleIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: IconButton(
        icon: Icon(icon, color: Colors.blue),
        onPressed: onPressed,
      ),
    );
  }
}
