import 'package:city/core/widgets/tab_bar_view.dart';
import 'package:city/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:city/core/utils/variables.dart';
import 'package:city/core/widgets/tab_item.dart';

class GovernmentScreen extends StatelessWidget {
  const GovernmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Image Clicked!')));
          },
          child: CircleAvatar(
            radius: 55,
            backgroundColor: theme_color,
            child: CircleAvatar(
              backgroundImage: AssetImage('images/logo1.png'),
              radius: 50,
            ),
          ),
        ),
        appBar: AppBar(
          title: Container(
            //margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            // color: Colors.grey.withOpacity(0.3),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                  color: card_color,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelColor: card_font_color,
              unselectedLabelColor: Colors.black,
              tabs: [
                TabItem(
                  title: S.of(context).resolved,
                ),
                TabItem(
                  title: S.of(context).underreview,
                ),
                TabItem(
                  title: S.of(context).rejected,
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          TabBarViewItem(
            title: 'Completed',
          ),
          TabBarViewItem(
            title: 'Pending',
          ),
          TabBarViewItem(
            title: 'Rejected',
          )
        ]),
      ),
    );
  }
}
