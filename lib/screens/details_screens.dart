import 'package:flutter/material.dart';

import '../widgets/reusable_row.dart';

class DetailScreen extends StatefulWidget {
  String name;
  String image;
  int? active, recovered, critical, tests, deaths, cases;
  DetailScreen(
      {required this.name,
      required this.image,
      required this.critical,
      required this.active,
      required this.deaths,
      required this.recovered,
      required this.cases,
      required this.tests});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name.toString(),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(widget.image),
                        ),
                      ),
                      ReusableRow(title: 'Cases', value: widget.cases.toString()),
                      ReusableRow(title: 'Tests', value: widget.tests.toString()),
                      ReusableRow(title: 'Active', value: widget.active.toString()),
                      ReusableRow(title: 'Critical', value: widget.critical.toString()),
                      ReusableRow(title: 'Recovered', value: widget.recovered.toString()),
                      ReusableRow(title: 'Death', value: widget.deaths.toString()),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
