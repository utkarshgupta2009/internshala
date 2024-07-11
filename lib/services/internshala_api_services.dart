import 'dart:convert';

import 'package:get/get.dart';
import 'package:internshala/models/internship_meta.dart';
import 'package:http/http.dart' as http;
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/bottom_nav_bar.dart';
import 'package:internshala/screens/bottom_navigation_bar_screens.dart/internship_screen/filter_screens/filter_controller.dart';

class InternshalaApiServices {
  final controller = Get.put(FilterController());
  List<InternshipMeta> allInternships = [];

  Future<List<InternshipMeta>> fetchInternshipList() async {
    final client = http.Client();

    try {
      final response = await client
          .get(Uri.parse('https://internshala.com/flutter_hiring/search'));

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final internshipsMeta =
            jsonData['internships_meta'] as Map<dynamic, dynamic>;

        internshipsMeta.forEach((_, internshipJson) {
          try {
            allInternships.add(InternshipMeta.fromJson(internshipJson));
          } catch (e) {
            print('Error parsing internship: $e');
          }
        });
      } else {
        throw Exception('Failed to load internships: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching internships: $e');
    } finally {
      client.close();
    }

    return allInternships;
  }

  void runFilters(
   
  ) async {
    // Fetch all internships
    List<InternshipMeta> allInternships = await fetchInternshipList();

    // Initialize selectedDurationValue to a high value if no duration is selected
    int selectedDurationValue = 0;

    // Extract the numeric value from the selectedDuration string if it is not empty
    if (controller.selectedDuration.isNotEmpty) {
      selectedDurationValue = int.parse(controller.selectedDuration.split(' ')[0]);
    }

    for (var internship in allInternships) {
      bool matchesDuration = true;
      bool matchesCities = true;
      bool matchesProfiles = true;

      // Filter by duration
      if (controller.selectedDuration.isNotEmpty) {
        // Extract the numeric value from the internship's duration string
        int internshipDurationValue =
            int.parse(internship.duration!.split(' ')[0]);
        matchesDuration = internshipDurationValue <= selectedDurationValue;
      }

      // Filter by cities
      if (controller.selectedCities.isNotEmpty) {
        String location = internship.locations?.isNotEmpty == true
            ? internship.locations!.first.locationName ?? ''
            : '';
        matchesCities =
            controller.selectedCities.contains(location.toLowerCase());
      }

      // Filter by profiles
      if (controller.selectedProfiles.isNotEmpty) {
        matchesProfiles = controller.selectedProfiles
            .contains(internship.profile_name!.toLowerCase());
      }

      // Add internship to filteredList if it matches all filters
      if (matchesDuration && matchesCities && matchesProfiles) {
        controller.filteredList.add(internship);
      }
    }
    Get.off(MainScreen());
  }
}
