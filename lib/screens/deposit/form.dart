import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _appBarTitle = 'Receive deposit';

const _valueFieldHint = '0.0';
const _valueFieldLabel = 'Value';
const _confirmButtonText = 'Confirm';

class DepositForm extends StatelessWidget {
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
              controller: _fieldControllerValue,
              label: _valueFieldLabel,
              hint: _valueFieldHint,
              icon: Icons.monetization_on,
            ),
            RaisedButton(
              onPressed: () => _createDeposit(context),
              child: Text(_confirmButtonText),
            ),
          ],
        ),
      ),
    );
  }

  _createDeposit(context) {
    final double value = double.tryParse(_fieldControllerValue.text);
    final validDeposit = value != null;

    if (validDeposit) {
      _updateState(context, value);

      Navigator.pop(context);
    }
  }

  _updateState(context, value) {
    Provider.of<Balance>(context, listen: false).add(value);
  }
}
