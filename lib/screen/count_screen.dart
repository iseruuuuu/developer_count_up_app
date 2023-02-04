import 'package:developer_count_up_app/constants/color_constant.dart';
import 'package:developer_count_up_app/constants/style_constant.dart';
import 'package:developer_count_up_app/extension/deviceSize.dart';
import 'package:developer_count_up_app/preference/shared_preference.dart';
import 'package:flutter/material.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int counter = 0;
  String message = '';
  Color rankColor = ColorConstant.black;

  @override
  void initState() {
    super.initState();
    checkColor();
  }

  void _incrementCounter() {
    if (counter % 10 == 9) {
      message = 'ありがとう';
    } else {
      message = '';
    }
    counter++;
    checkColor();
    setPreference();
    setState(() {});
  }

  void checkColor() async {
    counter = await Preference().getInt(PreferenceKey.counter);
    if (counter >= 10) {
      rankColor = ColorConstant.grey;
    } else if (counter >= 300) {
      rankColor = ColorConstant.brown;
    } else if (counter >= 600) {
      rankColor = ColorConstant.green;
    } else if (counter >= 900) {
      rankColor = ColorConstant.lightBlue;
    } else if (counter >= 1200) {
      rankColor = ColorConstant.blue;
    } else if (counter >= 1500) {
      rankColor = ColorConstant.yellow;
    } else if (counter >= 1800) {
      rankColor = ColorConstant.orange;
    } else if (counter >= 2000) {
      rankColor = ColorConstant.red;
    } else {
      rankColor = ColorConstant.black;
    }
    setState(() {});
  }

  void setPreference() {
    Preference().setInt(PreferenceKey.counter, counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: rankColor,
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
                focusColor: rankColor,
                backgroundColor: rankColor,
                foregroundColor: rankColor,
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
