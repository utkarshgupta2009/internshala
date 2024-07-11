import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/internship_screen/filter_screens/filter_controller.dart';
import 'package:internshala/utils/constants.dart';
import 'package:internshala/widgets/custom_checkbox.dart';
import 'package:internshala/widgets/custom_elevated_button.dart';

class ProfileFilterScreen extends StatefulWidget {
  const ProfileFilterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileFilterScreenState createState() => _ProfileFilterScreenState();
}

class _ProfileFilterScreenState extends State<ProfileFilterScreen> {
  TextEditingController searchController = TextEditingController();
  final controller = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            forceMaterialTransparency: true,
            title: const Text(
              'Profile',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            actions: [
              TextButton(
                child: const Text('Clear all',
                    style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  controller.selectedProfiles.clear();
                },
              ),
              CustomElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  title: "Apply",
                  minSize: Size(Get.width * 0.2, 35))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorColor: Colors.blue,
                  autofocus: true,
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search profile',
                    labelStyle: TextStyle(color: Colors.blue),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
              if (controller.selectedProfiles.isNotEmpty)
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.selectedProfiles.length,
                    itemBuilder: (context, index) {
                      final profile = controller.selectedProfiles[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          backgroundColor:
                              const Color.fromARGB(255, 36, 141, 227),
                          labelStyle: const TextStyle(color: Colors.white),
                          deleteIconColor: Colors.white,
                          side: BorderSide.none,
                          label: Text(profile),
                          deleteIcon: const Icon(Icons.close),
                          onDeleted: () {
                            setState(() {
                              controller.selectedProfiles.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: profiles.length,
                  itemBuilder: (context, index) {
                    final profile = profiles[index];
                    if (searchController.text.isNotEmpty &&
                        !profile
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                      return const SizedBox.shrink();
                    }

                    return CustomCheckbox(
                      title: Text(profile),
                      value: controller.selectedProfiles.contains(profile),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                           controller.selectedProfiles.insert(0, profile.toLowerCase());
                           
                          } else {
                            controller.selectedProfiles.remove(profile);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
