import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/internship_screen/filter_screens/filter_controller.dart';
import 'package:internshala/utils/constants.dart';
import 'package:internshala/widgets/custom_checkbox.dart';
import 'package:internshala/widgets/custom_elevated_button.dart';

class CityFilterScreen extends StatefulWidget {
  const CityFilterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CityFilterScreenState createState() => _CityFilterScreenState();
}

class _CityFilterScreenState extends State<CityFilterScreen> {
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
                  controller.selectedCities.clear();
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
              if (controller.selectedCities.isNotEmpty)
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.selectedCities.length,
                    itemBuilder: (context, index) {
                      final profile = controller.selectedCities[index];
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
                              controller.selectedCities.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    final city = cities[index];
                    if (searchController.text.isNotEmpty &&
                        !city
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                      return const SizedBox.shrink();
                    }

                    return CustomCheckbox(
                      title: Text(city),
                      value: controller.selectedCities.contains(city),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                           controller.selectedCities.insert(0, city.toLowerCase());
                          } else {
                            controller.selectedCities.remove(city.toLowerCase());
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
