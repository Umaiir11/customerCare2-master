import 'dart:convert';

import 'package:customercare/ClassModules/cmCryptography.dart';
import 'package:customercare/ClassModules/cmHttpCalls.dart';

import '../MVVM/Model/ApiModels/ModCompanySettingQuery.dart';
import '../MVVM/Model/MmoLogin.dart';
import '../MVVM/Model/ParameterModels/ParModUserLogin.dart';


class SlwLogin {



  Future<List<ModCompanySettingQuery>?> Fnc_WLogin(MmoLoginModel lMmoLoginModel) async {
    String lPrCompanyDID = "00000000-0000-0000-0000-000000000000";
    try {
      ParModUserProfile lParModUserProfile = ParModUserProfile(
          Pr_EmailID: lMmoLoginModel.username,
          Pr_Password: cmCryptography().Fnc_Encrypt_AES(lMmoLoginModel.password),
          Pr_CompanyDID: lPrCompanyDID);

      //Uri.https('www.aisonesystems.com', '/apiUser/UserProfile/Post');
      String lJsonString = json.encode((lParModUserProfile.toJson()));
      List<int> lUtfContent = utf8.encode(lJsonString);

      final lResponse = await cmHttpCalls()
          .Fnc_HttpResponseWeb('/apiUser/Login/Post', lUtfContent);
      print(lResponse);
      if (lResponse.statusCode == 200) {
        return Fnc_JsonToListOfModel(jsonDecode(lResponse.body));
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }


  ModCompanySettingQuery Fnc_JsonToModel(Map<String, dynamic> lJsonObject) {
    ModCompanySettingQuery lModCompanySettingQuery = ModCompanySettingQuery();
    lModCompanySettingQuery.Pr_Pkguid = lJsonObject["Pr_PKGUID"];
    lModCompanySettingQuery.Pr_EmailId = lJsonObject["Pr_EmailID"];
    lModCompanySettingQuery.Pr_RoleDid = lJsonObject["Pr_RoleDID"];
    lModCompanySettingQuery.Pr_CompanyDid = lJsonObject["Pr_CompanyDID"];
    lModCompanySettingQuery.Pr_CompanyName = lJsonObject["Pr_CompanyName"];

    lModCompanySettingQuery.Pr_CompanyAddress =
    lJsonObject["Pr_CompanyAddress"];
    lModCompanySettingQuery.Pr_CompanyCity = lJsonObject["Pr_CompanyCity"];
    lModCompanySettingQuery.Pr_CompanyPhone = lJsonObject["Pr_CompanyPhone"];
    return lModCompanySettingQuery;
  }

  //Method return list type
  List<ModCompanySettingQuery> Fnc_JsonToListOfModel(List<dynamic> lJsonList) {
    //Declare Local Variable For list Of Model and instance

    List<ModCompanySettingQuery> lListModCompanySettingQuery =
    List<ModCompanySettingQuery>.empty(growable: true);

    //Start Irritation From Json String

    for (dynamic lJsonObject in lJsonList) {
      ModCompanySettingQuery lModCompanySettingQuery =
      ModCompanySettingQuery();
      lModCompanySettingQuery = Fnc_JsonToModel(lJsonObject);
      lListModCompanySettingQuery.add(lModCompanySettingQuery);
    }
    return lListModCompanySettingQuery;
  }
}
