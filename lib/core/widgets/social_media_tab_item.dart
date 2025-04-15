import 'package:flutter/material.dart';
//import 'package:city/core/utils/variables.dart';

class SocialMediaTabItem extends StatelessWidget {
  SocialMediaTabItem({
    required this.data,
    required this.reacts_count,
    required this.comments_count,
    required this.share_count,
    Key? key,
  }) : super(key: key);
  String data;
  int reacts_count;
  int comments_count;
  int share_count;

  @override
  Widget build(BuildContext context) {
    return Tab(child: Container());
  }
}
