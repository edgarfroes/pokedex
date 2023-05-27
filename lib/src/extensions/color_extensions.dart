import '../presentation/design_system/all.dart';

extension ColorExtensions on Color {
  Color get contrasting {
    final luminance = (0.299 * red + 0.587 * green + 0.114 * blue) / 255;

    return luminance > 0.5 ? Colors.dark : Colors.white;
  }
}
