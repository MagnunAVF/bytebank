import 'package:flutter/material.dart';
import 'balance.dart';

const _appBarTitle = 'Bytebank';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: Align(
        alignment: Alignment.topCenter,
        child: BalanceCard(),
      ),
    );
  }
}
