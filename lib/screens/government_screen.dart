import 'package:city/core/widgets/tab_bar_view.dart';
import 'package:city/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:city/core/utils/variables.dart';
import 'package:city/core/widgets/tab_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';

final Uri _url = Uri.parse('https://dribbble.com/shots/popular/mobile');

class GovernmentScreen extends StatelessWidget {
  const GovernmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('سيتم تحويلك خارج تطبيق citio'),
              content: const Text('هل أنت متأكد بأنك ترغب بالرحيل'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('الغاء'),
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(_url, mode: LaunchMode.inAppWebView);
                  },
                  child: const Text('نعم'),
                ),
              ],
            ),
          ),

          //launchUrl(_url, mode: LaunchMode.inAppWebView);

          child: CircleAvatar(
            radius: 55,
            backgroundColor: MyColors.themecolor,
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
                  color: MyColors.cardcolor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              labelColor: MyColors.cardfontcolor,
              unselectedLabelColor: MyColors.black,
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

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
