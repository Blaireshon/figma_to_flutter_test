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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      //   home:Scaffold(
      //       backgroundColor: Colors.white,
      //       body: MyHomePage()
      //   )
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
    flutterView = FigmaToFlutter.getData(fileKey: 'JsmdZX9BH4IxJ0YZqnww2q',id: '151-558');
  }

  @override
  Widget build(BuildContext context) {
    print('hi');
    // final Future<Widget> flutterView = FigmaToFlutter.getData(fileKey: 'JsmdZX9BH4IxJ0YZqnww2q',id: '1-2');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: flutterView,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // While waiting for data, return a CircularProgressIndicator or a placeholder
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // If there's an error, display an error message
                  return Text('Error: ${snapshot.error}');
                } else {
                  return  snapshot.data ?? Container();
                }

              },
            ),
          ],
        ),
      ),

    );
  }
}
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late Widget? flutterView;
//
//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }
//
//   void _init() {
//     try {
//       flutterView =  FigmaToFlutter.getData(fileKey: 'JsmdZX9BH4IxJ0YZqnww2q', id: '1-2');
//       setState(() {}); // 데이터를 받은 후 화면을 다시 그리도록 setState 호출
//     } catch (e) {
//       print('Error initializing flutterView: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (flutterView != null)
//             flutterView!
//           else
//             CircularProgressIndicator(), // flutterView가 null인 경우 로딩 표시
//
//         ],
//       ),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   late Widget flutterView;
//
//   MyHomePage({super.key}){
//     _init();
//   }
//   void _init(){
//     flutterView = FigmaToFlutter.getData(fileKey: 'JsmdZX9BH4IxJ0YZqnww2q', id: '1-2');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           flutterView
// //           FutureBuilder(
// //             future: FigmaToFlutter.getData(fileKey: 'JsmdZX9BH4IxJ0YZqnww2q', id: '1-2'),
// //             builder: (context, snapshot) {
// //               if (snapshot.connectionState == ConnectionState.waiting) {
// // // While waiting for data, return a CircularProgressIndicator or a placeholder
// //                 return const CircularProgressIndicator();
// //               } else if (snapshot.hasError) {
// // // If there's an error, display an error message
// //                 return Text('Error: ${snapshot.error}');
// //               } else {
// //                 return  snapshot.data ?? Container();
// //               }
// //             },
// //           ),
//         ],
//       ),
//     );
//   }
// }
