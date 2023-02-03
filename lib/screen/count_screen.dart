import 'package:developer_count_up_app/constants/color_constant.dart';
import 'package:developer_count_up_app/constants/style_constant.dart';
import 'package:developer_count_up_app/extension/deviceSize.dart';
import 'package:flutter/material.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int counter = 0;
  String message = '';

  void _incrementCounter() {
    if (counter % 10 == 9) {
      print('ありがとう');
      message = 'ありがとう';
    } else {
      message = '';
    }

    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.appBarColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            Text('$counter', style: StyleConstant.countTextStyle),
            const SizedBox(height: 20),
            Text(message, style: StyleConstant.messageTextStyle),
            const Spacer(),
            SizedBox(
              width: context.screenWidth / 3.5,
              height: context.screenWidth / 3.5,
              child: FloatingActionButton(
                focusColor: ColorConstant.appBarColor,
                backgroundColor: ColorConstant.appBarColor,
                foregroundColor: ColorConstant.appBarColor,
                onPressed: () {
                  _incrementCounter();
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
