import "package:catalog_product/utils/provider_product_add.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class ProductDetails extends StatefulWidget {
  final Map<String, dynamic> map;
  const ProductDetails({super.key, required this.map});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int select;
  @override
  void initState() {
    super.initState();
    select = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'assets/fonts/Lato-Bold.ttf'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.map['title'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage(widget.map['imageUrl'].toString()),
                height: 250,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              '\$${widget.map['price'].toString()}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              alignment: Alignment.centerLeft,
              child: const Text(
                'UK Sizes:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.map['sizes'].length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        select = index;
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Chip(
                            backgroundColor: select == index
                                ? Colors.amber
                                : Colors.blue.shade50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            label: Text(widget.map['sizes'][index].toString())),
                      ),
                    );
                  }),
            ),
            const Spacer(),
            Consumer<ProviderProductAdd>(
              builder: (context, value, child) {
                return ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: () {
                      select == -1
                          ? ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                              content: Text('Please Select Size'),
                              duration: Duration(seconds: 1),
                            ))
                          : value.add(widget.map);
                    },
                    child: Container(
                      width: 120,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.trolley,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Add To Cart',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ));
              },
            )
          ],
        ),
      ),
    );
  }
}
