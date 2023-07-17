import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wikipelis/domain/entities/entities.dart';
import 'package:wikipelis/generated/l10n.dart';
import 'package:wikipelis/presentation/providers/person/movies_person_id_provider.dart';
import 'package:wikipelis/presentation/providers/person/person_info_provider.dart';
import 'package:wikipelis/presentation/widgets/widgets.dart';

class PersonInfoScreen extends ConsumerWidget {
  static const route = 'person_info_screen';
  final String personId;
  const PersonInfoScreen({super.key, required this.personId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(personInfoProvider(personId));

    return Scaffold(
      body: person.when(
        data: (person) {
          return SingleChildScrollView(
            child: _ProfileImage(person: person),
          );
        },
        error: (error, stackTrace) => Text('error $error'),
        loading: () => const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  final Person person;
  const _ProfileImage({required this.person});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Back
          SizedBox(
            height: size.height * 0.5,
            width: double.infinity,
            child: Stack(
              children: [
                person.profilePath.contains('https')
                    ? FadeIn(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            person.profilePath,
                            height: size.height * 0.5,
                            width: size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    // no image control
                    : FadeIn(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            person.profilePath,
                            height: size.height * 0.5,
                            width: size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                const CustomBackgroundGradient(
                  colors: [Colors.black54, Colors.transparent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1, 0.5],
                ),
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          //Image web

          _BodyinfoPerson(person: person),
        ],
      ),
    );
  }
}

class _BodyinfoPerson extends StatelessWidget {
  const _BodyinfoPerson({
    required this.person,
  });

  final Person person;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyleTitle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: colors.onBackground,
        );
    final textStyleInformation =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: colors.secondary,
            );
    final Size size = MediaQuery.of(context).size;
    int yearsOld = 0;
    if (person.birthday != '') {
      if (person.deathday == '') {
        yearsOld = int.parse(DateTime.now().toString().substring(0, 4)) -
            int.parse(person.birthday.substring(0, 4));
      } else {
        yearsOld = int.parse(
              person.deathday.substring(0, 4),
            ) -
            int.parse(person.birthday.substring(0, 4));
      }
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(person.name, style: textStyleTitle),
            if (yearsOld != 0)
              Text(
                yearsOld.toString() + S.of(context).anios,
                style: textStyleInformation,
              ),
            const SizedBox(
              height: 10,
            ),
            Text('Bio', style: textStyleTitle),
            const SizedBox(
              height: 10,
            ),
            Text(
              person.biography,
              style: textStyleInformation,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 10,
            ),
            // Información
            Text(S.of(context).informacion, style: textStyleTitle),
            const SizedBox(
              height: 10,
            ),
            // Profesion
            Text(
              S.of(context).profesion + person.knownForDepartment,
              style: textStyleInformation,
            ),
            const SizedBox(
              height: 10,
            ),
            // Cumpleanios
            Text(
              S.of(context).cumpleanos + person.birthday,
              style: textStyleInformation,
            ),
            const SizedBox(
              height: 10,
            ),
            //Nacimiento

            Text(
              S.of(context).lugarDeNacimiento + person.placeOfBirth,
              style: textStyleInformation,
            ),
            const SizedBox(
              height: 10,
            ),
            // Muerte
            if (person.deathday != '')
              Text(
                S.of(context).muerte + person.deathday,
                style: textStyleInformation,
              ),
            _MoviesByPersonId(personId: person.id),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class _MoviesByPersonId extends ConsumerWidget {
  final String personId;
  const _MoviesByPersonId({required this.personId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesPersonIdProvider(personId));
    return movies.when(
      data: (movies) => MovieHorizontalListView(
        movies: movies,
        title: S.of(context).filmografia,
        marginHorizontal: false,
      ),
      error: (error, stackTrace) => Center(child: Text('Error: $error')),
      loading: () => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
