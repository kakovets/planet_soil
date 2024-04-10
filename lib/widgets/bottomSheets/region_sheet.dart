import 'package:flutter/material.dart';
import 'package:planet_soil/models/region_model.dart';
import 'package:planet_soil/widgets/image_search.dart';

class RegionSheet extends StatelessWidget {
  const RegionSheet({super.key, required this.region,});

  final RegionModel region;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle.merge(
      style: TextStyle(
        color: Theme.of(context).colorScheme.outline,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .6,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: [
              Center(
                child: Text(
                  region.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Latitude: ${region.latitude} \u00B0'),
                        const SizedBox(height: 12,),
                        Text('Longitude: ${region.longitude} \u00B0'),
                        const SizedBox(height: 12,),
                        Text('Spanish name: ${region.nameSpanish}'),
                        const SizedBox(height: 12,),
                        Text('French name: ${region.nameFrench}'),
                        const SizedBox(height: 12,),
                        Center(child: ImageSearch(query: region.name)),

                        const Divider(
                          height: 64,
                          thickness: 1,
                          color: Colors.grey,
                        ),

                        // just for scrollability
                        const Text(
                          'In quantum mechanics, Schrödinger\'s cat '
                              'is a thought experiment, sometimes described as a '
                              'paradox, of quantum superposition. In the thought '
                              'experiment, a hypothetical cat may be considered '
                              'simultaneously both alive and dead, while it is '
                              'unobserved in a closed box, as a result of its fate '
                              'being linked to a random subatomic event that may '
                              'or may not occur. This thought experiment was '
                              'devised by physicist Erwin Schrödinger in 1935[1] '
                              'in a discussion with Albert Einstein[2] to '
                              'illustrate what Schrödinger saw as the problems '
                              'of the Copenhagen interpretation of quantum '
                              'mechanics.\nIn Schrödinger\'s original formulation, '
                              'a cat, a flask of poison, and a radioactive source '
                              'are placed in a sealed box. If an internal radiation'
                              ' monitor (e.g. a Geiger counter) detects '
                              'radioactivity (i.e. a single atom decaying), '
                              'the flask is shattered, releasing the poison, which '
                              'kills the cat. The Copenhagen interpretation implies'
                              ' that, after a while, the cat is simultaneously alive'
                              ' and dead. Yet, when one looks in the box, one sees'
                              ' the cat either alive or dead, not both alive and'
                              ' dead. This poses the question of when exactly'
                              ' quantum superposition ends and reality resolves'
                              ' into one possibility or the other.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}