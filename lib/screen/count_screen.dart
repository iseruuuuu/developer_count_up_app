import 'package:developer_count_up_app/constants/color_constant.dart';
import 'package:developer_count_up_app/constants/style_constant.dart';
import 'package:developer_count_up_app/extension/deviceSize.dart';
import 'package:developer_count_up_app/preference/shared_preference.dart';
import 'package:developer_count_up_app/screen/rank_screen.dart';
import 'package:flutter/material.dart';

class CountScreen extends StatefulWidget {
  const CountScreen({Key? key}) : super(key: key);

  @override
  State<CountScreen> createState() => _CountScreenState();
}

class _CountScreenState extends State<CountScreen> {
  int counter = 0;
  Color rankColor = ColorConstant.black;

  @override
  void initState() {
    super.initState();
    checkColor();
  }

  void _incrementCounter() {
    counter++;
    checkColor();
    setPreference();
    setState(() {});
  }

  void checkColor() async {
    counter = await Preference().getInt(PreferenceKey.counter);
    //TODO switch文を使う。
    if (counter >= 10 && counter <= 200) {
      rankColor = ColorConstant.grey;
    } else if (counter >= 200 && counter <= 300) {
      rankColor = ColorConstant.brown;
    } else if (counter >= 300 && counter <= 400) {
      rankColor = ColorConstant.green;
    } else if (counter >= 400 && counter <= 1200) {
      rankColor = ColorConstant.lightBlue;
    } else if (counter >= 1200 && counter <= 1500) {
      rankColor = ColorConstant.blue;
    } else if (counter >= 1500 && counter <= 1800) {
      rankColor = ColorConstant.yellow;
    } else if (counter >= 1800 && counter <= 2000) {
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
      backgroundColor: ColorConstant.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: rankColor,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RankScreen(
                      rankColor: rankColor,
                      counter: counter,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.question_mark),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Spacer(),
            Text('$counter', style: StyleConstant.countTextStyle),
            const Spacer(),
            SizedBox(
              width: context.screenWidth / 2.5,
              height: context.screenWidth / 2.5,
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
            SizedBox(
              height: 100,
              child: AppBar(backgroundColor: rankColor),
            ),
          ],
        ),
      ),
    );
  }
}
