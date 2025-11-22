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
  double total = 0;
  String? operation;

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
                  SizedBox(height: 64),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(screenVal, style: TextStyle(fontSize: 20))],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumberKey(num: 1),
                      getNumberKey(num: 2),
                      getNumberKey(num: 3),
                      TextButton(onPressed: add, child: Text('+')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumberKey(num: 4),
                      getNumberKey(num: 5),
                      getNumberKey(num: 6),
                      TextButton(onPressed: () {}, child: Text('-')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getNumberKey(num: 7),
                      getNumberKey(num: 8),
                      getNumberKey(num: 9),
                      TextButton(onPressed: () {}, child: Text('*')),
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
                      TextButton(onPressed: equals, child: Text('=')),
                      TextButton(onPressed: () {}, child: Text('/')),
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

  void add() {
    String val;

    if (screenVal.contains('+')) {
      val = screenVal.substring(screenVal.indexOf('+') + 1);
    } else {
      val = screenVal;
    }

    if (operation == null) {
      total = double.parse(val);
      operation = '+';
    } else {
      total = calculate(val);
      operation = null;
    }
    setState(() {
      screenVal = '${total.toString()}+';
    });
  }

  void equals() {
    if (operation == '+') {
      add();

      setState(() {
        screenVal = total.toString();
      });
    }
  }

  double calculate(String val) {
    double result = 0;

    switch (operation) {
      case '+':
        result = double.parse(val) + total;
    }

    return result;
  }
}
