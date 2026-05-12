import 'package:flutter/material.dart';
import 'package:fittrack_evolution/theme/app_theme.dart';

// ─── MODELS ─────────────────────────────────────────────────────────────────
class WorkoutHistoryItem {
  final String date;
  final String time;
  final String name;
  final String duration;
  final String volume;

  const WorkoutHistoryItem({
    required this.date,
    required this.time,
    required this.name,
    required this.duration,
    required this.volume,
  });
}

class HistoryMonth {
  final String label;
  final List<WorkoutHistoryItem> workouts;

  const HistoryMonth({required this.label, required this.workouts});
}

// ─── SCREEN ─────────────────────────────────────────────────────────────────
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  static const List<HistoryMonth> _data = [
    HistoryMonth(
      label: 'October 2023',
      workouts: [
        WorkoutHistoryItem(
          date: 'Oct 24, 2023',
          time: '08:30 AM',
          name: 'Upper Body A - Power',
          duration: '1h 12m',
          volume: '8,420 kg',
        ),
        WorkoutHistoryItem(
          date: 'Oct 22, 2023',
          time: '05:45 PM',
          name: 'Leg Day - Hypertrophy',
          duration: '58m',
          volume: '12,150 kg',
        ),
        WorkoutHistoryItem(
          date: 'Oct 21, 2023',
          time: '07:15 AM',
          name: 'Push Day - Secondary',
          duration: '1h 05m',
          volume: '6,800 kg',
        ),
      ],
    ),
    HistoryMonth(
      label: 'September 2023',
      workouts: [
        WorkoutHistoryItem(
          date: 'Sep 30, 2023',
          time: '09:00 AM',
          name: 'Pull Day - Heavy',
          duration: '1h 22m',
          volume: '9,940 kg',
        ),
        WorkoutHistoryItem(
          date: 'Sep 28, 2023',
          time: '06:00 PM',
          name: 'Full Body Blitz',
          duration: '45m',
          volume: '5,200 kg',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildAppBar(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.marginMobile,
              AppSpacing.lg,
              AppSpacing.marginMobile,
              AppSpacing.xxl,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildPageHeader(),
                const SizedBox(height: AppSpacing.xl),
                _buildStatsGrid(),
                const SizedBox(height: AppSpacing.xxl),
                ..._buildHistoryList(),
                const SizedBox(height: AppSpacing.xl),
                _buildLoadMoreButton(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // ── APP BAR ───────────────────────────────────────────────────────────────
  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(height: 1, color: AppColors.outlineVariant),
      ),
      title: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.outlineVariant, width: 1),
              color: AppColors.cardSurface,
            ),
            child: const Icon(Icons.person_rounded,
                color: AppColors.onSurfaceVariant, size: 18),
          ),
          const SizedBox(width: AppSpacing.md),
          Text(
            'IRON PULSE',
            style: AppTextStyles.headlineLg(color: AppColors.primaryFixed)
                .copyWith(fontStyle: FontStyle.italic),
          ),
          const Spacer(),
          const Icon(Icons.bolt_rounded,
              color: AppColors.primaryFixed, size: 26),
        ],
      ),
    );
  }

  // ── PAGE HEADER ───────────────────────────────────────────────────────────
  Widget _buildPageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'HISTORY',
          style: AppTextStyles.displayLg(color: AppColors.primary),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Tracking your relentless progress.',
          style: AppTextStyles.bodyMd(color: AppColors.onSurfaceVariant),
        ),
      ],
    );
  }

  // ── STATS GRID ────────────────────────────────────────────────────────────
  Widget _buildStatsGrid() {
    const stats = [
      _StatItem(label: 'This Month', value: '18', unit: 'Sessions'),
      _StatItem(label: 'Avg Time', value: '54m', unit: 'Per workout'),
      _StatItem(label: 'Total Volume', value: '124k', unit: 'Kilograms'),
      _StatItem(label: 'Streak', value: '5d', unit: 'Current active'),
    ];

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: AppSpacing.md,
      mainAxisSpacing: AppSpacing.md,
      childAspectRatio: 2.0,
      children: stats.map((s) => _StatCard(stat: s)).toList(),
    );
  }

  // ── HISTORY LIST ──────────────────────────────────────────────────────────
  List<Widget> _buildHistoryList() {
    final widgets = <Widget>[];
    for (final month in _data) {
      widgets.add(_MonthDivider(label: month.label));
      widgets.add(const SizedBox(height: AppSpacing.sm));
      for (final w in month.workouts) {
        widgets.add(_WorkoutHistoryCard(item: w));
        widgets.add(const SizedBox(height: AppSpacing.md));
      }
    }
    return widgets;
  }

  // ── LOAD MORE ─────────────────────────────────────────────────────────────
  Widget _buildLoadMoreButton() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl, vertical: AppSpacing.md),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryFixed, width: 2),
          ),
          child: Text(
            'LOAD OLDER SESSIONS',
            style: AppTextStyles.labelBold(color: AppColors.primaryFixed),
          ),
        ),
      ),
    );
  }
}

// ─── STAT CARD ───────────────────────────────────────────────────────────────
class _StatItem {
  final String label;
  final String value;
  final String unit;

  const _StatItem(
      {required this.label, required this.value, required this.unit});
}

class _StatCard extends StatelessWidget {
  final _StatItem stat;

  const _StatCard({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            stat.label.toUpperCase(),
            style:
                AppTextStyles.labelBold(color: AppColors.onSurfaceVariant),
          ),
          Text(
            stat.value,
            style: AppTextStyles.statLg(color: AppColors.primaryFixed),
          ),
          Text(
            stat.unit,
            style: AppTextStyles.bodySm(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

// ─── MONTH DIVIDER ───────────────────────────────────────────────────────────
class _MonthDivider extends StatelessWidget {
  final String label;

  const _MonthDivider({required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Row(
        children: [
          Text(
            label.toUpperCase(),
            style:
                AppTextStyles.labelBold(color: AppColors.primaryFixed),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Container(height: 1, color: AppColors.outlineVariant),
          ),
        ],
      ),
    );
  }
}

// ─── WORKOUT HISTORY CARD ─────────────────────────────────────────────────────
class _WorkoutHistoryCard extends StatefulWidget {
  final WorkoutHistoryItem item;

  const _WorkoutHistoryCard({required this.item});

  @override
  State<_WorkoutHistoryCard> createState() => _WorkoutHistoryCardState();
}

class _WorkoutHistoryCardState extends State<_WorkoutHistoryCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {},
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: AppColors.cardSurface,
            border: Border.all(
              color: _hovered
                  ? AppColors.primaryFixed
                  : AppColors.cardBorder,
              width: 1,
            ),
          ),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Lime accent left bar
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 4,
                  color: _hovered
                      ? AppColors.primaryFixed
                      : AppColors.primaryFixed,
                ),
                // Content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date + Time
                        Text(
                          '${widget.item.date} • ${widget.item.time}',
                          style: AppTextStyles.labelBold(
                              color: AppColors.onSurfaceVariant),
                        ),
                        const SizedBox(height: AppSpacing.xs),
                        // Name
                        Text(
                          widget.item.name,
                          style: AppTextStyles.headlineMd(
                              color: AppColors.primary),
                        ),
                        const SizedBox(height: AppSpacing.md),
                        // Stats row
                        Row(
                          children: [
                            _HistoryStat(
                                label: 'DURATION',
                                value: widget.item.duration),
                            const SizedBox(width: AppSpacing.xl),
                            _HistoryStat(
                                label: 'VOLUME',
                                value: widget.item.volume),
                            const Spacer(),
                            AnimatedRotation(
                              duration: const Duration(milliseconds: 200),
                              turns: _hovered ? 0 : 0,
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: _hovered
                                    ? AppColors.primaryFixed
                                    : AppColors.onSurfaceVariant,
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HistoryStat extends StatelessWidget {
  final String label;
  final String value;

  const _HistoryStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label.toUpperCase(),
            style:
                AppTextStyles.labelBold(color: AppColors.onSurfaceVariant)),
        Text(
          value,
          style: AppTextStyles.bodyLg(
              color: AppColors.primary, fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
