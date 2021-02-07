import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/models/transfers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final validTransfer = _validateTransfer(accountNumber, value);

    if (validTransfer) {
      final newTransfer = Transfer(value, accountNumber);

      _updateState(context, newTransfer, value);

      Navigator.pop(context);
    }
  }

  _validateTransfer(accountNumber, value) {
    final _filledFields = accountNumber != null && value != null;

    return _filledFields;
  }

  _updateState(context, newTransfer, value) {
    Provider.of<Transfers>(context, listen: false).add(newTransfer);
    Provider.of<Balance>(context, listen: false).subtract(value);
  }
}
