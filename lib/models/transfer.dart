class Transfer {
  final double value;
  final int accountNumber;

  Transfer(
    this.value,
    this.accountNumber,
  );

  String toStringValue() {
    return 'R\$ $value';
  }

  String toStringAccount() {
    return 'R\$ $accountNumber';
  }
}
