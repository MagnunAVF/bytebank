import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

class TransferForm extends StatelessWidget {
  final TextEditingController _fieldControllerAccountNumber =
      TextEditingController();
  final TextEditingController _fieldControllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Transfer'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _fieldControllerAccountNumber,
              label: 'Account Number',
              hint: '0000',
            ),
            Editor(
              controller: _fieldControllerValue,
              label: 'Value',
              hint: '0.00',
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _createTransfer(context),
              child: Text('Confirm'),
            )
          ],
        ),
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int accountNumber = int.tryParse(_fieldControllerAccountNumber.text);
    final double value = double.tryParse(_fieldControllerValue.text);

    if (accountNumber != null && value != null) {
      final newTransfer = Transfer(
        value,
        accountNumber,
      );
      Navigator.pop(
        context,
        newTransfer,
      );
    }
  }
}
