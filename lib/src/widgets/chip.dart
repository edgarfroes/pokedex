import 'package:pokedex/src/extensions/color_extensions.dart';

import '../presentation/design_system/all.dart';

class ChipRow extends StatelessWidget {
  const ChipRow({
    super.key,
    required this.chips,
  });

  final List<Chip> chips;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (_, index) {
        return chips[index];
      },
      scrollDirection: Axis.horizontal,
      itemCount: chips.length,
      padding: const EdgeInsets.all(6),
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 16,
        );
      },
    );
  }
}

class Chip extends StatelessWidget {
  const Chip({
    super.key,
    required this.label,
    required this.selected,
    required this.color,
    required this.onPressed,
    this.semanticsLabel,
  });

  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onPressed;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Semantics(
        label: semanticsLabel ?? label,
        toggled: selected,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onPressed,
          child: ExcludeSemantics(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              height: 20,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 2,
              ),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  if (selected) smallShadow,
                ],
              ),
              child: Text.subtitle3(
                label,
                color: color.contrasting,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
