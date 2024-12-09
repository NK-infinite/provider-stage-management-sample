import 'package:flutter/material.dart';

import 'count_example.dart';
import 'dark_them.dart';
import 'Example_one.dart';
import 'favorite/favorite_app.dart';
import 'login.dart';


class NotifyLisyernScreen extends StatelessWidget {
  NotifyLisyernScreen({super.key});

  ValueNotifier<int> _count = ValueNotifier<int>(0);
  ValueNotifier<bool> toggal = ValueNotifier<bool>(true);
  TextEditingController pass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notify Listern"),
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
                                      CountExample()));
                        },
                        child: Text("Count Exampal")),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              },
              icon: Icon(Icons.navigate_next),
            )
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("StatelessWidget use as Stateful widgets"),
            ValueListenableBuilder(
              valueListenable: ValueNotifier<int>(pass.text.length),
              builder: (context, value, child) {
                pass.addListener(() {
                  (context as Element).markNeedsBuild(); // Forces rebuild
                });
                return Text(
                    "Password length is: " + pass.text.length.toString());
              },
            ),
            Center(
              child: ValueListenableBuilder(
                  valueListenable: _count,
                  builder: (context, value, child) {
                    return Text(_count.value.toString());
                  }),
            ),
            ValueListenableBuilder(
              valueListenable: toggal,
              builder: (context, value, child) {
                return TextFormField(
                  controller: pass,
                  obscureText: toggal.value,
                  decoration: InputDecoration(
                      suffix: InkWell(
                          onTap: () {
                            toggal.value = !toggal.value;
                          },
                          child: Icon(Icons.visibility_outlined)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _count.value++;
            print(_count.value.toString());
          },
          child: Icon(Icons.add),
        ));
  }
}
