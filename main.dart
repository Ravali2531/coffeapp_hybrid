import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCounterDemo(),
    );
  }
}

class MyCounterDemo extends StatefulWidget {
  const MyCounterDemo({super.key});

  @override
  State<MyCounterDemo> createState() => _MyCounterDemoState();
}

class _MyCounterDemoState extends State<MyCounterDemo> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  void decrement(){
    setState(() {
      _counter--;
      if(_counter <= 0) {
        _counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Counter"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.asset('asset/coffee.jpg', height: 150, width: 150,),
            Text("Welcome to the coffee shop"),
            SizedBox(height: 50,),
            Row(
              children: [
                SizedBox(width: 50,),
                ElevatedButton(onPressed: () {
                  increment();
                }, child: Text('+')),
                SizedBox(width: 50,),
                Text('Count is: $_counter'),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: () {
                  decrement();
                }, child: Text('-'))
              ],
             ),
            SizedBox(height: 50,),
            Text("The price of the coffe is \$5",style: TextStyle(fontSize: 30),),
            SizedBox(height: 50,),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Please pay ${_counter * 5} dollars")
              ));
            }, child: Text("Click here to order"))
            
        ],
        ),
      ),
    );
  }
}
