import 'package:diyo/modules/top_level_bloc/cubit/form_key_cubit.dart';
import 'package:diyo/utils/font.dart';
import 'package:diyo/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
    required this.text,
    required this.color,
    this.borderColor = Colors.transparent,
    required this.onTap,
  });

  final String text;
  final Color color;
  final Color borderColor;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: () {
        context.read<ToggleCubit>().setStatus(true);
        context.read<TableNameCubit>().setTableName(text);
        context.read<TableStatusCubit>().setTableStatus(color);
      },
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: body1(color: textColor(color)),
        ),
      ),
    );
  }
}