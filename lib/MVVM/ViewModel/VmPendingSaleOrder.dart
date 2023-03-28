import 'package:customercare/MVVM/Model/ApiModels/ModAccLedger.dart';
import 'package:get/get.dart';

import '../../ServiceLayer/Sl_AccLedger.dart';
import '../../ServiceLayer/Sl_PendingCheques.dart';
import '../../ServiceLayer/Sl_PendingSaleOrder.dart';
import '../Model/ApiModels/ModPendingCheques.dart';
import '../Model/ApiModels/ModPendingSaleOrder.dart';

class VmPendingSaleOrder extends GetxController {

  //PendingSaleOrderList
  RxList<ModPendingSaleOrder>? l_PrPendingSaleOrderList = <ModPendingSaleOrder>[].obs;

  Future<bool> Fnc_PendingSaleOrderList() async {
    List<ModPendingSaleOrder>? lListPendingSaleOrder = List<ModPendingSaleOrder>.empty(growable: true);
    lListPendingSaleOrder = await Sl_PendingSelOrder().Fnc_PendingSO();
    {
      l_PrPendingSaleOrderList?.addAll(lListPendingSaleOrder!);

      if (l_PrPendingSaleOrderList == null) {
        return false;
      }
    }
    return true;
  }

}
