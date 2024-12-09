import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/count_provider.dart';
import 'package:state_management/Screen/Example_one.dart';
import 'package:state_management/screen/value_notify_listener.dart';
import 'dark_them.dart';
import 'favorite/favorite_app.dart';
import 'login.dart';

class CountExample extends StatefulWidget {
  const CountExample({super.key});

  @override
  State<CountExample> createState() => _CountExampleState();
}

class _CountExampleState extends State<CountExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Timer");
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("Build1");

    return Scaffold(
      appBar: AppBar(
        //   backgroundColor: Color(0xFF6B848B),
        title: Text("Count Exampal"),

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
                                    builder: (context) =>  FavoriteApp()));
                          },
                          child: Text('Favourit_app')),
                    ),
                    PopupMenuItem(
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ExampleOne()));
                          },
                          child: Text("Multi Provider")),
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
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ExampleOne())));
              },
              icon: Icon(Icons.navigate_next))
        ],
      ),
      body: Center(
        child: Consumer<CountProvider>(builder: (contex, value, child) {
          //  print("${countProvider.count.toString()} Only widget Build");
          return Text(
            "-" + DateTime.now().toString() + "\n-" + value.count.toString(),
            style: TextStyle(fontSize: 20),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
