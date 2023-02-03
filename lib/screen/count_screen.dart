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

  void _incrementCounter() {
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              '$counter',
              style: StyleConstant.countTextStyle,
            ),
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
          ],
        ),
      ),
    );
  }
}
