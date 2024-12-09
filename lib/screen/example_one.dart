import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screen/value_notify_listener.dart';
import '../provider/exampal_one_provider.dart';
import 'count_example.dart';
import 'dark_them.dart';
import 'favorite/favorite_app.dart';
import 'login.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({super.key});

  @override
  State<ExampleOne> createState() => _ExampalOneState();
}

class _ExampalOneState extends State<ExampleOne> {


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Exampaleoneprovider> (context,listen: false);
    print("Slider Bulid");
    return Scaffold(
      appBar: AppBar(
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
                                builder: (context) => FavoriteApp()));
                      },
                      child: Text('Favourit_app')),
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
        IconButton(onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: ((context) => FavoriteApp())));
    },icon: const Icon(Icons.navigate_next)
        )
    ],
       // backgroundColor: Color(0xFF6B848B),
        title: Center(child: Text("Multi Provider")),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<Exampaleoneprovider>(builder: (context,value,child) {
            return Slider(
              label: 'color',
            activeColor: Colors.red.withOpacity(value.value),
          inactiveColor: Colors.green.withOpacity(value.value),
            min: 0,
            max: 1,
            value: value.value,
            onChanged: (val) {
              provider.setValue(val);

            },
          );
          }),

          Consumer<Exampaleoneprovider>(builder: (context ,value , child) {
            return
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.green.withOpacity(value.value),
                  child: Center(child: Text("Container 1")),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.red.withOpacity(value.value),
                  child: Center(child: Text("Container 2")),
                ),
              ),
            ]
            );
          },
          ),
            ],
          )

    );

  }
}
