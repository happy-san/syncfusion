import 'package:flutter/material.dart';

import 'tabs/bargraph.dart';
import 'tabs/linegraph.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.trending_up)),
              Tab(icon: Icon(Icons.bar_chart)),
            ],
          ),
          title: Text('Syncfusion charts'),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            Linegraph(),
            Material(
              child: Bargraph(),
              color: Colors.lightGreen[50],
            ),
          ],
        ),
      ),
    );
  }
}
