// ignore_for_file: avoid_print, unused_local_variable

import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String result = await task2();
  task3(result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  Duration threeSecs = Duration(seconds: 3);
  String result = '';
  await Future.delayed(threeSecs, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;

  // sleep(threeSecs);
}

void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
