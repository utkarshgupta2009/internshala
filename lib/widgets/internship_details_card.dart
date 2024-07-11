import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:internshala/models/internship_meta.dart';
import 'package:internshala/widgets/custom_elevated_button.dart';

class InternshipCard extends StatelessWidget {
  final InternshipMeta internshipMeta;

  const InternshipCard({super.key, required this.internshipMeta});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: const Color(0xfff8f8f8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (internshipMeta.is_active == true)
                      const Chip(
                        side: BorderSide(
                            color: Color.fromARGB(255, 209, 209, 209)),
                        labelPadding: EdgeInsets.zero,
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.trending_up,
                                size: 16, color: Colors.blue),
                            SizedBox(width: 4),
                            Text('Actively hiring',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                          ],
                        ),
                        backgroundColor: Colors.white,
                      ),
                    const SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                internshipMeta.title ?? 'Untitled Internship',
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                internshipMeta.company_name ??
                                    'Unknown Company',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey[600]),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        if (internshipMeta.company_logo != null &&
                            internshipMeta.company_logo!.isNotEmpty)
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CachedNetworkImage(
                              imageUrl: internshipMeta.company_url ?? '',
                              errorWidget: (context, url, error) {
                                return const Icon(Icons.error_outline_outlined);
                              },
                              fit: BoxFit.contain,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    _buildInfoRow(
                        Icons.location_on,
                        internshipMeta.locations?.isNotEmpty == true
                            ? internshipMeta.locations!.first.locationName ??
                                'No location'
                            : 'No location'),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                            child: _buildInfoRow(Icons.play_circle_outline,
                                'Starts Immediately')),
                        Expanded(
                            child: _buildInfoRow(
                                Icons.calendar_today,
                                internshipMeta.duration ??
                                    'Duration not specified')),
                      ],
                    ),
                    const SizedBox(height: 4),
                    _buildInfoRow(
                        Icons.attach_money,
                        internshipMeta.stipend?.salary ??
                            'Stipend not specified'),
                    const SizedBox(height: 8),
                    Wrap(
                      direction: Axis.vertical,
                      spacing: 8,
                      runSpacing: 4,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            internshipMeta.employment_type ?? 'Not specified',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                        _buildInfoRow(Icons.access_time,
                            internshipMeta.posted_on ?? 'Date not specified'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View Details",
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ),
                        const SizedBox(width: 8),
                        CustomElevatedButton(
                          title: "Apply now",
                          minSize: Size(
                              MediaQuery.of(context).size.width * 0.35, 37),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            text,
            style: TextStyle(color: Colors.grey[600]),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
