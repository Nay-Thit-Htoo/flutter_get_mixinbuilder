// ignore_for_file: file_names, camel_case_types, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_mixinbuilder_testing/controller/userController.dart';
import 'package:flutter_mixinbuilder_testing/main.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({Key? key}) : super(key: key);

  final UserController controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Get Example With MixinBuilder"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            onPressed: () {
              Get.back();
            },
          )),
      body: Column(
        children: [
          Flexible(
              child: MixinBuilder<UserController>(
            init: controller,
            builder: (p0) => ListView.builder(
              itemCount: controller.updatedUserList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(
                                controller.updatedUserList[index].profileUrl),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name - " +
                                    controller.updatedUserList[index].name,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Email - " +
                                    controller.updatedUserList[index].email,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Phone - " +
                                    controller.updatedUserList[index].phone,
                                style: const TextStyle(fontSize: 14),
                              ),
                              Text(
                                "Address - " +
                                    controller.updatedUserList[index].address,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Text(
                            "UPDATED DATE : " +
                                controller.updatedUserList[index].repairDate
                                    .split(" ")[0],
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ]),
                    ],
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
