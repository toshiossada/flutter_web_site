import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("experience".i18n()),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListenableBuilder(
        listenable: controller.store,
        builder: (context, child) {
          if (controller.store.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.store.experience.isEmpty) {
            return const Center(child: Text("Nenhuma experiência encontrada."));
          }

          return ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            itemCount: controller.store.experience.length,
            itemBuilder: (context, index) {
              final experience = controller.store.experience[index];
              final isFirst = index == 0;
              final isLast = index == controller.store.experience.length - 1;

              return TimelineTile(
                alignment: TimelineAlign.manual,
                lineXY: 0.15,
                isFirst: isFirst,
                isLast: isLast,
                indicatorStyle: IndicatorStyle(
                  width: 20,
                  height: 20,
                  indicatorXY: 0.5,
                  indicator: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
                  padding: const EdgeInsets.all(6),
                ),
                beforeLineStyle: LineStyle(
                  color: theme.colorScheme.primary.withValues(alpha: (255 / 2)),
                  thickness: 2,
                ),
                afterLineStyle: LineStyle(
                  color: theme.colorScheme.primary.withValues(alpha: (255 / 2)),
                  thickness: 2,
                ),
                endChild: Container(
                  constraints: const BoxConstraints(
                    minHeight: 120,
                  ),
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 8.0, bottom: 16.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${experience.formattedStart} - ${experience.formattedEnd}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: (255 * 0.7)),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        experience.company,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        experience.role,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontStyle: FontStyle.italic,
                          color: theme.colorScheme.onSurface
                              .withValues(alpha: (255 * 0.8)),
                        ),
                      ),
                      const SizedBox(height: 8),
                      ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: Text(
                          'details'.i18n(),
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
                                              fontWeight: FontWeight.bold)),
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
