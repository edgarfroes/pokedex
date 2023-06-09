import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../models/pokemon_model.dart';
import '../../design_system/all.dart';

class PokemonImage extends StatelessWidget {
  const PokemonImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: ValueKey(imageUrl),
      imageUrl: imageUrl,
      fadeInCurve: Curves.easeOut,
      fadeInDuration: const Duration(milliseconds: 200),
      imageBuilder: (context, imageProvider) => Image(image: imageProvider),
      placeholder: (context, url) => const _Placeholder(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        Assets.icons.pokeball,
        width: 50,
        height: 50,
        colorFilter: const ColorFilter.mode(
          Colors.light,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
