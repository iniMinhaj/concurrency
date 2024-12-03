/*
সমাধান ১: Concurrency (asynchronous API calls)

এখন আমরা Concurrency ব্যবহার করব, যাতে একই সময়ে API কলগুলো চলতে পারে,
তবে আমাদের কাজের কন্টেক্সট main isolate তে থাকবে।


 */


void main() async {
  print("API Call 1 Started");
  var call1 = apiCall(2);  // 2 seconds

  print("API Call 2 Started");
  var call2 = apiCall(2);  // 2 seconds

  print("API Call 3 Started");
  var call3 = apiCall(2);  // 2 seconds

  await Future.wait([call1, call2, call3]);

  print("All API calls completed");
}

Future<void> apiCall(int seconds) async {
  await Future.delayed(Duration(seconds: seconds));
}


/*
ব্যাখ্যা:
- এখানে আমরা Future.wait() ব্যবহার করেছি, যা একই সময়ে সব ফিউচারকে অপেক্ষা করবে এবং তখনই শেষ হবে যখন সব কাজ সম্পন্ন হবে।
- একই সময়ে তিনটি API কল হতে পারে, ফলে পুরো সময়টা ২ সেকেন্ড (একসাথে তিনটি কাজ) লাগবে।

 */