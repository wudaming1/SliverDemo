import 'package:flutter/material.dart';
import 'package:sliver/page_1.dart';
import 'package:sliver/page_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void gotoStackedSliver() {
    Navigator.of(context).push(MaterialPageRoute(builder: (c){
      return const Page1();
    }));
  }

  void gotoSliverAnchor() {
    Navigator.of(context).push(MaterialPageRoute(builder: (c){
      return const Page2();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Demo Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: gotoStackedSliver,
              child: const Text('Stacked Sliver Demo')),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: gotoSliverAnchor,
              child: const Text('Sliver Anchor Demo')),
        ],
      ),
    );
  }
}
