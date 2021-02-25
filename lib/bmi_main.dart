import 'package:flutter/material.dart';
import 'package:obesity_calculator/bmi_result.dart';

class BmiMain extends StatefulWidget {
  @override
  _BmiMainState createState() => _BmiMainState();
}

class _BmiMainState extends State<BmiMain> {
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비만도 계산기'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _heightController,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return '키를 입력하세요';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    // 외곽선이 있고 힌트 '키'를 표시
                    border: OutlineInputBorder(),
                    hintText: '키'),
                keyboardType: TextInputType.number, // 숫자만 입력할 수 있음
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _weightController,
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return '몸무게를 입력하세요';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: '몸무게'),
                keyboardType: TextInputType.number,
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  onPressed: () {
                    // 폼 검증
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BmiResult(
                                  double.parse(_heightController.text.trim()),
                                  double.parse(
                                      _weightController.text.trim()))));
                    }
                  },
                  child: Text('결과'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
