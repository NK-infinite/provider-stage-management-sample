import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/Provider/Them_Provider.dart';
import 'package:state_management/screen/value_notify_listener.dart';
import 'count_example.dart';
import 'example_one.dart';
import 'favorite/favorite_app.dart';
import 'login.dart';


class DarkThem extends StatefulWidget {
  const DarkThem({super.key});

  @override
  State<DarkThem> createState() => _DarkThemState();
}

class _DarkThemState extends State<DarkThem> {
  @override
  Widget build(BuildContext context) {
    final Themechahger = Provider.of<ThemProvider>(context);
    return Scaffold(
      appBar: AppBar(
     //   backgroundColor: Color(0xFF6B848B),
        title: Text("Them"),
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
                                builder: (context) =>CountExample()));
                      },
                      child: Text("Count Exampal")),
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
            return IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NotifyLisyernScreen()));
                }, icon: Icon(Icons.navigate_next));
          })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RadioListTile<ThemeMode>(
              title: Text('Light Them'),
              value: ThemeMode.light,
              groupValue: Themechahger.ThemMode,
              onChanged: Themechahger.setThem),
          RadioListTile<ThemeMode>(
              title: Text('Dark Them'),
              value: ThemeMode.dark,
              groupValue: Themechahger.ThemMode,
              onChanged: Themechahger.setThem),
          RadioListTile<ThemeMode>(
              title: Text('System Them'),
              value: ThemeMode.system,
              groupValue: Themechahger.ThemMode,
              onChanged: Themechahger.setThem),
          Icon(Icons.emoji_emotions)
        ],
      ),
    );
  }
}
