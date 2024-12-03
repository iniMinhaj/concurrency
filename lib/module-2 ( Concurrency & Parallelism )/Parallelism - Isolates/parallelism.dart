

import 'dart:isolate';


/*

Task:
    - একটি isolate তৈরি করো যা একটি লুপ ৫ বার চালাবে এবং প্রতিটি ধাপে কিছু মেসেজ প্রিন্ট করবে।
    - একই সাথে মেইন থ্রেডে অন্য একটি মেসেজ প্রিন্ট করাও।

 */



void main() {
  print("Main Isolate: Task শুরু হচ্ছে...");

  // নতুন isolate তৈরি করা
  Isolate.spawn(newIsolateTask, "প্যারালাল Task চলছে...");

  // Main Isolate-এ কাজ করানো
  for (int i = 0; i < 5; i++) {
    print("Main Isolate: কাজ $i");
  }
}

// নতুন isolate-এর জন্য ফাংশন
void newIsolateTask(String message) {
  for (int i = 0; i < 5; i++) {
    print("New Isolate: $message -> স্টেপ $i");
  }
}
