import 'package:customercare/MVVM/Model/ApiModels/ModAccLedger.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModAssignedBranches.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModPendingCheques.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModPendingSaleOrder.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModUserAccQuery.dart';
import 'package:customercare/MVVM/Model/DTO/ModItemQuery.dart';
import 'package:customercare/ServiceLayer/Sl_PendingCheques.dart';
import 'package:get/get.dart';

import '../../ClassModules/cmGlobalVariables.dart';
import '../../Searching/SrCompanyList.dart';
import '../../ServiceLayer/Sl_AccLedger.dart';
import '../../ServiceLayer/Sl_ItemQuery.dart';
import '../../ServiceLayer/Sl_PendingSaleOrder.dart';
import '../../ServiceLayer/Sl_UserAccQuery.dart';
import 'VmCompany.dart';
import 'VmLogin.dart';

class VmAccLedger extends GetxController {

  //AccountLedgerList
  RxList<ModAccountLedger>? l_PrAccountLedgerList = <ModAccountLedger>[].obs;

  Future<bool> Fnc_AccLedgerList() async {
    // Pr_isLoading_wid.value = false;

    List<ModAccountLedger>? lListAccountLedger = List<ModAccountLedger>.empty(growable: true);
    lListAccountLedger = await Sl_AccountLedger().Fnc_AccountLedger(DateTime.parse("2021-01-01"),
        DateTime.parse("2021-03-31"));
    {
      l_PrAccountLedgerList?.addAll(lListAccountLedger!);

      if (l_PrAccountLedgerList == null) {
        //Pr_isLoading_wid.value = true;
        return false;
      }
    }

    //Pr_isLoading_wid.value = true;
    return true;
  }
}
