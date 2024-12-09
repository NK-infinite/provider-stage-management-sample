import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/favorite_provider.dart';


class FavouritItem extends StatefulWidget {
  const FavouritItem({super.key});

  @override
  State<FavouritItem> createState() => _favoriteItemState();
}

class _favoriteItemState extends State<FavouritItem> {
  @override

  Widget build(BuildContext context) {
    final Item = Provider.of<FavoriteProvider>(context, listen: false);
    var num =Item.selecteditem.length;
    return Scaffold(
      appBar: AppBar(
      //  backgroundColor: Color(0xFF6B848B),
        title: Text("Favourit Items"),
      ),
      body: Column(
        children: [
          Expanded(

            child: ListView.builder(
                itemCount: num,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selecteditem.contains(index)) {
                            value.removeitem(index);
                          } else {
                            value.additem(index);
                          }
                        },
                        title: Text("Item" + index.toString()),
                        trailing: Icon(
                          value.selecteditem.contains(index)
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
