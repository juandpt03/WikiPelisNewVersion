import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wikipelis/domain/entities/watch_provider.dart';
import 'package:wikipelis/generated/l10n.dart';
import 'package:wikipelis/presentation/providers/providers.dart';

class MoviesWatchProviders extends ConsumerWidget {
  final String movieId;

  const MoviesWatchProviders({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchProviders = ref.watch(watchProvider(movieId));
    return watchProviders.when(
      data: (watchProviders) =>
          _WatchProvidersView(watchProviders: watchProviders),
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const Center(
          child: CircularProgressIndicator(
        strokeWidth: 2,
      )),
    );
  }
}

class _WatchProvidersView extends StatelessWidget {
  final List<WatchProvider> watchProviders;
  const _WatchProvidersView({required this.watchProviders});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyleTitle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colors.onBackground,
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(textStyleTitle: textStyleTitle),
        watchProviders.isNotEmpty
            ? _WatchProvidersImages(
                watchProviders: watchProviders,
              )
            : const _NoWatchProvidersWarning(),
      ],
    );
  }
}

class _NoWatchProvidersWarning extends StatelessWidget {
  const _NoWatchProvidersWarning();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final textStyleInformation =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
            );
    return Container(
      width: double.infinity,
      height: size.height * 0.12,
      color: colors.background,
      child: Center(
        child: Text(
          S.of(context).muyPronto,
          style: textStyleInformation,
        ),
      ),
    );
  }
}

class _WatchProvidersImages extends StatelessWidget {
  const _WatchProvidersImages({
    required this.watchProviders,
  });

  final List<WatchProvider> watchProviders;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final textStyleInformation =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
            );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(
          height: size.height * 0.12,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final watchProvider = watchProviders[index];
              return _WatchProviderImage(watchProvider: watchProvider);
            },
            itemCount: watchProviders.length,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text(
                'Powered by',
                style: textStyleInformation?.copyWith(fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.network(
                colorFilter: ColorFilter.mode(
                  Colors.yellow[700]!,
                  BlendMode.srcIn,
                ),
                'https://widget.justwatch.com/assets/JW_logo_color_10px.svg',
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.textStyleTitle,
  });

  final TextStyle? textStyleTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        S.of(context).disponibleEn,
        style: textStyleTitle,
      ),
    );
  }
}

class _WatchProviderImage extends StatelessWidget {
  const _WatchProviderImage({
    required this.watchProvider,
  });

  final WatchProvider watchProvider;

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    // final textStyleInformation =
    //     Theme.of(context).textTheme.bodyLarge?.copyWith(
    //           color: colors.secondary,
    //         );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              watchProvider.logoPath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Title WatchProvider
        // Text(
        //   watchProvider.providerName,
        //   style: textStyleInformation,
        // ),
      ],
    );
  }
}
