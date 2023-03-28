import 'package:get/get.dart';

import '../../ServiceLayer/Sl_ItemQuery.dart';
import '../Model/DTO/ModItemQuery.dart';

class VmItemQueryList extends GetxController {
  //PendingSaleOrderList
  RxList<ModItemQueryDTO>? l_PrItemQueryList = <ModItemQueryDTO>[].obs;

  Future<bool> Fnc_ItemQueryList() async {
    List<ModItemQueryDTO>? lListItemQuery = List<ModItemQueryDTO>.empty(growable: true);
    lListItemQuery = await Sl_ItemQuery().Fnc_ItemQuery();
    {
      l_PrItemQueryList?.addAll(lListItemQuery!);

      if (l_PrItemQueryList == null) {
        return false;
      }
    }
    return true;
  }
}
