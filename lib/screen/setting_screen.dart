import 'package:developer_count_up_app/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({
    Key? key,
    required this.rankColor,
  }) : super(key: key);

  final Color rankColor;

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      appBar: AppBar(
        backgroundColor: widget.rankColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: SettingsList(
              lightTheme: SettingsThemeData(
                settingsListBackground: ColorConstant.settingsListBackground,
                settingsSectionBackground:
                    ColorConstant.settingsSectionBackground,
              ),
              sections: [
                SettingsSection(
                  tiles: [
                    SettingsTile.navigation(
                      leading: Icon(
                        Icons.star,
                        color: ColorConstant.yellow,
                      ),
                      title: const Text('レビューを書く'),
                      onPressed: (context) async {
                        await EasyLoading.show(status: 'loading....');
                        await Future.delayed(const Duration(seconds: 2));
                        final inAppReview = InAppReview.instance;
                        if (await inAppReview.isAvailable()) {
                          await EasyLoading.dismiss();
                          await inAppReview.requestReview();
                        }
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        Icons.mail,
                        color: ColorConstant.lightBlue,
                      ),
                      title: const Text('お問い合わせ'),
                      onPressed: (context) async {
                        final url =
                            Uri.parse('https://forms.gle/HLS9FbRo2YcWDHev5');
                        if (!await launchUrl(url)) {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        AntDesign.twitter,
                        color: ColorConstant.blue,
                      ),
                      title: const Text('開発者'),
                      onPressed: (context) async {
                        final url =
                            Uri.parse('twitter://user?screen_name=isekiryu');
                        final secondUrl =
                            Uri.parse('https://twitter.com/isekiryu');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else if (await canLaunchUrl(secondUrl)) {
                          await launchUrl(secondUrl);
                        }
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        Icons.local_police,
                        color: ColorConstant.grey,
                      ),
                      title: const Text('ライセンス'),
                      onPressed: (context) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LicensePage(),
                          ),
                        );
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        MaterialCommunityIcons.github,
                        color: ColorConstant.black,
                      ),
                      title: const Text('Github'),
                      onPressed: (context) async {
                        final Uri url = Uri.parse(
                            'https://github.com/iseruuuuu/working_money_timer_app');
                        if (!await launchUrl(url)) {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                    SettingsTile.navigation(
                      leading: Icon(
                        AntDesign.sharealt,
                        color: ColorConstant.black,
                      ),
                      title: const Text('友達に教える'),
                      onPressed: (context) {
                        //TODO urlを変える。
                        //TODO iOS/Androidの条件分岐を追加する
                        Share.share(
                          'https://apps.apple.com/jp/app/%E5%AE%B6%E8%A8%88%E7%B0%BF-%E7%AF%80%E7%B4%84%E8%A8%98%E9%8C%B2/id1660345986',
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
