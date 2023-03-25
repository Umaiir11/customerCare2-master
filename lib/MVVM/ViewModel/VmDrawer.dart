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

class VmDrawer extends GetxController {
  final VmCompany G_VmCompany = Get.find();
  final SrCompanyList G_SrCompanyList = Get.find();
  RxList<int>? PrDecodeImage = RxList<int>([]);

  List<int>? get Pr_DecodeData_Image => PrDecodeImage!.value;

  set Pr_DecodeData_Image(List<int>? value) {
    PrDecodeImage!.value = value!;
  }

  RxInt l_PrselectedIndex = 0.obs;

  RxInt get Pr_txtselectedIndex_Text {
    return l_PrselectedIndex;
  }

  set Pr_txtselectedIndex_Text(RxInt value) {
    l_PrselectedIndex = value;
  }

  RxInt l_PrselectedDrawerMenu = 0.obs;

  RxInt get Pr_txtselectedDrawerMenu_Text {
    return l_PrselectedIndex;
  }

  set Pr_selectedDrawerMenu_Text(RxInt value) {
    l_PrselectedIndex = value;
  }

  RxBool Pr_isLoading = false.obs;

  RxBool get Pr_isLoading_wid {
    return Pr_isLoading;
  }

  set Pr_isLoading_wid(RxBool value) {
    Pr_isLoading = value;
  }

  //AssignedBranchesList
  RxList<ModAssignedBranches>? l_PrAssignedBranchesList = <ModAssignedBranches>[].obs;

  void Fnc_addItem() {
    if (l_PrAssignedBranchesList?.isEmpty ?? true) {
      l_PrAssignedBranchesList?.addAll(G_VmCompany.l_PrAssignedBranchesList!);
    }
  }

  //UserAccountsQueryList
  RxList<ModUserAccountsQuery>? l_PrUserAccountsQueryList = <ModUserAccountsQuery>[].obs;

  Future<bool> Fnc_UserAccountQueryList() async {
    List<ModUserAccountsQuery>? lListUserAccountsQuery = List<ModUserAccountsQuery>.empty(growable: true);
    lListUserAccountsQuery = await Sl_UserAccountsQuery().Fnc_UserAccountsQuery();
    {
      l_PrUserAccountsQueryList?.addAll(lListUserAccountsQuery!);

      if (l_PrUserAccountsQueryList == null) {
        return false;
      }
      cmGlobalVariables.Pb_AccountsDID = l_PrUserAccountsQueryList![0].Pr_AccountsDID;
      print(cmGlobalVariables.Pb_AccountsDID);
      print(cmGlobalVariables.Pb_AccountsDID);
      //Fnc_AccLedgerList();
    }
    return true;
  }

  //AccountLedgerList
  RxList<ModAccountLedger>? l_PrAccountLedgerList = <ModAccountLedger>[].obs;

  Future<bool> Fnc_AccLedgerList() async {
    Pr_isLoading_wid.value = false;

    List<ModAccountLedger>? lListAccountLedger = List<ModAccountLedger>.empty(growable: true);
    lListAccountLedger = await Sl_AccountLedger().Fnc_AccountLedger(DateTime.parse("2021-01-01"), DateTime.parse("2021-03-31"));
    {
      l_PrAccountLedgerList?.addAll(lListAccountLedger!);

      if (l_PrAccountLedgerList == null) {
        Pr_isLoading_wid.value = true;
        return false;
      }
    }

    Pr_isLoading_wid.value = true;
    return true;
  }

  //PendingChequesList
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

  //ItemQueryList
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
