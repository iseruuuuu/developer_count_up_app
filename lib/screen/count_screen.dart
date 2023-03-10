import 'dart:io';

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
  Color rankColor = ColorConstant.black;
  double width = 262;

  @override
  void initState() {
    super.initState();
    checkColor();
  }

  void _incrementCounter() {
    counter++;
    checkColor();
    setPreference();
    changeSize();
    setState(() {});
  }

  void changeSize() async {
    width = 250;
    await Future.delayed(const Duration(milliseconds: 100));
    width = 262;
    setState(() {});
  }

  void checkColor() async {
    counter = await Preference().getInt(PreferenceKey.counter);
    //TODO switch文を使う。
    if (counter >= 100 && counter <= 500) {
      rankColor = ColorConstant.grey;
    } else if (counter >= 500 && counter <= 1000) {
      rankColor = ColorConstant.brown;
    } else if (counter >= 1000 && counter <= 1500) {
      rankColor = ColorConstant.green;
    } else if (counter >= 1500 && counter <= 2000) {
      rankColor = ColorConstant.lightBlue;
    } else if (counter >= 2000 && counter <= 2500) {
      rankColor = ColorConstant.blue;
    } else if (counter >= 2500 && counter <= 3000) {
      rankColor = ColorConstant.yellow;
    } else if (counter >= 3000 && counter <= 3500) {
      rankColor = ColorConstant.orange;
    } else if (counter >= 4000) {
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
      backgroundColor: ColorConstant.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: rankColor,
          elevation: 0,
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            Container(
              width: context.screenWidth / 1.5,
              height: 70,
              decoration: BoxDecoration(
                border: Border.all(color: rankColor, width: 4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  '$counter',
                  style: StyleConstant.countTextStyle,
                ),
              ),
            ),
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              width: width,
              height: width,
              decoration: BoxDecoration(
                border: Border.all(color: rankColor, width: 4),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: FloatingActionButton(
                  focusColor: rankColor,
                  backgroundColor: rankColor,
                  foregroundColor: rankColor,
                  onPressed: () {
                    _incrementCounter();
                  },
                  child: Text(
                    'TAP',
                    style: StyleConstant.tapLabel,
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
