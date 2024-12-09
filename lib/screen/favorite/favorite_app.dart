import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/Them_Provider.dart';
import '../../Provider/favorite_provider.dart';
import '../count_example.dart';
import '../dark_them.dart';
import '../Example_one.dart';
import '../login.dart';
import 'package:state_management/screen/value_notify_listener.dart';
import 'favorite_item.dart';

class FavoriteApp extends StatefulWidget {
  const FavoriteApp({super.key});

  @override
  State<FavoriteApp> createState() => _favoriteappState();
}

class _favoriteappState extends State<FavoriteApp> {
  List<int> selecteditem = [];
  var select;

  Widget build(BuildContext context) {
    print("Favourite");

    return Scaffold(
      appBar: AppBar(
     //   backgroundColor: Color(0xFF6B848B),
        title: Text("Favourite"),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.settings),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>ExampleOne ()));
                      },
                      child: Text('Multi Provider')),
                ),
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>CountExample ()));
                      },
                 child: Text("Count Exampal")),
                ),
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DarkThem()));
                      },
                      child: Text("Them")),
                ),
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    NotifyLisyernScreen()));
                      },
                      child: Text("Notify Listern")),
                ),
                PopupMenuItem(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Login()));
                      },
                      child: Text("Login")),
                ),
              ]),
          Consumer<ThemProvider>(builder: (context, value, child) {
            return Padding(
                padding: const EdgeInsets.only(right: 13),
                child: PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: IconButton(
                        icon: Icon(Icons.favorite),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => FavouritItem())));
                        },
                      ),
                    ),
                    PopupMenuItem(
                      child: IconButton(
                        icon: Icon(Icons.navigate_next),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DarkThem()));
                        },
                      ),
                    ),
                  ],
                ));
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 21,
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
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
