import 'package:city/core/widgets/custom_card.dart';
import 'package:city/models/request.dart';
import 'package:city/services/get_requests_by_status.dart';
import 'package:flutter/material.dart';

class TabBarViewItem extends StatelessWidget {
  final String title;

  const TabBarViewItem({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Request>>(
      future: RequestsByStatus().getRequestsByStatus(status: this.title),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Request> requests = snapshot.data!;
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: requests.length,
            itemBuilder: (context, index) {
              return Container(
                child: CustomCard(request: requests[index]),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
