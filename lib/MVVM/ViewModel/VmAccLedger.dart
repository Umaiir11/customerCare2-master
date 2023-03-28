import 'package:customercare/MVVM/Model/ApiModels/ModAccLedger.dart';
import 'package:get/get.dart';

import '../../ServiceLayer/Sl_AccLedger.dart';

class VmAccLedger extends GetxController {
  //AccountLedgerList
  RxList<ModAccountLedger>? l_PrAccountLedgerList = <ModAccountLedger>[].obs;

  Future<bool> Fnc_AccLedgerList() async {
    List<ModAccountLedger>? lListAccountLedger = List<ModAccountLedger>.empty(growable: true);
    lListAccountLedger = await Sl_AccountLedger().Fnc_AccountLedger(DateTime.parse("2021-01-01"), DateTime.parse("2021-03-31"));
    {
      l_PrAccountLedgerList?.addAll(lListAccountLedger!);
      if (l_PrAccountLedgerList == null) {
        return false;
      }
    }
    return true;
  }
}
