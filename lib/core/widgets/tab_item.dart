import 'package:flutter/material.dart';
//import 'package:city/core/utils/variables.dart';

class TabItem extends StatelessWidget {
  final String title;
  //final int count;
  const TabItem({
    super.key,
    required this.title,
    //required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        /* count > 0
            ? Container(
                margin: const EdgeInsets.only(right: 5),
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 252, 250, 250),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    count > 9 ? "(9+)" : count.toString(),
                    style: const TextStyle(
                      color: Color.fromARGB(133, 9, 9, 9),
                      fontSize: 12,
                    ),
                  ),
                ))
            : const SizedBox(
                width: 0,
                height: 0,
              ),*/
      ],
    ));
  }
}
