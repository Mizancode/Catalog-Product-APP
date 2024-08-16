import 'package:catalog_product/utils/provider_product_add.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MarkedList extends StatelessWidget {
  const MarkedList({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderProductAdd>(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                  title: const Text(
                    'Cart Items',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'assets/fonts/Lato-Bold.ttf'),
                  ),
                  centerTitle: true,
                  automaticallyImplyLeading: false),
              body: Container(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: value.marked.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            value.marked[index]['imageUrl'].toString(),
                          ),
                        ),
                        title: Text(
                          value.marked[index]['title'].toString(),
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            color: Colors.red,
                            Icons.delete,
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Delete Product'),
                                    content: const Text(
                                        'Are you sure want to delete?'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('No')),
                                      TextButton(
                                          onPressed: () {
                                            value.removed(value.marked[index]);
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Yes')),
                                    ],
                                  );
                                });
                          },
                        ),
                      );
                    }),
              )),
        );
      },
    );
  }
}
