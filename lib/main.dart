import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obesity Calculator',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {

  // TextField 의 현재값을 얻는데 필요
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 상태를 모니터링 할수 있음.
    myController.addListener(() {
      print("addListener Text : ${myController.text}");
    });
  }

  @override
  void dispose() {
    // 화면이 종료될때 반드시 컨트롤러 해제해줘야함.
    myController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Input 연습'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (text) {
              print('onChange $text');
            },
          ),
          TextField(
            controller: myController,
          )
        ],
      )
    );
  }
}


