import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        accentColor: Colors.red,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var num1 = 0, num2 = 0, sum = 0;

  final TextEditingController t1 = TextEditingController(text: "0");
  final TextEditingController t2 = TextEditingController(text: "0");

  void doAddition() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 + num2;
    });
  }

  void doSub() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 - num2;
    });
  }

  void doMul() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      sum = num1 * num2;
    });
  }

  void doDiv() {
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      if (num2 != 0) {
        sum = num1 ~/ num2; // Perform integer division
      } else {
        // Handle division by zero case
        sum = 0; // For example, setting sum to 0
      }
    });
  }

  void doClear() {
    setState(() {
      t1.text = "0";
      t2.text = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Output: $sum",
              style: const TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: t1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter a number"),
            ),
            TextField(
              controller: t2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: "Enter a number"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(onPressed: doAddition, child: const Text("+")),
                MaterialButton(onPressed: doMul, child: const Text("*")),
                MaterialButton(onPressed: doSub, child: const Text("-")),
                MaterialButton(onPressed: doDiv, child: const Text("/")),
              ],
            ),
            MaterialButton(
              onPressed: doClear,
              child: Text("clear"),
            )
          ],
        ),
      ),
    );
  }
}
