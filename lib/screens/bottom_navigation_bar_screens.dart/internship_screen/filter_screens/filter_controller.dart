import 'package:get/get.dart';
import 'package:internshala/models/internship_meta.dart';

class FilterController extends GetxController {
  RxList<InternshipMeta> filteredList = <InternshipMeta>[].obs;
  RxBool isAppliedFilter = false.obs;
  RxBool isDurationSelected = false.obs;
  RxList<String> selectedProfiles = <String>[].obs;
  RxList<String> selectedCities = <String>[].obs;
  RxString selectedDuration = ''.obs;
}
