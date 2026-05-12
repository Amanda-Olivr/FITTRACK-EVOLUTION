import 'package:flutter/material.dart';
import 'package:fittrack_evolution/theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildTopAppBar(),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.marginMobile,
              AppSpacing.lg,
              AppSpacing.marginMobile,
              AppSpacing.xxl,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _StreakCard(),
                const SizedBox(height: AppSpacing.gutter),
                _DailyPulseCard(),
                const SizedBox(height: AppSpacing.gutter),
                _TodayWorkoutCard(),
                const SizedBox(height: AppSpacing.gutter),
                _RecentProgressCard(),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildTopAppBar() {
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
          // Avatar
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryFixed, width: 1.5),
              color: AppColors.cardSurface,
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AppColors.primaryFixed,
              size: 22,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'WELCOME BACK',
                style: AppTextStyles.labelBold(
                    color: AppColors.onSurfaceVariant),
              ),
              Text(
                'ALEX R.',
                style: AppTextStyles.bodyLg(
                  color: AppColors.primaryFixed,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            'IRON PULSE',
            style: AppTextStyles.headlineLg(color: AppColors.primaryFixed)
                .copyWith(fontStyle: FontStyle.italic),
          ),
          const SizedBox(width: AppSpacing.sm),
          const Icon(Icons.bolt_rounded,
              color: AppColors.primaryFixed, size: 28),
        ],
      ),
    );
  }
}

// ─── STREAK CARD ───────────────────────────────────────────────────────────
class _StreakCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DarkCard(
      child: Stack(
        children: [
          // Decorative background icon
          Positioned(
            right: -12,
            bottom: -12,
            child: Icon(
              Icons.local_fire_department_rounded,
              size: 160,
              color: AppColors.primaryFixed.withValues(alpha: 0.06),
            ),
          ),
          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CONSISTENCY IS KEY',
                style: AppTextStyles.labelBold(color: AppColors.primaryFixed),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                '15 DAY STREAK!',
                style: AppTextStyles.displayLg(color: AppColors.onSurface),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Mini bar chart
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      _StreakBar(height: 32),
                      _StreakBar(height: 40),
                      _StreakBar(height: 48),
                      _StreakBar(height: 56),
                      _StreakBar(height: 64),
                      _StreakBar(height: 80),
                      _StreakBar(height: 96, isPulsing: true),
                    ],
                  ),
                  const Spacer(),
                  _LimeButton(
                    label: 'SHARE PROGRESS',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StreakBar extends StatelessWidget {
  final double height;
  final bool isPulsing;

  const _StreakBar({required this.height, this.isPulsing = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: height,
      margin: const EdgeInsets.only(right: 4),
      color: AppColors.primaryFixed,
    );
  }
}

// ─── DAILY PULSE CARD ──────────────────────────────────────────────────────
class _DailyPulseCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DarkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'DAILY PULSE',
            style: AppTextStyles.labelBold(color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Active Calories',
                  style: AppTextStyles.bodyMd(color: AppColors.onSurface)),
              Text('842',
                  style: AppTextStyles.statLg(color: AppColors.primaryFixed)),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          // Progress bar
          Container(
            height: 4,
            width: double.infinity,
            color: AppColors.cardBorder,
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.70,
              child: Container(color: AppColors.primaryFixed),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Heart Rate',
                  style: AppTextStyles.bodyMd(color: AppColors.onSurface)),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '148',
                      style: AppTextStyles.statLg(color: AppColors.secondary),
                    ),
                    TextSpan(
                      text: ' BPM',
                      style: AppTextStyles.labelBold(
                          color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ─── TODAY'S WORKOUT CARD ──────────────────────────────────────────────────
class _TodayWorkoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero image with gradient overlay
          SizedBox(
            height: 180,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  color: AppColors.surfaceContainerHigh,
                  child: const Icon(
                    Icons.fitness_center_rounded,
                    size: 80,
                    color: AppColors.cardBorder,
                  ),
                ),
                // Gradient overlay
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.cardSurface,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                // Badge
                Positioned(
                  bottom: AppSpacing.md,
                  left: AppSpacing.md,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm, vertical: 4),
                    color: AppColors.primaryFixed,
                    child: Text(
                      "TODAY'S SESSION",
                      style: AppTextStyles.labelBold(
                          color: AppColors.onPrimaryFixed),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('PUSH HYPERTROPHY',
                              style: AppTextStyles.headlineMd(
                                  color: AppColors.onSurface)),
                          Text('Chest, Shoulders & Triceps Focus',
                              style: AppTextStyles.bodySm(
                                  color: AppColors.onSurfaceVariant)),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('65',
                            style: AppTextStyles.statLg(
                                color: AppColors.onSurface)),
                        Text('MINS', style: AppTextStyles.bodySm()),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                // Stats row
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppSpacing.md),
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                          color: AppColors.cardBorder, width: 1),
                    ),
                  ),
                  child: Row(
                    children: [
                      _WorkoutStat(label: 'EXERCISES', value: '8'),
                      VerticalDivider(
                          color: AppColors.cardBorder,
                          width: 1,
                          thickness: 1),
                      _WorkoutStat(label: 'SETS', value: '24'),
                      VerticalDivider(
                          color: AppColors.cardBorder,
                          width: 1,
                          thickness: 1),
                      _WorkoutStat(
                        label: 'INTENSITY',
                        value: 'HIGH',
                        valueColor: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.lg),
                // CTA Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primaryFixed,
                      side: const BorderSide(
                          color: AppColors.primaryFixed, width: 2),
                      padding: const EdgeInsets.symmetric(
                          vertical: AppSpacing.md),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                    ),
                    child: Text(
                      'START WORKOUT',
                      style: AppTextStyles.labelBold(
                          color: AppColors.primaryFixed),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkoutStat extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _WorkoutStat(
      {required this.label, required this.value, this.valueColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(label,
              style: AppTextStyles.labelBold(color: AppColors.onSurfaceVariant),
              textAlign: TextAlign.center),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.bodyLg(
              color: valueColor ?? AppColors.onSurface,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ─── RECENT PROGRESS CARD ──────────────────────────────────────────────────
class _RecentProgressCard extends StatelessWidget {
  static const List<double> _barHeights = [0.40, 0.65, 0.55, 0.85, 0.95, 0.70, 0.80];

  @override
  Widget build(BuildContext context) {
    return _DarkCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'RECENT PROGRESS',
            style: AppTextStyles.labelBold(color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.lg),
          // Bar chart
          SizedBox(
            height: 128,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _barHeights.asMap().entries.map((e) {
                final isHighlighted = e.key == 4;
                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 128 * e.value,
                    color: isHighlighted
                        ? AppColors.primaryFixed
                        : AppColors.cardActive,
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          // Progress items
          _ProgressItem(
            icon: Icons.trending_up_rounded,
            label: 'Bench Press PR',
            value: '+5.5 LBS',
          ),
          const Divider(color: AppColors.cardBorder, height: 1),
          _ProgressItem(
            icon: Icons.monitor_weight_rounded,
            label: 'Body Fat',
            value: '-0.8 %',
          ),
          const Divider(color: AppColors.cardBorder, height: 1),
          _ProgressItem(
            icon: Icons.timer_rounded,
            label: 'Rest Average',
            value: '-12 SEC',
          ),
        ],
      ),
    );
  }
}

class _ProgressItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ProgressItem(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        children: [
          Icon(icon, color: AppColors.primaryFixed, size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
              child: Text(label,
                  style: AppTextStyles.bodyMd(color: AppColors.onSurface))),
          Text(value,
              style: AppTextStyles.labelBold(color: AppColors.onSurface)),
        ],
      ),
    );
  }
}

// ─── SHARED COMPONENTS ─────────────────────────────────────────────────────
class _DarkCard extends StatelessWidget {
  final Widget child;

  const _DarkCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: child,
    );
  }
}

class _LimeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const _LimeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        color: AppColors.primaryFixed,
        child: Text(
          label,
          style: AppTextStyles.labelBold(color: AppColors.onPrimaryFixed),
        ),
      ),
    );
  }
}
