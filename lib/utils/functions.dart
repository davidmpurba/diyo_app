import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


/// Currency format for Rupiah ( IDR )
NumberFormat currencyFormatter = NumberFormat.currency(
  locale: 'id',
  decimalDigits: 0,
  name: 'Rp. ',
  symbol: 'Rp. ',
);

/// Currency format for Rupiah ( IDR )
NumberFormat currencyFormatterNoLeading =
    NumberFormat.currency(locale: 'id', decimalDigits: 0, name: '', symbol: '');

Color textColor(Color color) {
  if (color == Colors.white) {
    return Colors.red;
  } else {
    return Colors.white;
  }
}

String checkStatus(Color color) {
  if (color == Colors.white) {
    return 'Available';
  } else if (color == Colors.red){
    return 'Seated';
  } else if (color == Colors.yellow){
    return 'Ordered';
  } else if (color == Colors.blue){
    return 'Billing';
  } else {
    return '';
  }
}
