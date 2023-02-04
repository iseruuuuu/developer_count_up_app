import 'package:developer_count_up_app/component/color_container.dart';
import 'package:developer_count_up_app/constants/color_constant.dart';
import 'package:flutter/material.dart';

class RankScreen extends StatelessWidget {
  const RankScreen({
    Key? key,
    required this.rankColor,
  }) : super(key: key);

  final Color rankColor;

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
          const Text('ランク表'),
          Row(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('あなたのランクは、'),
              ColorContainer(color: rankColor),
            ],
          ),
          const Text('次のランクまであと〇〇'),
        ],
      ),
    );
  }
}
