void main() {
  print('Task 1 শুরু হচ্ছে...');
  heavyTask(); // বড় কাজ, যা সময় লাগবে
  print('Task 2 শুরু হচ্ছে...');
}

void heavyTask() {
  for (int i = 0; i < 5; i++) {
    print('Heavy Task চলছে: $i');
  }
}





/* 

Output: 

Task 1 শুরু হচ্ছে...
Heavy Task চলছে: 0
Heavy Task চলছে: 1
Heavy Task চলছে: 2
Heavy Task চলছে: 3
Heavy Task চলছে: 4
Task 2 শুরু হচ্ছে...


কী হলো?
- heavyTask পুরোপুরি শেষ না হওয়া পর্যন্ত Task 2 শুরু হয়নি।
- এটি একটি সিঙ্গেল থ্রেডেড প্রোগ্রাম।

 */