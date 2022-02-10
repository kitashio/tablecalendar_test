import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

final titleProvider = Provider<String> ((ref){
  return 'Calendar Test';
});

// final calendarProvider = StateProvider<Widget>((ref){
//
//
// });