import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/screen/value_notify_listener.dart';
import '../Provider/Auth_provider.dart';
import '../Provider/Them_Provider.dart';
import 'count_example.dart';
import 'dark_them.dart';
import 'Example_one.dart';
import 'favorite/favorite_app.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _loginState();
}

class _loginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController Email = TextEditingController();
    TextEditingController Password = TextEditingController();
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(

        title: Text('Login'),
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
                              builder: (context) => const ExampleOne()));
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
                              builder: (context)=>CountExample()));
                    },
                    child: Text("Count Exampal")),
              ),
            ]),
      ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Text("    email: eve.holt@reqres.in"),
            TextFormField(
              controller: Email,
              decoration: InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 50,
            ),
            Text("email: cityslicka"),
            TextFormField(
              controller: Password,
              decoration: InputDecoration(
                  label: Text("Password"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20))),
            ),
            SizedBox(
              height: 50,
            ),
            Consumer<ThemProvider>(
              builder: (context, themeProvider, child) {
                return InkWell(
                  onTap: () {
                    authProvider.login(
                      Email.text.toString(),
                      Password.text.toString(),
                    );
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: themeProvider.containerColor, // Correct reference
                      border: Border.all(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child:

                      Text(
                          "Login",
                          style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                    ),
                ),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
