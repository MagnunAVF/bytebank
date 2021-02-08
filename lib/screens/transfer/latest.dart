import 'package:bytebank/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:provider/provider.dart';

const _title = 'Latest Transfers';
const _transfersText = 'See All Transfers';
const _withoutTransfersText = 'You have not made any transfers';

class LatestTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          _title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        Consumer<Transfers>(builder: (context, transfers, child) {
          final _latestTransfers = transfers.transfers.reversed.toList();
          final _quantity = transfers.transfers.length;
          int _length = 2;

          if (_quantity == 0) {
            return WithoutTransfers();
          }

          if (_quantity < 2) {
            _length = _quantity;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: _length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return TransferItem(_latestTransfers[index]);
            },
          );
        }),
        RaisedButton(
          child: Text(_transfersText),
          color: Colors.green,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return TransfersList();
            }));
          },
        ),
      ],
    );
  }
}

class WithoutTransfers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          _withoutTransfersText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }}