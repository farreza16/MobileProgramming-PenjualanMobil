import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjualan Mobil Bekas'),
      ),
      body: Center(
        child: Text(
          'Halaman Transaksi',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
