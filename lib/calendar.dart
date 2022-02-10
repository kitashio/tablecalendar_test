import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final titleProvider = Provider<String> ((ref){
  return 'Calendar Test';
});

final calendarProvider = Provider<Widget>((ref){
  DateTime? _selectedDay; //選択した日付
  DateTime _focusedDay = DateTime.now(); //今日の日付

  return TableCalendar(
    firstDay: DateTime.utc(2021, 1, 1), //利用可能な最初の日
    lastDay: DateTime.utc(2023, 12, 31), //利用可能な最後の日
    focusedDay: _focusedDay,
    //ヘッダーのフォーマット変更ボタンなくす
    headerStyle: const HeaderStyle(
      formatButtonVisible: false,),
    selectedDayPredicate: (day) {
      return isSameDay(_selectedDay, day);
    },
    // onDaySelected: (selectedDay, focusedDay) {
    //   if (!isSameDay(_selectedDay, selectedDay)) {
    //     _selectedDay = selectedDay;
    //     _focusedDay = focusedDay;
    //   }
    // },
  );//本日の日付

});