import 'dart:io';

import 'package:http/http.dart' as http;

import 'cmGlobalVariables.dart';

class cmHttpCalls {
  //Fnc_HttpResponseWebLogin,---- //
  Future<http.Response> Fnc_HttpResponseWeb(
      String lControllerUrl, List<int> lUtfContent) async {
    Uri lUri = Uri.https(cmGlobalVariables.Pb_WebAPIURL, lControllerUrl);
    Map<String, String> lStringContect = {
      //HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
    };
    final lResponse =
    await http.post(lUri, headers: lStringContect, body: lUtfContent);
    return lResponse;
  }

  Future<http.Response> Fnc_HttpResponseERPBoth(
      String lControllerUrl, List<int> lUtfContent) async {
    String? lToken;
    lToken = cmGlobalVariables.Pb_Token;

    String BaseURL, DynamicURL, URL;
    BaseURL = cmGlobalVariables.Pb_ERPApiUrl!;
    DynamicURL = lControllerUrl;
    URL = BaseURL + DynamicURL;

    late Uri lUri;
    if (cmGlobalVariables.Pb_ERPApiUrl == cmGlobalVariables.Pb_ERP_API) {
      lUri = Uri.http(cmGlobalVariables.Pb_ERPApiUrl!, lControllerUrl);
      print(lUri);
    } else {
      lUri = Uri.parse(URL);
      print(lUri);
    }

    Map<String, String> lStringContect = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.authorizationHeader: 'Bearer $lToken',
    };
    final lResponse =
    await http.post(lUri, headers: lStringContect, body: lUtfContent);
    return lResponse;
  }

  Future<http.Response> Fnc_HttpCallForEncryption(
      List<int> l_UtfContent) async {
    Uri l_uri = Uri.parse(
        'https://mango.aisonesystems.com/ApiERP/Cryptography/Fnc_Encryption');

    print(l_uri);
    Map<String, String> l_stringContect = {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    };
    final l_response =
    await http.post(l_uri, headers: l_stringContect, body: l_UtfContent);
    return l_response;
  }
  Future<http.Response> Fnc_HttpResponseforReport(String l_controllerUrl,
      List<int> l_UtfContent, String l_QueryString) async {
    String BaseURL, DynamicURL, Query, URL;
    BaseURL = cmGlobalVariables.Pb_ERPApiUrl!;
    DynamicURL = l_controllerUrl;
    Query = l_QueryString;
    URL = BaseURL + DynamicURL + Query;

    late Uri l_uri;

    l_uri = Uri.parse(URL);
    print(l_uri);

    final l_response = await http.get(l_uri);
    return l_response;
  }

}
