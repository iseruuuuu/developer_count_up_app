import 'package:flutter/material.dart';

extension CheckRank on BuildContext {
  String checkRank(int counter) {
    if (counter >= 100 && counter <= 500) {
      return '次のランクまであと${500 - counter}';
    }
    if (counter >= 500 && counter <= 1000) {
      return '次のランクまであと${1000 - counter}';
    }
    if (counter >= 1000 && counter <= 1500) {
      return '次のランクまであと${1500 - counter}';
    }
    if (counter >= 1500 && counter <= 2000) {
      return '次のランクまであと${2000 - counter}';
    }
    if (counter >= 2000 && counter <= 2500) {
      return '次のランクまであと${2500 - counter}';
    }
    if (counter >= 2500 && counter <= 3000) {
      return '次のランクまであと${3000 - counter}';
    }
    if (counter >= 3000 && counter <= 3500) {
      return '次のランクまであと${3500 - counter}';
    }
    if (counter >= 4000) {
      return '次のランクまであと${4000 - counter}';
    } else {
      return '次のランクまであと${100 - counter}';
    }
    return '';
  }
}
