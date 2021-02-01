import 'file:///C:/FlutterProjects/bytebank/lib/screens/dashboards/balance.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'Bytebank';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: Align(
        alignment: Alignment.topCenter,
        child: BalanceCard(
          Balance(21.00),
        ),
      ),
    );
  }
}
