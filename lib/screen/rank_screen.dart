import 'package:developer_count_up_app/component/color_container.dart';
import 'package:developer_count_up_app/constants/color_constant.dart';
import 'package:developer_count_up_app/constants/style_constant.dart';
import 'package:developer_count_up_app/extension/check_rank.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({
    Key? key,
    required this.rankColor,
    required this.counter,
  }) : super(key: key);

  final Color rankColor;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: rankColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          //TODO デザインを一新する。
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('ランク表', style: StyleConstant.rankLabel),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorContainer(color: ColorConstant.black),
                ColorContainer(color: ColorConstant.grey),
                ColorContainer(color: ColorConstant.brown),
                ColorContainer(color: ColorConstant.green),
                ColorContainer(color: ColorConstant.lightBlue),
                ColorContainer(color: ColorConstant.blue),
                ColorContainer(color: ColorConstant.yellow),
                ColorContainer(color: ColorConstant.orange),
                ColorContainer(color: ColorConstant.red),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'あなたのランクは、',
                  style: StyleConstant.rankLabel,
                ),
                ColorContainer(color: rankColor),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              context.checkRank(counter),
              style: StyleConstant.rankLabel,
            ),
          ),
        ],
      ),
    );
  }
}
