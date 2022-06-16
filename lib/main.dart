import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<bool> load() async {
    await Future.delayed(const Duration(seconds: 3), () {});

    return true;
  }

  @override
  Widget build(BuildContext context) {
    print('rebuilding home');

    return Scaffold(
      body: FutureBuilder(
        future: load(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('future builder firing...');
          if (snapshot.hasError) {
            return Text(
              'Error!',
              style: Theme.of(context).textTheme.subtitle1,
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text(
              'Loading...',
              style: Theme.of(context).textTheme.subtitle1,
            );
          }

          return Text(
            'Loaded!',
            style: Theme.of(context).textTheme.subtitle1,
          );
        },
      ),
    );
  }
}
