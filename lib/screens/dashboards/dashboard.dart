import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'balance.dart';

const _appBarTitle = 'Bytebank';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_appBarTitle)),
      body: ListView(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: BalanceCard(),
          ),
          RaisedButton(
            child: Text('Receive Deposit'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DepositForm();
              }));
            },
          ),
        ],
      ),
    );
  }
}
