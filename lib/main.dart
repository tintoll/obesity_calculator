import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Obesity Calculator',
      home: Scaffold(
          appBar: AppBar(
            title: Text('폼 검증 데모'),
          ),
          body: MyCustomForm()),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Form 위젯에 유니크한 키값을 부여하고 검증시 사용
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return '입력값을 입력하세요';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                // 폼 검증을 통과하면 true, 아니면 false
                if (_formKey.currentState.validate()) {
                  // 스낵바 표시
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('검증완료')));
                }
              },
              child: Text('검증'),
            ),
          )
        ],
      ),
    );
  }
}
