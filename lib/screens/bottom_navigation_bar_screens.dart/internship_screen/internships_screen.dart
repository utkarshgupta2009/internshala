import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala/models/internship_meta.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/bottom_nav_bar.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/internship_screen/filter_screens/filter_screen.dart';
import 'package:internshala/services/internshala_api_services.dart';
import 'package:internshala/widgets/internship_details_card.dart';

import 'filter_screens/filter_controller.dart';

class InternshipsScreen extends StatelessWidget {
  const InternshipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FilterController());
    int durationSelected = controller.isDurationSelected.value ? 1 : 0;

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: const Icon(Icons.menu),
        title: const Text('Internships'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.notifications_none), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.chat_bubble_outline), onPressed: () {}),
        ],
      ),
      body: FutureBuilder<List<InternshipMeta>>(
        future: InternshalaApiServices().fetchInternshipList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return Column(
              children: [
                _buildFilterRow(controller, durationSelected),
                _buildInternshipCount(controller, snapshot.data!.length),
                Expanded(
                  child: _buildInternshipList(controller, snapshot.data!),
                ),
              ],
            );
          } else {
            return const Center(
              child: Text('No internships found'),
            );
          }
        },
      ),
    );
  }

  Widget _buildFilterRow(FilterController controller, int durationSelected) {
    return Row(
      mainAxisAlignment: controller.isAppliedFilter.value
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: OutlinedButton.icon(
            icon: const Icon(
              Icons.filter_alt_outlined,
              weight: 10,
              size: 15,
            ),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                ),
                if (controller.isAppliedFilter.value)
                  Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 12,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            (controller.selectedCities.length +
                                    controller.selectedProfiles.length +
                                    durationSelected)
                                .toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
            onPressed: () {
              Get.to(
                () => const FiltersScreen(),
                duration: Durations.medium2,
                transition: Transition.leftToRight,
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.blue,
              side: const BorderSide(color: Colors.blue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        if (controller.isAppliedFilter.value)
          Obx(
            () => SizedBox(
              height: 50,
              width: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.selectedCities.length +
                    controller.selectedProfiles.length +
                    durationSelected,
                itemBuilder: (context, index) {
                  if (index < controller.selectedCities.length) {
                    return _buildChoiceChip(controller, index,
                        controller.selectedCities[index], 'cities');
                  } else if (index <
                      controller.selectedCities.length +
                          controller.selectedProfiles.length) {
                    return _buildChoiceChip(
                        controller,
                        index - controller.selectedCities.length,
                        controller.selectedProfiles[
                            index - controller.selectedCities.length],
                        'profiles');
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          )
      ],
    );
  }

  Widget _buildChoiceChip(
      FilterController controller, int index, String label, String calledFrom) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        backgroundColor: Colors.white,
        showCheckmark: true,
        checkmarkColor: Colors.white,
        label: Text(label),
        selected: true,
        onSelected: (bool selected) {
          int isDurationSelected = controller.isDurationSelected.value ? 1 : 0;
          if (calledFrom == 'cities') {
            controller.selectedCities.remove(label);
            if ((controller.selectedCities.length +
                    controller.selectedProfiles.length +
                    isDurationSelected) ==
                0) {
              controller.isAppliedFilter.value = false;
              Get.offAll(() => MainScreen());
            }
            InternshalaApiServices().runFilters();
          } else {
            controller.selectedProfiles.remove(label);
            if ((controller.selectedCities.length +
                    controller.selectedProfiles.length +
                    isDurationSelected) ==
                0) {
              controller.isAppliedFilter.value = false;
              Get.offAll(() => MainScreen());
            }
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.blue),
        ),
        selectedColor: Colors.blue,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildInternshipCount(
      FilterController controller, int totalInternships) {
    return Text(
      controller.isAppliedFilter.value
          ? "${controller.filteredList.length.toString()} total internships"
          : "$totalInternships total internships",
      style: TextStyle(color: Colors.grey[600]),
    );
  }

  Widget _buildInternshipList(
      FilterController controller, List<InternshipMeta> internships) {
    if (controller.isAppliedFilter.value && controller.filteredList.isEmpty) {
      return const Center(
        child: Text("No internships found according to filters"),
      );
    }
    return Obx(
      () => ListView.builder(
        itemCount: controller.filteredList.isEmpty
            ? internships.length
            : controller.filteredList.length,
        itemBuilder: (context, index) {
          return InternshipCard(
            internshipMeta: controller.filteredList.isEmpty
                ? internships[index]
                : controller.filteredList[index],
          );
        },
      ),
    );
  }
}
