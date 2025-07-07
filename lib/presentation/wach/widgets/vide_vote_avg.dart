import 'package:flutter/material.dart';

class VideVoteAvg extends StatelessWidget {
  final double voteAvg;

  const VideVoteAvg({super.key, required this.voteAvg});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        Text(
          ' ${voteAvg.toStringAsFixed(1)}',
        ),
      ],
    );
  }
}
