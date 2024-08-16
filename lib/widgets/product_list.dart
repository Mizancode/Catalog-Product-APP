import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final title;
  final price;
  final imageUrl;
  final index;
  const ProductView(this.title, this.price, this.imageUrl, this.index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
            color: index.isEven ? Colors.blue.shade50 : Colors.white,
            borderRadius: BorderRadius.circular(20)),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                title.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                '\$$price',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Image(
                image: AssetImage(imageUrl as String),
                height: size.width > 850 ? 175 : 125,
              ),
            )
          ],
        ));
  }
}
