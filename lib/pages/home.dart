import 'package:catalog_product/widgets/marked_list.dart';
import 'package:catalog_product/pages/product_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  List<Widget> list = const [ProductPage(), MarkedList()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          currentPage = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Book Marked'),
        ],
      ),
    );
  }
}
