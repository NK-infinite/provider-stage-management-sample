import 'dart:async';

import 'package:flutter/material.dart';

class provider extends StatefulWidget {
  const provider({super.key});

  @override
  State<provider> createState() => _providerState();
}

class _providerState extends State<provider> {
  int number = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  Timer.periodic(Duration(seconds: 1), (timer) {
    number++;
setState(() {

});
    print(number);

  });
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Provider",style: TextStyle(color: Colors.white,fontSize: 35),)),
       // backgroundColor: Colors.green,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child:Text(DateTime.now().hour.toString()+":"+DateTime.now().minute.toString()+":"+DateTime.now().second.toString(),style: TextStyle(fontSize: 35),),),
        Center( child: Text(number.toString(),style: TextStyle(fontSize: 50),))
      ],),
    );
  }
}

