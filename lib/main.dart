import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mixinbuilder_testing/controller/userController.dart';
import 'package:flutter_mixinbuilder_testing/view/deleteUserList.dart';
import 'package:flutter_mixinbuilder_testing/view/updateUserList.dart';
import 'package:flutter_mixinbuilder_testing/view/userList.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/state_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final UserController controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Get Example With MixinBuilder",
                style: TextStyle(fontSize: 18)),
            actions: [
              MixinBuilder<UserController>(
                builder: (po) => Row(
                  children: [
                    Badge(
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        controller.updatedUserCount.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.edit_notifications),
                          onPressed: () {
                            Get.to(UpdateUser());
                          }),
                    ),
                    Badge(
                      position: BadgePosition.topEnd(top: 0, end: 3),
                      animationDuration: const Duration(milliseconds: 300),
                      animationType: BadgeAnimationType.slide,
                      badgeContent: Text(
                        controller.deletedUserCount.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      child: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            Get.to(DeleteUser());
                          }),
                    ),
                  ],
                ),
              ),
            ]),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [userList()],
        ),
      ),
    );
  }
}
