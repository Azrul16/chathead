import 'package:bubble_head/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Bubble _bubble = Bubble(showCloseButton: true);

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> startBubbleHead() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      await _bubble.startBubbleHead(sendAppToBackground: false);
    } on PlatformException {
      print('Failed to call startBubbleHead');
    }
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> stopBubbleHead() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      await _bubble.stopBubbleHead();
    } on PlatformException {
      print('Failed to call stopBubbleHead');
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Chathead Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Tap these buttons to turn on or off the chatheads',
            ),
            Container(
              margin: EdgeInsets.all(50),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green, // Icon and text color
                      elevation: 5, // Button elevation
                    ),
                    onPressed: () {
                      startBubbleHead();
                    },
                    child: Row(
                      children: [
                        Text(
                          'Start',
                        ),
                        Icon(Icons.play_arrow)
                      ],
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red, // Icon and text color
                      elevation: 5, // Button elevation
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text(
                          'Stop',
                        ),
                        Icon(Icons.stop),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
