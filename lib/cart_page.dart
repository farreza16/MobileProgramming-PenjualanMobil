import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<String> items = ['Mobil 1', 'Mobil 2', 'Mobil 3']; // Daftar item di keranjang

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: items.isEmpty
          ? Center(
              child: Text('Keranjang kosong'),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        items.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${calculateTotalPrice()}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Logika untuk checkout
                  // Misalnya, pindah ke halaman checkout atau tampilkan dialog konfirmasi
                },
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Metode untuk menghitung total harga
  double calculateTotalPrice() {
    double totalPrice = 0;
    for (var item in items) {
      // Misalnya, asumsi setiap mobil memiliki harga $10000
      totalPrice += 10000;
    }
    return totalPrice;
  }
}
