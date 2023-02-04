// Flutter imports:
import 'package:developer_count_up_app/constants/color_constant.dart';
import 'package:developer_count_up_app/preference/shared_preference.dart';
import 'package:developer_count_up_app/screen/count_screen.dart';
import 'package:developer_count_up_app/screen/rank_screen.dart';
import 'package:flutter/material.dart';

// Package imports:

// Project imports:

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedIndex = 0;
  int counter = 0;
  Color rankColor = ColorConstant.black;

  @override
  void initState() {
    super.initState();
    checkColor();
  }

  void onTap(int index) {
    selectedIndex = index;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: [
        const CountScreen(),
        RankScreen(counter: counter, rankColor: rankColor),
      ][selectedIndex],
      bottomNavigationBar: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0,
              color: Colors.white,
            ),
          ),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: ColorConstant.black,
          unselectedItemColor: ColorConstant.grey,
          iconSize: 30,
          currentIndex: selectedIndex,
          onTap: onTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Check Rank',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
