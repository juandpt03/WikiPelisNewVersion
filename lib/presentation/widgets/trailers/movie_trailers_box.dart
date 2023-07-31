import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/generated/l10n.dart';
import 'package:wikipelis/presentation/providers/providers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailersBox extends ConsumerWidget {
  final String movieId;
  const MovieTrailersBox({
    super.key,
    required this.movieId,
  });

  @override
  Widget build(BuildContext context, ref) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: colors.secondary,
        );
    return FutureBuilder(
      future: ref.watch(movieTrailersProvider.notifier).loadTrailers(movieId),
      builder: (context, AsyncSnapshot<List<MovieTrailers>> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            height: size.height * 0.33,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        }
        if (snapshot.data!.isEmpty) {
          return SizedBox(
            height: size.height * 0.2,
            child: Center(
              child: Text(
                S.of(context).noSeEncontroNingunTrailer,
                style: textStyle,
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return SizedBox(
            height: size.height * 0.2,
            child: Center(
              child: Text(
                S.of(context).errorNoSeLogroCargarLosVideos,
                style: textStyle,
              ),
            ),
          );
        }

        return ListView.builder(
          physics: const ClampingScrollPhysics(),
          // shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return VideoPlayer(
              videoId: snapshot.data![index].key,
              name: snapshot.data![index].name,
            );
          },
          itemCount: snapshot.data!.length,
        );
      },
    );
  }
}

class VideoPlayer extends StatefulWidget {
  final String videoId;
  final String name;
  const VideoPlayer({super.key, required this.videoId, required this.name});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        hideThumbnail: true,
        showLiveFullscreenButton: false,
        mute: false,
        autoPlay: false,
        disableDragSeek: true,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: false,
      ),
    );
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
        color: colors.onInverseSurface,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                widget.name,
                style: textStyle.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: colors.onBackground,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: YoutubePlayer(
                controller: _controller,
                bottomActions: [
                  RemainingDuration(),
                  ProgressBar(
                    isExpanded: true,
                  ),
                  RemainingDuration(),
                  const PlaybackSpeedButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
