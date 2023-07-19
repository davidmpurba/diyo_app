import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:diyo/models/menu.dart';
import 'package:diyo/models/table.dart';
import 'package:flutter/material.dart';

class RadioButtonCubit extends Cubit<String> {
  RadioButtonCubit(super.selectedOption);

  void updateSelectedOption(String option) {
    emit(option);
  }
}

class ToggleCubit extends Cubit<bool> {
  ToggleCubit() : super(false);

  void setStatus(bool value) => emit(value);

  void toggle() => emit(!state);
}

class TableNameCubit extends Cubit<String> {
  TableNameCubit() : super('');

  void setTableName(String value) => emit(value);
}

class TableStatusCubit extends Cubit<Color> {
  TableStatusCubit(super.initialState);

  void setTableStatus(Color value) => emit(value);
}

class StatusOrderCubit extends Cubit<bool> {
  StatusOrderCubit() : super(false);

  void setStatus(bool value) => emit(value);

  void toggle() => emit(!state);
}

class StatusBillingCubit extends Cubit<bool> {
  StatusBillingCubit() : super(false);

  void setStatus(bool value) => emit(value);

  void toggle() => emit(!state);
}


class IndexTable extends Cubit<int> {
  IndexTable() : super(0);

  void getIndex(int value) => emit(value);
}

class MenuOrderCubit extends Cubit<List<MenuItem>> {
  MenuOrderCubit() : super([]);

  void addItem(MenuItem item) {
    var itemExists = false;
    final updatedList = state.map((menuItem) {
      if (menuItem.name == item.name) {
        itemExists = true;
        return MenuItem(
          name: menuItem.name,
          price: menuItem.price,
          quantity: menuItem.quantity + 1,
        );
      }
      return menuItem;
    }).toList();

    if (!itemExists) {
      updatedList.add(item);
    }

    emit(updatedList);
  }

  void removeItem(MenuItem item) {
    final updatedList = List<MenuItem>.from(state);
    final index = updatedList.indexWhere(
      (menuItem) => menuItem.name == item.name,
    );
    if (index != -1) {
      if (updatedList[index].quantity > 1) {
        updatedList[index].decrementQuantity();
      } else {
        updatedList.removeAt(index);
      }
      emit(updatedList);
    }
  }

  double calculateTotalPrice() {
    var totalPrice = 0.0;
    for (final menuItem in state) {
      totalPrice += menuItem.price * menuItem.quantity;
    }
    return totalPrice;
  }
}

class TableCubit extends Cubit<List<TableList>> {
  TableCubit(super.initialState);

  void updateStatus(int index, Color newColor) {
    if (index >= 0 && index < state.length) {
      final updatedStatus = List<TableList>.from(state);
      updatedStatus[index].status = newColor;
      emit(updatedStatus);
    }
  }
}
