import 'package:flutter/material.dart';
import 'package:flutter_particles/particles.dart';

class ParticlesBackground extends StatelessWidget {
  ParticlesBackground({@required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Particles(20, color.withOpacity(0.4));
  }
}
