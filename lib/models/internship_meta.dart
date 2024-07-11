import 'package:json_annotation/json_annotation.dart';
part 'internship_meta.g.dart';

@JsonSerializable()
class InternshipMeta {
  final int? id;
  final String? title;
  final String? employment_type;
  final ApplicationStatusMessage? application_status_message;
  final String? job_title;
  final bool? work_from_home;
  final String? segment;
  final String? segment_label_value;
  final String? internship_type_label_value;
  final List<String>? job_segments;
  final String? company_name;
  final String? company_url;
  final bool? is_premium;
  final bool? is_premium_internship;
  final String? employer_name;
  final String? company_logo;
  final String? type;
  final String? url;
  final int? is_internchallenge;
  final bool? is_external;
  final bool? is_active;
  final String? expires_at;
  final String? closed_at;
  final String? profile_name;
  final bool? part_time;
  final String? start_date;
  final String? duration;
  final Stipend? stipend;
  final dynamic salary; // Changed to dynamic as it can be null or a string
  final dynamic job_experience; // Changed to dynamic as it can be null or a string
  final String? experience;
  final String? posted_on;
  final int? postedOnDateTime;
  final String? application_deadline;
  final String? expiring_in;
  final String? posted_by_label;
  final String? posted_by_label_type;
  final List<String>? location_names;
  final List<Location>? locations;
  final String? start_date_comparison_format;
  final String? start_date1;
  final String? start_date2;
  final bool? is_ppo;
  final bool? is_ppo_salary_disclosed;
  final dynamic ppo_salary; // Changed to dynamic as it can be null or a string
  final dynamic ppo_salary2; // Changed to dynamic as it can be null or a string
  final String? ppo_label_value;
  final bool? to_show_extra_label;
  final String? extra_label_value;
  final bool? is_extra_label_black;
  final List<dynamic>? campaign_names;
  final String? campaign_name;
  final bool? to_show_in_search;
  final String? campaign_url;
  final dynamic campaign_start_date_time; // Changed to dynamic as it can be null or a string
  final dynamic campaign_launch_date_time; // Changed to dynamic as it can be null or a string
  final dynamic campaign_early_access_start_date_time; // Changed to dynamic as it can be null or a string
  final dynamic campaign_end_date_time; // Changed to dynamic as it can be null or a string
  final List<Label>? labels;
  final String? labels_app;
  final List<String>? labels_app_in_card;
  final bool? is_covid_wfh_selected;
  final bool? to_show_card_message;
  final String? message;
  final bool? is_application_capping_enabled;
  final String? application_capping_message;
  final List<dynamic>? override_meta_details;
  final bool? eligible_for_easy_apply;
  final bool? eligible_for_b2b_apply_now;
  final bool? to_show_b2b_label;
  final bool? is_international_job;
  final bool? to_show_cover_letter;
  final dynamic office_days; // Changed to dynamic as it can be null or a string

  InternshipMeta({
    this.id,
    this.title,
    this.employment_type,
    this.application_status_message,
    this.job_title,
    this.work_from_home,
    this.segment,
    this.segment_label_value,
    this.internship_type_label_value,
    this.job_segments,
    this.company_name,
    this.company_url,
    this.is_premium,
    this.is_premium_internship,
    this.employer_name,
    this.company_logo,
    this.type,
    this.url,
    this.is_internchallenge,
    this.is_external,
    this.is_active,
    this.expires_at,
    this.closed_at,
    this.profile_name,
    this.part_time,
    this.start_date,
    this.duration,
    this.stipend,
    this.salary,
    this.job_experience,
    this.experience,
    this.posted_on,
    this.postedOnDateTime,
    this.application_deadline,
    this.expiring_in,
    this.posted_by_label,
    this.posted_by_label_type,
    this.location_names,
    this.locations,
    this.start_date_comparison_format,
    this.start_date1,
    this.start_date2,
    this.is_ppo,
    this.is_ppo_salary_disclosed,
    this.ppo_salary,
    this.ppo_salary2,
    this.ppo_label_value,
    this.to_show_extra_label,
    this.extra_label_value,
    this.is_extra_label_black,
    this.campaign_names,
    this.campaign_name,
    this.to_show_in_search,
    this.campaign_url,
    this.campaign_start_date_time,
    this.campaign_launch_date_time,
    this.campaign_early_access_start_date_time,
    this.campaign_end_date_time,
    this.labels,
    this.labels_app,
    this.labels_app_in_card,
    this.is_covid_wfh_selected,
    this.to_show_card_message,
    this.message,
    this.is_application_capping_enabled,
    this.application_capping_message,
    this.override_meta_details,
    this.eligible_for_easy_apply,
    this.eligible_for_b2b_apply_now,
    this.to_show_b2b_label,
    this.is_international_job,
    this.to_show_cover_letter,
    this.office_days,
  });

  factory InternshipMeta.fromJson(Map<String, dynamic> json) => _$InternshipMetaFromJson(json);
  Map<String, dynamic> toJson() => _$InternshipMetaToJson(this);
}
@JsonSerializable()
class ApplicationStatusMessage {
  final bool? to_show;
  final String? message;
  final String? type;

  ApplicationStatusMessage({
    this.to_show,
    this.message,
    this.type,
  });

  factory ApplicationStatusMessage.fromJson(Map<String, dynamic> json) => _$ApplicationStatusMessageFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationStatusMessageToJson(this);
}

@JsonSerializable()
class Stipend {
  final String? salary;
  final String? tooltip;
  final int? salaryValue1;
  final int? salaryValue2;
  final String? salaryType;
  final String? currency;
  final String? scale;
  final bool? large_stipend_text;

  Stipend({
    this.salary,
    this.tooltip,
    this.salaryValue1,
    this.salaryValue2,
    this.salaryType,
    this.currency,
    this.scale,
    this.large_stipend_text,
  });

  factory Stipend.fromJson(Map<String, dynamic> json) => _$StipendFromJson(json);
  Map<String, dynamic> toJson() => _$StipendToJson(this);
}

@JsonSerializable()
class Location {
  final String? string;
  final String? link;
  final String? country;
  final String? region;
  final String? locationName;

  Location({
    this.string,
    this.link,
    this.country,
    this.region,
    this.locationName,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Label {
  final List<String>? label_value;
  final List<String>? label_mobile;
  final List<String>? label_app;
  final List<String>? labels_app_in_card;

  Label({
    this.label_value,
    this.label_mobile,
    this.label_app,
    this.labels_app_in_card,
  });

  factory Label.fromJson(Map<String, dynamic> json) => _$LabelFromJson(json);
  Map<String, dynamic> toJson() => _$LabelToJson(this);
}
