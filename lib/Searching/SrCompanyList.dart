import 'package:get/get.dart';
import '../MVVM/Model/ApiModels/ModCompanySettingQuery.dart';
import '../MVVM/ViewModel/VmCompany.dart';

class SrCompanyList extends GetxController {
  final VmCompany G_VmCompany = Get.find();
  RxList<ModCompanySettingQuery>? l_PrCompanyList =
      <ModCompanySettingQuery>[].obs;

  void Fnc_addItem() {
    if (l_PrCompanyList?.isEmpty ?? true) {
      l_PrCompanyList?.addAll(G_VmCompany.l_PrCompanyList!);
    }
  }

  RxList<ModCompanySettingQuery> Pr_filteredList =
      RxList<ModCompanySettingQuery>();
  RxString searchText = RxString("");

  void Fnc_filterlist(String query) {
    if (query.isEmpty) {
      Pr_filteredList.value = l_PrCompanyList!;
      return;
    }

    List<String> l_UserInput = query.toLowerCase().split(" ");
    List<ModCompanySettingQuery> l_filteredList =
        l_PrCompanyList!.where((l_ListContent) {
      for ( String l_letter in l_UserInput) {
        if (!l_ListContent.Pr_CompanyCity.toLowerCase().contains(l_letter) &&
            !l_ListContent.Pr_EmailId.toLowerCase().contains(l_letter) &&
            !l_ListContent.Pr_CompanyAddress.toLowerCase().contains(l_letter) &&
            !l_ListContent.Pr_CompanyPhone.toLowerCase().contains(l_letter) &&
            !l_ListContent.Pr_CompanyName.toLowerCase().contains(l_letter)) {
          return false;
        }
      }
      return true;
    }).toList();

    Pr_filteredList.value = l_filteredList;
  }
}
