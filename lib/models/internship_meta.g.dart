// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internship_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InternshipMeta _$InternshipMetaFromJson(Map<String, dynamic> json) =>
    InternshipMeta(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      employment_type: json['employment_type'] as String?,
      application_status_message: json['application_status_message'] == null
          ? null
          : ApplicationStatusMessage.fromJson(
              json['application_status_message'] as Map<String, dynamic>),
      job_title: json['job_title'] as String?,
      work_from_home: json['work_from_home'] as bool?,
      segment: json['segment'] as String?,
      segment_label_value: json['segment_label_value'] as String?,
      internship_type_label_value:
          json['internship_type_label_value'] as String?,
      job_segments: (json['job_segments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      company_name: json['company_name'] as String?,
      company_url: json['company_url'] as String?,
      is_premium: json['is_premium'] as bool?,
      is_premium_internship: json['is_premium_internship'] as bool?,
      employer_name: json['employer_name'] as String?,
      company_logo: json['company_logo'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
      is_internchallenge: (json['is_internchallenge'] as num?)?.toInt(),
      is_external: json['is_external'] as bool?,
      is_active: json['is_active'] as bool?,
      expires_at: json['expires_at'] as String?,
      closed_at: json['closed_at'] as String?,
      profile_name: json['profile_name'] as String?,
      part_time: json['part_time'] as bool?,
      start_date: json['start_date'] as String?,
      duration: json['duration'] as String?,
      stipend: json['stipend'] == null
          ? null
          : Stipend.fromJson(json['stipend'] as Map<String, dynamic>),
      salary: json['salary'],
      job_experience: json['job_experience'],
      experience: json['experience'] as String?,
      posted_on: json['posted_on'] as String?,
      postedOnDateTime: (json['postedOnDateTime'] as num?)?.toInt(),
      application_deadline: json['application_deadline'] as String?,
      expiring_in: json['expiring_in'] as String?,
      posted_by_label: json['posted_by_label'] as String?,
      posted_by_label_type: json['posted_by_label_type'] as String?,
      location_names: (json['location_names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
          .toList(),
      start_date_comparison_format:
          json['start_date_comparison_format'] as String?,
      start_date1: json['start_date1'] as String?,
      start_date2: json['start_date2'] as String?,
      is_ppo: json['is_ppo'] as bool?,
      is_ppo_salary_disclosed: json['is_ppo_salary_disclosed'] as bool?,
      ppo_salary: json['ppo_salary'],
      ppo_salary2: json['ppo_salary2'],
      ppo_label_value: json['ppo_label_value'] as String?,
      to_show_extra_label: json['to_show_extra_label'] as bool?,
      extra_label_value: json['extra_label_value'] as String?,
      is_extra_label_black: json['is_extra_label_black'] as bool?,
      campaign_names: json['campaign_names'] as List<dynamic>?,
      campaign_name: json['campaign_name'] as String?,
      to_show_in_search: json['to_show_in_search'] as bool?,
      campaign_url: json['campaign_url'] as String?,
      campaign_start_date_time: json['campaign_start_date_time'],
      campaign_launch_date_time: json['campaign_launch_date_time'],
      campaign_early_access_start_date_time:
          json['campaign_early_access_start_date_time'],
      campaign_end_date_time: json['campaign_end_date_time'],
      labels: (json['labels'] as List<dynamic>?)
          ?.map((e) => Label.fromJson(e as Map<String, dynamic>))
          .toList(),
      labels_app: json['labels_app'] as String?,
      labels_app_in_card: (json['labels_app_in_card'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      is_covid_wfh_selected: json['is_covid_wfh_selected'] as bool?,
      to_show_card_message: json['to_show_card_message'] as bool?,
      message: json['message'] as String?,
      is_application_capping_enabled:
          json['is_application_capping_enabled'] as bool?,
      application_capping_message:
          json['application_capping_message'] as String?,
      override_meta_details: json['override_meta_details'] as List<dynamic>?,
      eligible_for_easy_apply: json['eligible_for_easy_apply'] as bool?,
      eligible_for_b2b_apply_now: json['eligible_for_b2b_apply_now'] as bool?,
      to_show_b2b_label: json['to_show_b2b_label'] as bool?,
      is_international_job: json['is_international_job'] as bool?,
      to_show_cover_letter: json['to_show_cover_letter'] as bool?,
      office_days: json['office_days'],
    );

Map<String, dynamic> _$InternshipMetaToJson(InternshipMeta instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'employment_type': instance.employment_type,
      'application_status_message': instance.application_status_message,
      'job_title': instance.job_title,
      'work_from_home': instance.work_from_home,
      'segment': instance.segment,
      'segment_label_value': instance.segment_label_value,
      'internship_type_label_value': instance.internship_type_label_value,
      'job_segments': instance.job_segments,
      'company_name': instance.company_name,
      'company_url': instance.company_url,
      'is_premium': instance.is_premium,
      'is_premium_internship': instance.is_premium_internship,
      'employer_name': instance.employer_name,
      'company_logo': instance.company_logo,
      'type': instance.type,
      'url': instance.url,
      'is_internchallenge': instance.is_internchallenge,
      'is_external': instance.is_external,
      'is_active': instance.is_active,
      'expires_at': instance.expires_at,
      'closed_at': instance.closed_at,
      'profile_name': instance.profile_name,
      'part_time': instance.part_time,
      'start_date': instance.start_date,
      'duration': instance.duration,
      'stipend': instance.stipend,
      'salary': instance.salary,
      'job_experience': instance.job_experience,
      'experience': instance.experience,
      'posted_on': instance.posted_on,
      'postedOnDateTime': instance.postedOnDateTime,
      'application_deadline': instance.application_deadline,
      'expiring_in': instance.expiring_in,
      'posted_by_label': instance.posted_by_label,
      'posted_by_label_type': instance.posted_by_label_type,
      'location_names': instance.location_names,
      'locations': instance.locations,
      'start_date_comparison_format': instance.start_date_comparison_format,
      'start_date1': instance.start_date1,
      'start_date2': instance.start_date2,
      'is_ppo': instance.is_ppo,
      'is_ppo_salary_disclosed': instance.is_ppo_salary_disclosed,
      'ppo_salary': instance.ppo_salary,
      'ppo_salary2': instance.ppo_salary2,
      'ppo_label_value': instance.ppo_label_value,
      'to_show_extra_label': instance.to_show_extra_label,
      'extra_label_value': instance.extra_label_value,
      'is_extra_label_black': instance.is_extra_label_black,
      'campaign_names': instance.campaign_names,
      'campaign_name': instance.campaign_name,
      'to_show_in_search': instance.to_show_in_search,
      'campaign_url': instance.campaign_url,
      'campaign_start_date_time': instance.campaign_start_date_time,
      'campaign_launch_date_time': instance.campaign_launch_date_time,
      'campaign_early_access_start_date_time':
          instance.campaign_early_access_start_date_time,
      'campaign_end_date_time': instance.campaign_end_date_time,
      'labels': instance.labels,
      'labels_app': instance.labels_app,
      'labels_app_in_card': instance.labels_app_in_card,
      'is_covid_wfh_selected': instance.is_covid_wfh_selected,
      'to_show_card_message': instance.to_show_card_message,
      'message': instance.message,
      'is_application_capping_enabled': instance.is_application_capping_enabled,
      'application_capping_message': instance.application_capping_message,
      'override_meta_details': instance.override_meta_details,
      'eligible_for_easy_apply': instance.eligible_for_easy_apply,
      'eligible_for_b2b_apply_now': instance.eligible_for_b2b_apply_now,
      'to_show_b2b_label': instance.to_show_b2b_label,
      'is_international_job': instance.is_international_job,
      'to_show_cover_letter': instance.to_show_cover_letter,
      'office_days': instance.office_days,
    };

ApplicationStatusMessage _$ApplicationStatusMessageFromJson(
        Map<String, dynamic> json) =>
    ApplicationStatusMessage(
      to_show: json['to_show'] as bool?,
      message: json['message'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$ApplicationStatusMessageToJson(
        ApplicationStatusMessage instance) =>
    <String, dynamic>{
      'to_show': instance.to_show,
      'message': instance.message,
      'type': instance.type,
    };

Stipend _$StipendFromJson(Map<String, dynamic> json) => Stipend(
      salary: json['salary'] as String?,
      tooltip: json['tooltip'] as String?,
      salaryValue1: (json['salaryValue1'] as num?)?.toInt(),
      salaryValue2: (json['salaryValue2'] as num?)?.toInt(),
      salaryType: json['salaryType'] as String?,
      currency: json['currency'] as String?,
      scale: json['scale'] as String?,
      large_stipend_text: json['large_stipend_text'] as bool?,
    );

Map<String, dynamic> _$StipendToJson(Stipend instance) => <String, dynamic>{
      'salary': instance.salary,
      'tooltip': instance.tooltip,
      'salaryValue1': instance.salaryValue1,
      'salaryValue2': instance.salaryValue2,
      'salaryType': instance.salaryType,
      'currency': instance.currency,
      'scale': instance.scale,
      'large_stipend_text': instance.large_stipend_text,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      string: json['string'] as String?,
      link: json['link'] as String?,
      country: json['country'] as String?,
      region: json['region'] as String?,
      locationName: json['locationName'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'string': instance.string,
      'link': instance.link,
      'country': instance.country,
      'region': instance.region,
      'locationName': instance.locationName,
    };

Label _$LabelFromJson(Map<String, dynamic> json) => Label(
      label_value: (json['label_value'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      label_mobile: (json['label_mobile'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      label_app: (json['label_app'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      labels_app_in_card: (json['labels_app_in_card'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LabelToJson(Label instance) => <String, dynamic>{
      'label_value': instance.label_value,
      'label_mobile': instance.label_mobile,
      'label_app': instance.label_app,
      'labels_app_in_card': instance.labels_app_in_card,
    };
