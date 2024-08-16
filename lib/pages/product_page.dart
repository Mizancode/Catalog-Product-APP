import 'package:catalog_product/global_variable.dart';
import 'package:catalog_product/pages/product_details.dart';
import 'package:catalog_product/widgets/product_list.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> filter = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectFilter;
  @override
  void initState() {
    super.initState();
    selectFilter = filter[0];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const border = OutlineInputBorder(
      borderSide: BorderSide(width: 1),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(40)),
    );
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Row(
              children: [
                const Text(
                  'Catalog\nProducts',
                  style: TextStyle(
                      fontFamily: 'assets/fonts/Lato-Regular.ttf',
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(width: size.width > 650 ? size.width * 0.5 : 20),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      border: border,
                      enabledBorder: border,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 40,
            child: Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filter.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          selectFilter = filter[index];
                          setState(() {});
                        },
                        child: Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          label: Text(filter[index]),
                          backgroundColor: selectFilter == filter[index]
                              ? Colors.amber
                              : Colors.white,
                        ),
                      ),
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: size.width > 650
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.75),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(map: products[index])));
                        },
                        child: ProductView(
                            products[index]['title'],
                            products[index]['price'],
                            products[index]['imageUrl'],
                            index),
                      );
                    })
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetails(map: products[index])));
                        },
                        child: ProductView(
                            products[index]['title'],
                            products[index]['price'],
                            products[index]['imageUrl'],
                            index),
                      );
                    }),
          )
        ]),
      ),
    );
  }
}
