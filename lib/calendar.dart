import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final titleProvider = Provider<String> ((ref){
  return 'Calendar Test';
});

final counterProvider = ChangeNotifierProvider((ref) => selectedNotifier());

class selectedNotifier extends ChangeNotifier {
  DateTime? _selectedDay; //選択した日付
  DateTime _focusedDay = DateTime.now();

  void selected (selectedDay, focusedDay) {
  if (!isSameDay(_selectedDay, selectedDay)) {
    _selectedDay = selectedDay;
    _focusedDay = focusedDay;
    }
  }

}