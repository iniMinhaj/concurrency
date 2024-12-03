import 'dart:isolate';

void main() {
  print('Task 1 শুরু হচ্ছে...');
  Isolate.spawn(heavyTask, 'ডাটা'); // আলাদা থ্রেডে কাজটি চলছে
  print('Task 2 শুরু হচ্ছে...');
}

void heavyTask(String message) {
  for (int i = 0; i < 5; i++) {
    print('$message -> Heavy Task চলছে: $i');
  }
}


/*
Output:

Task 1 শুরু হচ্ছে...
Task 2 শুরু হচ্ছে...
ডাটা -> Heavy Task চলছে: 0
ডাটা -> Heavy Task চলছে: 1
ডাটা -> Heavy Task চলছে: 2
ডাটা -> Heavy Task চলছে: 3
ডাটা -> Heavy Task চলছে: 4


কী হলো?
- এখানে Isolate.spawn ব্যবহার করে heavyTask-কে আলাদা আইসোলেটে চালানো হয়েছে। ফলে Task 2 ব্লক হয়নি এবং একসাথে কাজগুলো চলছে।
- আইসোলেট তৈরি করা হলে, এটি সম্পূর্ণ স্বাধীন এবং নিজের কাজ সম্পন্ন করে।

 */