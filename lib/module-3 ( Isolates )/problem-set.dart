/*
   ধরা যাক, আমাদের একটি সিস্টেম রয়েছে যেখানে আমাদের একাধিক API কল করতে হবে এবং আমরা চাই সব API কল একসাথে চলুক,
   যাতে সময় সাশ্রয় হয়। সাধারণভাবে সিঙ্ক্রোনাস কোডে কাজ করলে সময় বেশি লেগে যাবে,
   এবং আমরা প্রতিটি কল শেষে পরবর্তী কল শুরু করতে বাধ্য হব। 
   এই সমস্যা সমাধান করতে আমরা Concurrency এবং Parallelism ব্যবহার করব।

 */


void main() async {
  print("API Call 1 Started");
  await apiCall(2);  // 2 seconds
  print("API Call 1 Finished");

  print("API Call 2 Started");
  await apiCall(2);  // 2 seconds
  print("API Call 2 Finished");

  print("API Call 3 Started");
  await apiCall(2);  // 2 seconds
  print("API Call 3 Finished");

  print("All API calls completed");
}

Future<void> apiCall(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}


/*

সমস্যার ব্যাখ্যা:
-  এখানে একে একে API Call 1, API Call 2, এবং API Call 3 হবে।
-  প্রতিটি কলের জন্য ২ সেকেন্ড সময় লাগবে, এবং মোট ৬ সেকেন্ড সময় নিতে হবে।
-  যদি একই সময়ে একাধিক API কল করা যেতো, তাহলে সময় কমানো যেতো।

 */