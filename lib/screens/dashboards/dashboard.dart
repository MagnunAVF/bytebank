import 'package:bytebank/screens/deposit/form.dart';
import 'package:bytebank/screens/transfer/form.dart';
import 'package:bytebank/screens/transfer/latest.dart';
import 'package:flutter/material.dart';
import 'balance.dart';

const _appBarTitle = 'Bytebank';
const _receiveDepositText = 'Receive Deposit';
const _newTransferText = 'New Transfer';

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
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(_receiveDepositText),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DepositForm();
                  }));
                },
              ),
              RaisedButton(
                child: Text(_newTransferText),
                color: Colors.green,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TransferForm();
                  }));
                },
              ),
            ],
          ),
          LatestTransfers(),
        ],
      ),
    );
  }
}
