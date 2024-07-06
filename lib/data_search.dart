import 'package:flutter/material.dart';
import 'home_page.dart';

class DataSearch extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        color: Colors.black, // Atur warna ikon
        onPressed: () {
          query = '';
          showSuggestions(context); // Tampilkan saran pencarian kosong
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      color: Colors.black, // Atur warna ikon
      onPressed: () {
        close(context, ''); // Kembalikan string kosong ketika tombol kembali ditekan
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Tampilkan hasil pencarian langsung
    return Center(
      child: Text('Hasil pencarian untuk: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Tampilkan saran pencarian
    final List<String> suggestions = [
      'Mobil ABC',
      'Mobil XYZ',
      'Mobil 123',
      'Mobil 456',
    ];

    final List<String> filteredSuggestions = query.isEmpty
        ? suggestions
        : suggestions
            .where((suggestion) =>
                suggestion.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () {
            query = filteredSuggestions[index];
            showResults(context); // Tampilkan hasil pencarian langsung
          },
        );
      },
    );
  }
}
