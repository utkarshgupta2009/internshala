import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/bottom_nav_bar.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/internship_screen/filter_screens/city_filter_screen.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/internship_screen/filter_screens/profile_filter_screen.dart';
import 'package:internshala/services/internshala_api_services.dart';
import 'package:internshala/utils/constants.dart';
import 'package:internshala/widgets/custom_checkbox.dart';
import 'package:internshala/widgets/custom_elevated_button.dart';

import 'filter_controller.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  FiltersScreenState createState() => FiltersScreenState();
}

class FiltersScreenState extends State<FiltersScreen> {
  bool asPerPreferences = false;
  bool workFromHome = false;
  bool partTime = false;
  bool internshipsWithJobOffer = false;
  bool fastResponse = false;
  bool earlyApplicant = false;
  bool internshpForWomen = false;
  String selectedStipend = '';
  final controller = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Filters',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.chat_bubble_outline), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCheckbox(
                title: Row(
                  children: [
                    const Text('As per my', style: TextStyle(fontSize: 16)),
                    TextButton(
                      style: TextButton.styleFrom(overlayColor: Colors.white),
                      onPressed: () {},
                      child: const Text('preferences',
                          style: TextStyle(color: Colors.blue, fontSize: 16)),
                    ),
                  ],
                ),
                value: asPerPreferences,
                onChanged: (bool? value) {
                  setState(() {
                    asPerPreferences = value!;
                  });
                },
              ),
              const SectionTitle('PROFILE'),
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
              AddButton(
                'Add profile',
                onPressed: () {
                  Get.to(() => const ProfileFilterScreen());
                },
              ),
              const SectionTitle(
                'CITY',
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
              AddButton(
                'Add city',
                onPressed: () {
                  Get.to(() => const CityFilterScreen());
                },
              ),
              const SectionTitle('INTERNSHIP TYPE'),
              CustomCheckbox(
                title: Text(
                  "Work from home",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: workFromHome,
                onChanged: (bool? value) {
                  setState(() {
                    workFromHome = value!;
                  });
                },
              ),
              CustomCheckbox(
                title: Text(
                  "Part-time",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: partTime,
                onChanged: (bool? value) {
                  setState(() {
                    partTime = value!;
                  });
                },
              ),
              const SectionTitle('MONTHLY STIPEND (INR)'),
              Wrap(
                spacing: 8,
                children: ['2,000', '4,000', '6,000', '8,000', '10,000']
                    .map((stipend) => ChoiceChip(
                          backgroundColor: Colors.white,
                          showCheckmark: false,
                          label: selectedStipend == stipend
                              ? Text('Atleast ₹ $stipend')
                              : Text('₹ $stipend'),
                          selected: selectedStipend == stipend,
                          onSelected: (bool selected) {
                            setState(() {
                              selectedStipend = selected ? stipend : '';
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          selectedColor: Colors.blue,
                          labelStyle: TextStyle(
                            color: selectedStipend == stipend
                                ? Colors.white
                                : Colors.blue,
                          ),
                        ))
                    .toList(),
              ),
              const SectionTitle('STARTING FROM (OR AFTER)'),
              Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    children: [
                      Center(
                        child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text(
                              "Choose date",
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                            )),
                      )
                    ],
                  )),
              const SectionTitle('MAXIMUM DURATION (IN MONTHS)'),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: ExpansionTile(
                  title: Text(
                   controller.selectedDuration.isEmpty
                        ? 'Choose Duration'
                        : controller.selectedDuration.value,
                    style: TextStyle(
                        color: controller.selectedDuration.isEmpty
                            ? Colors.grey
                            : Colors.black),
                  ),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: durations.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(durations[index]),
                          onTap: () {
                            setState(() {
                              controller.selectedDuration.value = durations[index];
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SectionTitle('MORE FILTERS'),
              CustomCheckbox(
                title: Text(
                  "Internships with job offers",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: internshipsWithJobOffer,
                onChanged: (bool? value) {
                  setState(() {
                    internshipsWithJobOffer = value!;
                  });
                },
                secondary: const Icon(Icons.help_outline, size: 20),
              ),
              CustomCheckbox(
                title: Text(
                  "Fast responses",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: fastResponse,
                onChanged: (bool? value) {
                  setState(() {
                    fastResponse = value!;
                  });
                },
                secondary: const Icon(Icons.help_outline, size: 20),
              ),
              CustomCheckbox(
                title: Text(
                  "Early applicant",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: earlyApplicant,
                onChanged: (bool? value) {
                  setState(() {
                    earlyApplicant = value!;
                  });
                },
                secondary: const Icon(Icons.help_outline, size: 20),
              ),
              CustomCheckbox(
                title: Text(
                  "Internships for women",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                value: internshpForWomen,
                onChanged: (bool? value) {
                  setState(() {
                    internshpForWomen = value!;
                  });
                },
                secondary: const Icon(Icons.help_outline, size: 20),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  clearFilters();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blue,
                  backgroundColor: Colors.white,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.35, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  side: const BorderSide(color: Colors.blue),
                ),
                child: const Text('Clear all'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
                child: CustomElevatedButton(
                    onPressed: () async {
                      if (controller.selectedDuration.value != '') {
                        controller.isDurationSelected.value = true;
                      }
                      if (controller.selectedCities.isEmpty &&
                          controller.selectedProfiles.isEmpty &&
                          controller.isDurationSelected.isFalse) {
                        Get.offAll(MainScreen());
                      } else {
                        controller.isAppliedFilter.value = true;
                        controller.filteredList.clear;
                        InternshalaApiServices().runFilters(
                        );
                      }
                    },
                    title: "Apply",
                    minSize:
                        Size(MediaQuery.of(context).size.width * 0.35, 48))),
          ],
        ),
      ),
    );
  }

  void clearFilters() {
    setState(() {
      asPerPreferences = false;
      workFromHome = false;
      partTime = false;
      internshipsWithJobOffer = false;
      fastResponse = false;
      earlyApplicant = false;
      internshpForWomen = false;
      selectedStipend = '';
      controller.selectedDuration.value = '';
      controller.isDurationSelected.value = false;
      controller.isAppliedFilter.value = false;
      controller.selectedProfiles.clear();
      controller.selectedCities.clear();
      controller.filteredList.clear();
    });
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final String label;
  final dynamic onPressed;
  const AddButton(this.label, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: const Icon(Icons.add, color: Colors.blue),
      label: Text(label, style: const TextStyle(color: Colors.blue)),
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue, // This sets the default color
        overlayColor: Colors.white, // This sets the tap highlight color
      ),
      onPressed: onPressed,
    );
  }
}
