import 'package:diyo/models/menu.dart';
import 'package:flutter/material.dart';

class TableList {
  TableList(
    this.text,
    this.status,
    this.order,
  );

  String text;
  Color status;
  MenuItem order;

}
