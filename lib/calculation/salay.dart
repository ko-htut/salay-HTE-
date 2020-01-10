String SaLay(int age, int dayno, int mmbirthday) {
  int agecal = 10;
  int spt2;
  int spt3;
  int spt4;
  String thy;
  String thysu;
  int spt5;
  switch (mmbirthday) {
    case 0:
      agecal = mmbirthday + 10;
      break;
    case 1:
      agecal = mmbirthday + 6;
      break;
    case 2:
      agecal = mmbirthday + 15;
      break;
    case 3:
      agecal = mmbirthday + 6;
      break;
    case 4:
      agecal = mmbirthday + 17;
      break;
    case 5:
      agecal = mmbirthday + 19;
      break;
    case 6:
      agecal = mmbirthday + 21;
      break;
    default:
      break;
  }
  spt2 = (agecal % 43);
  spt3 = (agecal + age);
  spt4 = (age % 7);
  switch (spt4) {
    case 0:
      thysu = "ထီဆုကြီး ပေါက်နိင်ပါသည်";
      thy=myThy(mmbirthday, thysu);
    
      break;
    case 5:
      thysu = "ထီဆုကြီး ပေါက်နိင်ပါသည်";
      thy=myThy(mmbirthday, thysu);
      break;
    case 1:
      thysu = "ထီဆုသေး ပေါက်နိင်ပါသည်";
      thy=myThy(mmbirthday, thysu);
      break;
    case 6:
      thysu = "ထီဆုသေး ပေါက်နိင်ပါသည်";
      thy=myThy(mmbirthday, thysu);
      break;
    default:
      thy = 'ထီပေါက် ၇န် ခွင့်၇ေး မ၇ှိပါ $spt4';
      break;
  }
  return thy;
}

myThy(int mymmbdd, String mythysu) {
  int myth = mymmbdd % 7;
  String mythysucl;
  print(mymmbdd);
  print(mythysu);
  print(mymmbdd);
  switch (myth) {
    case 0:
      mythysucl =
          "သင်ထီ $mythysu ...\n၆ အစ ၄ အဆုံး ၊ ၅ အစ ၄ အဆုံး နံပါတ်ကိုထိုးပါ..";
      break;
    case 1:
      mythysucl =
          "သင်ထီ $mythysu ...\n၇ အစ ၅ အဆုံး ၊ ၆ အစ ၅ အဆုံး နံပါတ်ကိုထိုးပါ..";
      break;
    case 2:
      mythysucl =
          "သင်ထီ $mythysu ...\n၁ အစ ၆ အဆုံး ၊ ၆ အစ ၇ အဆုံး နံပါတ်ကိုထိုးပါ..";
      break;
    case 3:
      mythysucl =
          "သင်ထီ $mythysu ...\n၂ အစ ၇ အဆုံး ၊ ၅ အစ ၇ အဆုံး နံပါတ်ကိုထိုးပါ..";
      break;
    case 4:
      mythysucl =
          "သင်ထီ $mythysu ...\n၃ အစ ၁ အဆုံး ၊ ၂ အစ ၁ အဆုံး နံပါတ်ကိုထိုးပါ..";
      break;
    case 5:
      mythysucl =
          "သင်ထီ $mythysu ...\n၄ အစ ၂ အဆုံး ၊ ၃ အစ ၂ အဆုံး နံပါတ်ကိုထိုးပါ..";
      break;
    case 6:
      mythysucl =
          "သင်ထီ $mythysu \N ၅ အစ ၃ အဆုံး ၊ ၃ အစ ၄ အဆုံး နံပါတ်ကိုထိုးပါ..";
      break;
    default:
  }
  return mythysucl;
}
