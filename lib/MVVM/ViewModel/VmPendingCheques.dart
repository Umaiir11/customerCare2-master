import 'package:get/get.dart';

import '../../ServiceLayer/Sl_PendingCheques.dart';
import '../Model/ApiModels/ModPendingCheques.dart';

class VmPendingCheques extends GetxController {
  RxList<ModPendingCheques>? l_PrPendingChequesList = <ModPendingCheques>[].obs;
  Future<bool> Fnc_PendingChequesList() async {
    List<ModPendingCheques>? lListPendingCheques = List<ModPendingCheques>.empty(growable: true);
    lListPendingCheques = await Sl_PendingCheques().Fnc_PendingCheques();
    {
      l_PrPendingChequesList?.addAll(lListPendingCheques!);

      if (l_PrPendingChequesList == null) {
        return false;
      }
    }
    return true;
  }
}
