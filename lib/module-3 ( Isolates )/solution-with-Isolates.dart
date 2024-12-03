import 'dart:async';
import 'dart:isolate';

/*
সমাধান ২: Parallelism (Isolate ব্যবহার করে)
এখন আমরা Parallelism ব্যবহার করব, যেখানে আমরা Isolate ব্যবহার করে প্রতিটি API কল আলাদা আলাদা আইসোলেট (পারালেল কাজ) হিসেবে চালাতে পারি।

 */


void main() async {
  print("Starting API Calls...");

  var receivePort = ReceivePort();

  // API Call 1
  Isolate.spawn(apiCallIsolate, [2, receivePort.sendPort]);
  // API Call 2
  Isolate.spawn(apiCallIsolate, [2, receivePort.sendPort]);
  // API Call 3
  Isolate.spawn(apiCallIsolate, [2, receivePort.sendPort]);

  await for (var msg in receivePort) {
    if (msg == "API Call Finished") {
      print("All API calls completed");
      break;
    }
  }
}

void apiCallIsolate(List<dynamic> params) async {
  int seconds = params[0];
  SendPort sendPort = params[1];

  await Future.delayed(Duration(seconds: seconds));
  sendPort.send("API Call Finished");
}


/*

ব্যাখ্যা:
এখানে Isolate.spawn() ব্যবহার করেছি, যেটি প্রতি API কলকে আলাদা Isolate হিসেবে চালায়।
প্রতিটি আইসোলেট ২ সেকেন্ড সময় নিবে, এবং তিনটি কল একসাথে চলবে।
ReceivePort এর মাধ্যমে আমরা আইসোলেট থেকে সিগন্যাল পাই এবং জানি কবে সব কাজ শেষ হয়েছে।
পার্থক্য এবং ফলাফল:


Concurrency (Future/async-await): এখানে কাজগুলো একই সময়ে শুরু হলেও single thread এ চলবে এবং context switching হবে।
Parallelism (Isolate): এখানে প্রতিটি API কল একসাথে আলাদা core এ চলবে এবং পুরো প্রক্রিয়া দ্রুত শেষ হবে, কারণ এখানে multi-core ব্যবহার করা হচ্ছে।
এভাবে তুমি দেখতে পারো যে Concurrency এবং Parallelism ব্যবহার করে কীভাবে একই কাজ দ্রুত করতে পারো। 
Concurrency সহজ এবং কম্পিউটেশনাল শক্তি কম ব্যবহার করে, তবে Parallelism সত্যিকারভাবে multi-core এর সুবিধা নেয় এবং দ্রুত কাজ শেষ করে।


 */
