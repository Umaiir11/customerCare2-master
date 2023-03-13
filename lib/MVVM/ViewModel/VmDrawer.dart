import 'package:customercare/MVVM/Model/ApiModels/ModAccLedger.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModAssignedBranches.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModPendingCheques.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModPendingSaleOrder.dart';
import 'package:customercare/MVVM/Model/ApiModels/ModUserAccQuery.dart';
import 'package:customercare/MVVM/Model/DTO/ModItemQuery.dart';
import 'package:customercare/ServiceLayer/Sl_PendingCheques.dart';
import 'package:get/get.dart';

import '../../ClassModules/cmGlobalVariables.dart';
import '../../ServiceLayer/Sl_AccLedger.dart';
import '../../ServiceLayer/Sl_ItemQuery.dart';
import '../../ServiceLayer/Sl_PendingSaleOrder.dart';
import '../../ServiceLayer/Sl_UserAccQuery.dart';
import 'VmCompany.dart';

class VmDrawer extends GetxController {
  final VmCompany G_VmCompany = Get.find();


  RxList<int>? PrDecodeImage = RxList<int>([]);
  List<int>? get Pr_DecodeData_Image => PrDecodeImage!.value;
  set Pr_DecodeData_Image(List<int>? value) {
    PrDecodeImage!.value = value!;
  }

   RxInt l_PrselectedIndex = 0.obs;
  RxInt get Pr_txtselectedIndex_Text {
    return l_PrselectedIndex;
  }set Pr_txtselectedIndex_Text(RxInt value) {
    l_PrselectedIndex = value;
  }

  RxInt l_PrselectedDrawerMenu = 0.obs;
  RxInt get Pr_txtselectedDrawerMenu_Text {
    return l_PrselectedIndex;
  }set Pr_selectedDrawerMenu_Text(RxInt value) {
    l_PrselectedIndex = value;
  }

  RxList<ModAssignedBranches>? l_PrAssignedBranchesList = <ModAssignedBranches>[].obs;
  void Fnc_addItem() {
    if (l_PrAssignedBranchesList?.isEmpty ?? true) {
      l_PrAssignedBranchesList?.addAll(G_VmCompany.l_PrAssignedBranchesList!);
    }
  }

  RxList<ModUserAccountsQuery>? l_PrUserAccountsQueryList = <ModUserAccountsQuery>[].obs;
  Future<bool> Fnc_UserAccountQueryList() async {
    List<ModUserAccountsQuery>? l_listUserAccountsQuery =
        new List<ModUserAccountsQuery>.empty(growable: true);
    l_listUserAccountsQuery =
        await Sl_UserAccountsQuery().Fnc_UserAccountsQuery();
    {
      l_PrUserAccountsQueryList?.addAll(l_listUserAccountsQuery!);

      if (l_PrUserAccountsQueryList == null) {
        return false;
      }
      cmGlobalVariables.Pb_AccountsDID =
          l_PrUserAccountsQueryList![0].Pr_AccountsDID;
      print(cmGlobalVariables.Pb_AccountsDID);
      print(cmGlobalVariables.Pb_AccountsDID);
      //Fnc_AccLedgerList();
    }
    return true;
  }

  RxList<ModAccountLedger>? l_PrAccountLedgerList = <ModAccountLedger>[].obs;
  Future<bool> Fnc_AccLedgerList() async {
    List<ModAccountLedger>? l_listAccountLedger =
        new List<ModAccountLedger>.empty(growable: true);
    l_listAccountLedger = await Sl_AccountLedger().Fnc_AccountLedger(
        DateTime.parse("2021-01-01"), DateTime.parse("2021-03-31"));
    {
      l_PrAccountLedgerList?.addAll(l_listAccountLedger!);

      if (l_PrAccountLedgerList == null) {
        return false;
      }
    }
    return true;
  }

  RxList<ModPendingCheques>? l_PrPendingChequesList = <ModPendingCheques>[].obs;
  Future<bool> Fnc_PendingChequesList() async {
    List<ModPendingCheques>? l_listPendingCheques =
        new List<ModPendingCheques>.empty(growable: true);
    l_listPendingCheques = await Sl_PendingCheques().Fnc_PendingCheques();
    {
      l_PrPendingChequesList?.addAll(l_listPendingCheques!);

      if (l_PrPendingChequesList == null) {
        return false;
      }
    }
    return true;
  }

  RxList<ModPendingSaleOrder>? l_PrPendingSaleOrderList = <ModPendingSaleOrder>[].obs;
  Future<bool> Fnc_PendingSaleOrderList() async {
    List<ModPendingSaleOrder>? l_listPendingSaleOrder =
        new List<ModPendingSaleOrder>.empty(growable: true);
    l_listPendingSaleOrder = await Sl_PendingSelOrder().Fnc_PendingSO();
    {
      l_PrPendingSaleOrderList?.addAll(l_listPendingSaleOrder!);

      if (l_PrPendingSaleOrderList == null) {
        return false;
      }
    }
    return true;
  }

  RxList<ModItemQueryDTO>? l_PrItemQueryList = <ModItemQueryDTO>[].obs;
  Future<bool> Fnc_ItemQueryList() async {
    List<ModItemQueryDTO>? l_listItemQuery =
        new List<ModItemQueryDTO>.empty(growable: true);
    l_listItemQuery = await Sl_ItemQuery().Fnc_ItemQuery();
    {
      l_PrItemQueryList?.addAll(l_listItemQuery!);

      if (l_PrItemQueryList == null) {
        return false;
      }
    }
    return true;
  }

  void FncClearAllDATA() {
    cmGlobalVariables.Pb_Token = "";
    cmGlobalVariables.Pb_UserDID = "";
    cmGlobalVariables.Pb_UserName = "";
    cmGlobalVariables.Pb_UserImage = "";
    cmGlobalVariables.Pb_UserEmail = "";
    cmGlobalVariables.Pb_UserNumber = "";
    cmGlobalVariables.Pb_Report = "";
    cmGlobalVariables.PbSelectedBranch = 0;
    cmGlobalVariables.PbDefaultBranch = 0;
    cmGlobalVariables.PbCount = 0;
    cmGlobalVariables.Pb_SelectedDID = "";
    cmGlobalVariables.Pb_jsonString = "";



  }

}
