import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Searching/SrCompanyList.dart';

class SearchView extends StatelessWidget {
  final SrCompanyList searchController = Get.put(SrCompanyList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => searchController.searchText.value = value,
              decoration: InputDecoration(
                hintText: "Search",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Obx(() {
              if (searchController.Pr_filteredList.isEmpty) {
                return Center(child: Text("No results found."));
              }
              return ListView.builder(
                itemCount: searchController.Pr_filteredList.length,
                itemBuilder: (context, index) {
                  final user = searchController.Pr_filteredList[index];
                  return ListTile(
                    title: Text(user.Pr_EmailId),
                    subtitle: Text(user.Pr_CompanyCity),
                    trailing: Text(user.Pr_CompanyName),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
