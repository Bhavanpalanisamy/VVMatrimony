import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upi_payment_flutter/upi_payment_flutter.dart';

final upiPaymentHandler = UpiPaymentHandler();

Future<void> initiateTransaction(context) async {
  try {
    bool success = await upiPaymentHandler.initiateTransaction(
      payeeVpa: 'nivasjithan-2@okhdfcbank',
      payeeName: 'Nivas',
      transactionRefId: 'TXN123456',
      transactionNote: 'Test transaction',
      amount: 1.0,
    );

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction initiated successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction initiation failed.')),
      );
    }
  } on PlatformException catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.message}')),
    );
  }
}
