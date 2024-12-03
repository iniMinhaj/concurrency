

// ---- [ Task: একটি Future ফাংশন তৈরি করো যা ৫ সেকেন্ড অপেক্ষা করে কোনো মান (যেমন "Complete!") রিটার্ন করবে। এরপর সেই মান await ব্যবহার করে প্রিন্ট করো। ] -----

// void main() async{
//   print("Main Concurrency: Task 1 শুরু হচ্ছে...");
//   String result = await backgroundTask();
//   print(result);
//   print("Main Concurrency: Task 2 শুরু হচ্ছে...");

// }

// Future<String> backgroundTask (){ 
// return Future.delayed(Duration(seconds: 5),() => "Complete!",);
// }

import 'dart:async';

int counter = 0;

void main() async {
  // দুইটি আলাদা asynchronous কাজ একসাথে চলবে
  var task1 = incrementCounter();
  var task2 = incrementCounter();

  await Future.wait([task1, task2]);

  print('Counter: $counter');
}

Future<void> incrementCounter() async {
  // এখানে ১ সেকেন্ডের বিলম্ব দেয়া হয়েছে যাতে দুইটি task একই সময়ে শুরু না হয়
  await Future.delayed(Duration(seconds: 1));
  
  // counter variable টি একাধিক থ্রেড দ্বারা একই সময়ে অ্যাক্সেস হচ্ছে
  counter++;
}
