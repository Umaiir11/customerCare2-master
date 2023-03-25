import 'package:customercare/ClassModules/cmGlobalVariables.dart';
import 'package:customercare/MVVM/View/VwCompany.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../ViewModel/VmLogin.dart';

class VwLogin extends StatefulWidget {
  @override
  State<VwLogin> createState() => _VwLoginState();
}

class _VwLoginState extends State<VwLogin> {
  @override
  final VmLogin l_vmLogin = Get.put(VmLogin());

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passswordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    usernameController.text = l_vmLogin.Pr_txtusername_Text;
    passswordController.text = l_vmLogin.Pr_txtpassword_Text;

    Widget togglepassword() {
      return Obx(() {
        return IconButton(
          onPressed: () {
            l_vmLogin.Pr_boolSecurePassword_wid.value =
                !l_vmLogin.Pr_boolSecurePassword_wid.value;
          },
          icon: l_vmLogin.Pr_boolSecurePassword_wid.value
              ? const Icon(Icons.visibility)
              : const Icon(Icons.visibility_off),
          color: Colors.indigo,
        );
      });
    }

    Widget _WidgetportraitMode(double PrHeight, PrWidth) {
      return Scaffold(
        key: _scaffoldKey,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFD1FFFF),
                Color(0xFF88ECF8),
                Color(0xFF65DCDC),
              ],
              stops: [0.1, 0.5, 0.7, 0.9],
            ),
          ),
          //color: Colors.black,
          // we use child container property and used most important property column that accepts multiple widgets

          child: ResponsiveWrapper(
            maxWidth: 1200,
            minWidth: 480,
            defaultScale: true,
            breakpoints: const [
              ResponsiveBreakpoint.resize(480, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.resize(1000, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: '4K'),
            ],
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: Image.asset(
                          "assets/aisonr.png",
                          width: 170,
                          fit: BoxFit.cover,
                        ),
                      )),
                  const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Center(child: Text("data"))),
                  const Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Center(child: Text("data"))),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Center(
                      child: SizedBox(
                        width: 430,
                        child: TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              hintStyle: const TextStyle(color: Colors.black26),
                              labelText: ' Email',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide:
                                    const BorderSide(color: Colors.white38),
                              ),
                              prefixIcon: const Icon(MdiIcons.fingerprint,
                                  size: 20, color: Colors.indigo),
                            ),
                            onChanged: (value) {
                              l_vmLogin.Pr_txtusername_Text = value;
                            }),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Divider(
                      endIndent: 79,
                      indent: 79,
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Center(
                      child: SizedBox(
                          width: 430,
                          child: Obx(() {
                            return TextFormField(
                                obscureText:
                                    l_vmLogin.Pr_boolSecurePassword_wid.value,
                                controller: passswordController,
                                decoration: InputDecoration(
                                  hintText: 'Enter Password',
                                  hintStyle:
                                      const TextStyle(color: Colors.black26),
                                  labelText: ' Password',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: const BorderSide(
                                          color: Colors.white38)),
                                  prefixIcon: const Icon(MdiIcons.fingerprint,
                                      size: 20, color: Colors.indigo),
                                  suffixIcon: togglepassword(),
                                ),
                                onChanged: (value) {
                                  l_vmLogin.Pr_txtpassword_Text = value;
                                });
                          })),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Divider(
                      endIndent: 79,
                      indent: 79,
                      thickness: 1.5,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Center(child: Text("Remember me")),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Divider(
                      endIndent: 120,
                      indent: 120,
                      thickness: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Center(
                      child: SizedBox(
                        width: 150,
                        height: 50,
                        child: Obx(() {
                          return ElevatedButton(
                            onPressed: () async {
                              if (await l_vmLogin.Fnc_OnTapLoginBtn() == true) {
                                Get.to(() => const VwCompany());
                              } else {
                                Get.snackbar("Exception",
                                    cmGlobalVariables.Pb_Exception!);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              animationDuration: const Duration(seconds: 1),
                              shape: l_vmLogin.Pr_isLoading_wid.value
                                  ? RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    )
                                  : RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                            ),
                            child: l_vmLogin.Pr_isLoading_wid.value
                                ? LoadingAnimationWidget.twistingDots(
                                    leftDotColor: const Color(0xFF1A1A3F),
                                    rightDotColor: const Color(0xFFFFFFFF),
                                    size: 40,
                                  )
                                : const Text("Login"),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        //when tap anywhere on screen keyboard dismiss
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              //Get device's screen height and width.
              double height = constraints.maxHeight;
              double width = constraints.maxWidth;

              if (width >= 330 && width < 600) {
                return _WidgetportraitMode(height, width);
              } else {
                return _WidgetportraitMode(height, width);
              }
            },
          );
        },
      ),
    );
  }
}
