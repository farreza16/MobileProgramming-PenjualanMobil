import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart_page.dart'; // Import kelas Cart dan CartItem
import 'car.dart'; // Import kelas Car

class ShowCarDetail extends StatelessWidget {
  final int carIndex;

  const ShowCarDetail({required this.carIndex});

  @override
  Widget build(BuildContext context) {
    // Daftar detail mobil sesuai dengan indeks mobil yang dipilih
    final List<Map<String, dynamic>> carDetails = [
      {
        'name': 'HONDA INNOVA',
        'year': '2018',
        'price': 80000000,
        'description': 'Deskripsi mobil Honda Innova',
      },
      {
        'name': 'HONDA BRIO',
        'year': '2020',
        'price': 10000000,
        'description': '',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      {
        'name': 'Mobil Merk ABC',
        'year': '2020',
        'price': 25000.0,
        'description': 'Deskripsi mobil Merk ABC',
      },
      // Tambahkan detail mobil lainnya sesuai dengan jumlah mobil yang Anda inginkan
    ];

    final carDetail = carDetails[carIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(carDetail['name']),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white, size: 32),
            onPressed: () {
              // Tambahkan logika untuk navigasi ke keranjang pemesanan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              carDetail['name'],
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text('Tahun: ${carDetail['year']}'),
            Text('Harga: Rp ${NumberFormat('#,##0').format(carDetail['price'])}'),
            SizedBox(height: 20.0),
            Text(
              carDetail['description'],
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleIconButton(
                icon: Icons.shopping_cart,
                onPressed: () {
                  // Tambahkan logika untuk memasukkan mobil ke dalam keranjang
                  Navigator.of(context).pop();
                  // Misalnya, tampilkan snackbar untuk konfirmasi
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Mobil berhasil dimasukkan ke dalam keranjang.')),
                  );
                },
                tooltip: 'Keranjang',
                size: 36,
              ),
              CircleIconButton(
                icon: Icons.shopping_bag,
                onPressed: () {
                  // Tambahkan logika untuk melakukan transaksi atau pembelian mobil
                  Navigator.of(context).pop();
                  // Misalnya, tampilkan snackbar untuk konfirmasi
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Transaksi berhasil dilakukan.')),
                  );
                },
                tooltip: 'Beli',
                size: 36,
              ),
              IconButton(
                icon: Icon(Icons.cancel, color: Colors.white, size: 36),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                tooltip: 'Batal',
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
  final String? tooltip;
  final double? size;

  const CircleIconButton({required this.icon, required this.onPressed, this.tooltip, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: size ?? 32),
      onPressed: onPressed,
      tooltip: tooltip,
    );
  }
}
