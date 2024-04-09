import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;

  const MySliverAppBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text(
        'Task Trail',
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        expandedTitleScale: 1.0,
      ),
    );
  }
}
