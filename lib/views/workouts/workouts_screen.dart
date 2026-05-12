import 'package:flutter/material.dart';
import 'package:fittrack_evolution/theme/app_theme.dart';

// ─── MODEL ──────────────────────────────────────────────────────────────────
class ExerciseSet {
  final int setNumber;
  String kg;
  String reps;
  bool done;

  ExerciseSet({
    required this.setNumber,
    this.kg = '',
    this.reps = '',
    this.done = false,
  });
}

class Exercise {
  final String name;
  final String primaryMuscle;
  final IconData icon;
  final List<ExerciseSet> sets;

  Exercise({
    required this.name,
    required this.primaryMuscle,
    required this.icon,
    required this.sets,
  });
}

// ─── SCREEN ─────────────────────────────────────────────────────────────────
class WorkoutsScreen extends StatefulWidget {
  const WorkoutsScreen({super.key});

  @override
  State<WorkoutsScreen> createState() => _WorkoutsScreenState();
}

class _WorkoutsScreenState extends State<WorkoutsScreen> {
  // Rest Timer state
  int _restSeconds = 90;
  bool _timerRunning = false;

  final List<Exercise> _exercises = [
    Exercise(
      name: 'BARBELL SQUAT',
      primaryMuscle: 'PRIMARY: QUADRICEPS',
      icon: Icons.fitness_center_rounded,
      sets: [
        ExerciseSet(setNumber: 1, kg: '100', reps: '10', done: true),
        ExerciseSet(setNumber: 2, kg: '', reps: '', done: false),
        ExerciseSet(setNumber: 3, kg: '', reps: '', done: false),
      ],
    ),
    Exercise(
      name: 'LEG PRESS 45°',
      primaryMuscle: 'PRIMARY: QUADRICEPS',
      icon: Icons.directions_run_rounded,
      sets: [
        ExerciseSet(setNumber: 1, kg: '240', reps: '12', done: false),
        ExerciseSet(setNumber: 2, kg: '', reps: '', done: false),
      ],
    ),
  ];

  String get _timerLabel {
    final m = (_restSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (_restSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              _buildAppBar(),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.marginMobile,
                  AppSpacing.lg,
                  AppSpacing.marginMobile,
                  160, // space for rest timer + nav
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _buildSessionHeader(),
                    const SizedBox(height: AppSpacing.xl),
                    ..._exercises.map((e) => Padding(
                          padding:
                              const EdgeInsets.only(bottom: AppSpacing.lg),
                          child: _ExerciseCard(
                            exercise: e,
                            onSetToggle: (si) => setState(() {
                              e.sets[si].done = !e.sets[si].done;
                            }),
                            onKgChange: (si, v) =>
                                setState(() => e.sets[si].kg = v),
                            onRepsChange: (si, v) =>
                                setState(() => e.sets[si].reps = v),
                          ),
                        )),
                    _buildAddExerciseButton(),
                    const SizedBox(height: AppSpacing.xxl),
                    _buildActionButtons(),
                  ]),
                ),
              ),
            ],
          ),
          // Floating Rest Timer
          Positioned(
            bottom: 80, // above bottom nav
            left: AppSpacing.marginMobile,
            right: AppSpacing.marginMobile,
            child: _RestTimerBanner(
              timerLabel: _timerLabel,
              isRunning: _timerRunning,
              onStart: () => setState(() => _timerRunning = !_timerRunning),
              onReset: () => setState(() {
                _restSeconds = 90;
                _timerRunning = false;
              }),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.background.withValues(alpha: 0.9),
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
              border: Border.all(color: AppColors.primaryFixed, width: 1.5),
              color: AppColors.cardSurface,
            ),
            child: const Icon(Icons.person_rounded,
                color: AppColors.primaryFixed, size: 18),
          ),
          const SizedBox(width: AppSpacing.sm),
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

  Widget _buildSessionHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.fitness_center_rounded,
                color: AppColors.primaryFixed, size: 18),
            const SizedBox(width: 6),
            Text('CURRENT SESSION',
                style:
                    AppTextStyles.labelBold(color: AppColors.primaryFixed)),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'LEG DAY',
          style: AppTextStyles.displayLg(color: AppColors.onSurface)
              .copyWith(fontStyle: FontStyle.italic),
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EST. TIME',
                    style: AppTextStyles.labelBold(
                        color: AppColors.onSurfaceVariant)),
                Text('65 MIN',
                    style:
                        AppTextStyles.headlineMd(color: AppColors.primary)),
              ],
            ),
            Container(
              width: 1,
              height: 32,
              margin:
                  const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              color: AppColors.outlineVariant,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('INTENSITY',
                    style: AppTextStyles.labelBold(
                        color: AppColors.onSurfaceVariant)),
                const SizedBox(height: 4),
                // Intensity gradient bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(99),
                  child: Container(
                    width: 96,
                    height: 8,
                    color: AppColors.surfaceContainerHighest,
                    child: FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: 0.75,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: AppColors.intensityGradient,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAddExerciseButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.outlineVariant,
            width: 2,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            const Icon(Icons.add_box_rounded,
                color: AppColors.onSurfaceVariant, size: 40),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'ADD EXERCISE',
              style: AppTextStyles.labelBold(
                  color: AppColors.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Finish Workout — Lime solid with hard shadow
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.primaryFixed,
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF2A3400),
                  offset: Offset(4, 4),
                  blurRadius: 0,
                ),
              ],
            ),
            child: Text(
              'FINISH WORKOUT',
              textAlign: TextAlign.center,
              style: AppTextStyles.headlineMd(color: AppColors.onPrimaryFixed)
                  .copyWith(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        // Discard — error outline
        GestureDetector(
          onTap: () {},
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.error, width: 2),
            ),
            child: Text(
              'DISCARD SESSION',
              textAlign: TextAlign.center,
              style: AppTextStyles.labelBold(color: AppColors.error),
            ),
          ),
        ),
      ],
    );
  }
}

// ─── EXERCISE CARD ──────────────────────────────────────────────────────────
class _ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final void Function(int setIndex) onSetToggle;
  final void Function(int setIndex, String value) onKgChange;
  final void Function(int setIndex, String value) onRepsChange;

  const _ExerciseCard({
    required this.exercise,
    required this.onSetToggle,
    required this.onKgChange,
    required this.onRepsChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        border: Border.all(color: AppColors.outlineVariant, width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          // Header row with image + name
          Row(
            children: [
              Container(
                width: 96,
                height: 96,
                color: AppColors.surfaceContainerHigh,
                child: Icon(exercise.icon,
                    size: 40, color: AppColors.cardBorder),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              exercise.name,
                              style: AppTextStyles.headlineMd(
                                  color: AppColors.primary),
                            ),
                            const SizedBox(height: AppSpacing.xs),
                            Text(
                              exercise.primaryMuscle,
                              style: AppTextStyles.labelBold(
                                  color: AppColors.onSurfaceVariant),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.info_outline_rounded,
                          color: AppColors.onSurfaceVariant, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Sets table
          Padding(
            padding: const EdgeInsets.fromLTRB(
                AppSpacing.md, 0, AppSpacing.md, AppSpacing.md),
            child: Column(
              children: [
                // Table header
                const _SetTableHeader(),
                const SizedBox(height: AppSpacing.sm),
                // Set rows
                ...exercise.sets.asMap().entries.map((e) => Padding(
                      padding:
                          const EdgeInsets.only(bottom: AppSpacing.sm),
                      child: _SetRow(
                        set: e.value,
                        onToggle: () => onSetToggle(e.key),
                        onKgChange: (v) => onKgChange(e.key, v),
                        onRepsChange: (v) => onRepsChange(e.key, v),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SetTableHeader extends StatelessWidget {
  const _SetTableHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ['SET', 'KG', 'REPS', 'STATUS'].map((h) {
        return Expanded(
          child: Text(
            h,
            textAlign: TextAlign.center,
            style:
                AppTextStyles.labelBold(color: AppColors.onSurfaceVariant),
          ),
        );
      }).toList(),
    );
  }
}

class _SetRow extends StatelessWidget {
  final ExerciseSet set;
  final VoidCallback onToggle;
  final void Function(String) onKgChange;
  final void Function(String) onRepsChange;

  const _SetRow({
    required this.set,
    required this.onToggle,
    required this.onKgChange,
    required this.onRepsChange,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (set.done) ? 1.0 : (set.kg.isEmpty ? 0.6 : 1.0),
      child: Row(
        children: [
          // Set number
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
              color: AppColors.surfaceContainerHighest,
              child: Text(
                '${set.setNumber}',
                textAlign: TextAlign.center,
                style: AppTextStyles.statLg(color: AppColors.onSurface),
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          // KG input
          Expanded(
            child: _SetInput(
              placeholder: set.kg.isEmpty ? '--' : set.kg,
              initialValue: set.kg,
              onChanged: onKgChange,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          // REPS input
          Expanded(
            child: _SetInput(
              placeholder: set.reps.isEmpty ? '--' : set.reps,
              initialValue: set.reps,
              onChanged: onRepsChange,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          // Status button
          Expanded(
            child: GestureDetector(
              onTap: onToggle,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                decoration: BoxDecoration(
                  color: set.done ? AppColors.primaryFixed : Colors.transparent,
                  border: Border.all(
                    color: AppColors.primaryFixed,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  set.done
                      ? Icons.check_circle_rounded
                      : Icons.radio_button_unchecked_rounded,
                  color: set.done
                      ? AppColors.onPrimaryFixed
                      : AppColors.primaryFixed,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SetInput extends StatelessWidget {
  final String placeholder;
  final String initialValue;
  final void Function(String) onChanged;

  const _SetInput({
    required this.placeholder,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: AppTextStyles.statLg(color: AppColors.primaryFixed),
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: AppTextStyles.statLg(color: AppColors.primaryFixed),
        filled: true,
        fillColor: AppColors.surfaceContainerLowest,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.outlineVariant, width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.primaryFixed, width: 2),
        ),
        border: InputBorder.none,
      ),
    );
  }
}

// ─── REST TIMER BANNER ──────────────────────────────────────────────────────
class _RestTimerBanner extends StatelessWidget {
  final String timerLabel;
  final bool isRunning;
  final VoidCallback onStart;
  final VoidCallback onReset;

  const _RestTimerBanner({
    required this.timerLabel,
    required this.isRunning,
    required this.onStart,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer.withValues(alpha: 0.95),
        border: Border.all(
            color: AppColors.primaryFixed.withValues(alpha: 0.3), width: 1),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 24,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Icon(Icons.timer_rounded,
                      color: AppColors.primaryFixed, size: 16),
                  const SizedBox(width: 4),
                  Text('REST TIMER',
                      style: AppTextStyles.labelBold(
                          color: AppColors.primaryFixed)),
                ],
              ),
              const SizedBox(height: 2),
              Text(timerLabel,
                  style: AppTextStyles.statLg(color: AppColors.onSurface)),
            ],
          ),
          const Spacer(),
          // Reset button
          GestureDetector(
            onTap: onReset,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                border:
                    Border.all(color: AppColors.outlineVariant, width: 1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Icon(Icons.refresh_rounded,
                      size: 16, color: AppColors.onSurface),
                  const SizedBox(width: 4),
                  Text('RESET',
                      style: AppTextStyles.labelBold(
                          color: AppColors.onSurface)),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          // Start/Pause button
          GestureDetector(
            onTap: onStart,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
              color: AppColors.primaryFixed,
              child: Row(
                children: [
                  Icon(
                    isRunning
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    size: 16,
                    color: AppColors.onPrimaryFixed,
                  ),
                  const SizedBox(width: 4),
                  Text(isRunning ? 'PAUSE' : 'START',
                      style: AppTextStyles.labelBold(
                          color: AppColors.onPrimaryFixed)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
