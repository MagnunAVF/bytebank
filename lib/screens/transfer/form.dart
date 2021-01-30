import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _appBarTitle = 'New Transfer';

const _accountNumberFieldLabel = 'Account Number';
const _accountNumberFieldHint = '0000';

const _valueFieldLabel = 'Value';
const _valueFieldHint = '0.00';

const _confirmButtonText = 'Confirm';

class TransferForm extends StatelessWidget {
  final TextEditingController _fieldControllerAccountNumber =
      TextEditingController();
  final TextEditingController _fieldControllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _fieldControllerAccountNumber,
              label: _accountNumberFieldLabel,
              hint: _accountNumberFieldHint,
            ),
            Editor(
              controller: _fieldControllerValue,
              label: _valueFieldLabel,
              hint: _valueFieldHint,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _createTransfer(context),
              child: Text(_confirmButtonText),
            ),
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
