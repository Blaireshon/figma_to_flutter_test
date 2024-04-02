import 'package:figma_to_flutter/figma_to_flutter.dart';
import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Widget> flutterView;

  @override
  void initState(){
    super.initState();
    // getData('JsmdZX9BH4IxJ0YZqnww2q','0-1');
    flutterView = FigmaToFlutter.getData(fileKey: 'JsmdZX9BH4IxJ0YZqnww2q',id: '0-1') as Future<Widget>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Call getData and use its return value in the UI
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffFCAF17),
                  elevation: 0,
                ),
                child: const Text('top position',
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            // Use FutureBuilder to handle the asynchronous operation

            FutureBuilder(
              future: flutterView,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While waiting for data, return a CircularProgressIndicator or a placeholder
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // If there's an error, display an error message
                  return Text('Error: ${snapshot.error}');
                } else {
                  // If data is successfully fetched, return the data widget
                  return snapshot.data ?? Container(); // Make sure to handle null case
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // void getData(String fileKey, String id){
  //   FigmaToFlutter.getData(fileKey: fileKey, id: id);
  // }
  // FigmaToFlutter getData(String fileKey, String id){
  //   return FigmaToFlutter.getData(fileKey: fileKey, id: id);
  // }
}
