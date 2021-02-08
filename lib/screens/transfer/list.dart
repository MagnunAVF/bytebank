import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form.dart';

const _appBarTitle = 'Transfers';

class TransfersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: Consumer<Transfers>(
        builder: (context, transfers, child) {
          return ListView.builder(
            itemCount: transfers.transfers.length,
            itemBuilder: (context, index) {
              final transfer = transfers.transfers[index];
              return TransferItem(transfer);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferForm();
          }));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  TransferItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.toStringValue()),
        subtitle: Text(_transfer.toStringAccount()),
      ),
    );
  }
}
