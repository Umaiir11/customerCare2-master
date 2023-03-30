
import 'package:customercare/MVVM/Model/ApiModels/ModPendingCheques.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Model/DTO/ModItemQuery.dart';
import '../ViewModel/VmCart.dart';

class VwCart extends StatefulWidget {
  @override
  State<VwCart> createState() => _VwCartState();
}

class _VwCartState extends State<VwCart> {
  final VmCart l_VmCart = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: SafeArea(
        child: Obx(
              () {
            final List<ModItemQueryDTO> controller = l_VmCart.l_ItemQueryList;
            return controller.isEmpty
                ? Center(
              child: Text(
                'Your cart is empty!',
                style: Theme.of(context).textTheme.headline6,
              ),
            )
                : ListView.builder(
              itemCount: controller.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Text(
                    controller[index].Pr_Desc,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  title: Text(
                    controller[index].Pr_List1,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      l_VmCart.removeItem(controller[index]);



                    },
                    child: Icon(
                      Icons.remove_circle,
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}