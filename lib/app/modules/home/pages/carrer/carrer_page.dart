import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart'; // Import the package

import 'carrer_controller.dart';

class CarrerPage extends StatefulWidget {
  final CarrerController controller;
  const CarrerPage({
    super.key,
    required this.controller,
  });

  @override
  State<CarrerPage> createState() => _CarrerPageState();
}

class _CarrerPageState extends State<CarrerPage> {
  CarrerController get controller => widget.controller;

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Get theme for consistent styling

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expêriencia"),
        backgroundColor: Colors.transparent, // Keep transparent if desired
        elevation: 0,
      ),
      body: ListenableBuilder(
        listenable: controller.store,
        builder: (context, child) {
          // --- Loading State ---
          if (controller.store.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          // --- Empty State ---
          if (controller.store.experience.isEmpty) {
            return const Center(child: Text("Nenhuma experiência encontrada."));
          }

          // --- Success State (Timeline) ---
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Add padding
            itemCount: controller.store.experience.length,
            itemBuilder: (context, index) {
              final experience = controller.store.experience[index];
              final isFirst = index == 0;
              final isLast = index == controller.store.experience.length - 1;

              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.15, // Position the line slightly to the left
                isFirst: isFirst,
                isLast: isLast,
                // Style the indicator (the dot on the timeline)
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicatorXY: 0.5, // Center the indicator on the line
                  indicator: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary, // Use primary color
                      shape: BoxShape.circle,
                    ),
                  ),
                  padding: const EdgeInsets.all(6), // Padding around indicator
                ),
                // Style the line before the indicator
                beforeLineStyle: LineStyle(
                  color: theme.colorScheme.primary
                      .withOpacity(0.5), // Lighter primary color
                  thickness: 2,
                ),
                // Style the line after the indicator
                afterLineStyle: LineStyle(
                  color: theme.colorScheme.primary.withOpacity(0.5),
                  thickness: 2,
                ),
                // Content for each timeline item
                endChild: Container(
                  constraints: const BoxConstraints(
                    minHeight: 120, // Ensure minimum height for spacing
                  ),
                  padding: const EdgeInsets.only(
                      left: 16.0,
                      top: 8.0,
                      bottom: 16.0,
                      right: 8.0), // Padding for content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center content vertically
                    children: [
                      // Date Range (Formatted MM/yyyy - MM/yyyy or Atual)
                      Text(
                        '${experience.formattedStart} - ${experience.formattedEnd}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Company Name
                      Text(
                        experience.company,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Role
                      Text(
                        experience.role,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: theme.colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Description (using ExpansionTile for collapsibility)
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero, // Remove default padding
                        title: Text(
                          'Detalhes',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        childrenPadding:
                            const EdgeInsets.only(top: 4.0, bottom: 8.0),
                        children: experience.description
                            .map((desc) => Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("• ",
                                          style: TextStyle(
                                              fontWeight: FontWeight
                                                  .bold)), // Bullet point
                                      Expanded(
                                          child: Text(desc,
                                              style:
                                                  theme.textTheme.bodySmall)),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
