import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My demo Calculator',
      theme: ThemeData(

        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green
        ),
      ),
      home: const MyHomePage(title: 'my Demo Home Page'),
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
  double _result = 0;
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  String _dropdownvalue = 'Addition';
  var operations = [
    'Addition',
    'Subtraction',
    'Multiplication',
    'Division'
  ];


  void Calculate() {
    print('Input entered: ' + myController1.text);
    print('Input entered: ' + myController2.text);
    print('Operation Selected: '+ _dropdownvalue);
    print('Button pressed');
    if (_dropdownvalue == 'Addition'){
      setState(() {
        _result = double.parse(myController1.text) + double.parse(myController2.text);
      });
      print(_result);
    }
    if (_dropdownvalue == 'Subtraction'){
      setState(() {
        _result = double.parse(myController1.text) - double.parse(myController2.text);
      });
      print(_result);
    }
    if (_dropdownvalue == 'Multiplication'){
      setState(() {
        _result = double.parse(myController1.text) * double.parse(myController2.text);
      });
      print(_result);
    }
    if (_dropdownvalue == 'Division'){
      setState(() {
        _result = double.parse(myController1.text) / double.parse(myController2.text);
      });
      print(_result);
    }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: Text('Calculator'),
        ),
        body: Center(

          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: const Text(
                    'Type in first Number:',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: myController1,

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Type in next number:',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: myController2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Operation: '),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DropdownButtonFormField(value: _dropdownvalue,items: operations.map(
                      (e)=>DropdownMenuItem(child: Text(e),value: e,)
                  ).toList(), onChanged: (val){
                    setState(() {
                      _dropdownvalue = val as String;
                    });
                  }),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(onPressed: Calculate,
                  child: Text('Calculate'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.green
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Result: $_result'),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
