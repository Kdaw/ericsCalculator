import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String screenVal = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/ericbg.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(screenVal)],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumberKey(num: 1),
                      getNumberKey(num: 2),
                      getNumberKey(num: 3),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumberKey(num: 4),
                      getNumberKey(num: 5),
                      getNumberKey(num: 6),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumberKey(num: 7),
                      getNumberKey(num: 8),
                      getNumberKey(num: 9),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            screenVal = '';
                          });
                        },
                        child: Text('Clear'),
                      ),
                      getNumberKey(num: 0),
                      SizedBox(width: 64),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getNumberKey({required int num}) {
    Widget widg;

    widg = TextButton(
      onPressed: () {
        setState(() {
          screenVal += num.toString();
        });
        print('Value:$screenVal');
      },
      child: Text(num.toString()),
    );

    return widg;
  }
}
