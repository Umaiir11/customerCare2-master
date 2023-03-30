import 'package:customercare/MVVM/Model/ApiModels/ModPendingCheques.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Model/DTO/ModItemQuery.dart';





class VmCart extends GetxController {
  var itemCount = RxInt(0);

  RxList<ModItemQueryDTO> l_ItemQueryList = <ModItemQueryDTO>[].obs;


  void addItem(ModItemQueryDTO item) {
    l_ItemQueryList.add(item);
    itemCount.value++;
  }

  void removeItem(ModItemQueryDTO item) {
    l_ItemQueryList.remove(item);
    itemCount.value--;
  }
}
