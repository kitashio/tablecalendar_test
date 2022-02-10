import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tablecalender_test/calendar.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final notifier = ref.read(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(ref.watch(titleProvider)),
      ),
      body: Consumer(
          builder: (context, watch, child) {

            DateTime? _selectedDay; //選択した日付
            DateTime _focusedDay = DateTime.now(); //今日の日付

            return TableCalendar(
              firstDay: DateTime.utc(2021, 1, 1), //利用可能な最初の日
              lastDay: DateTime.utc(2023, 12, 31), //利用可能な最後の日
              focusedDay: _focusedDay, //今日の日付

              //ヘッダーのフォーマット変更ボタンなくす
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,),

              //日付が選択されたらtrueを返し、dayが選択されたとみなされる
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: notifier.selected,
            );
          }
      )
    );
  }
  }