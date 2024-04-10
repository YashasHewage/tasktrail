import 'package:flutter/cupertino.dart';
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
          icon: const Icon(Icons.search, color: Colors.black),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black),
          onPressed: () {},
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      // backgroundColor: Colors.white,
      // foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      foregroundColor: Color.fromARGB(255, 48, 48, 48),
      title: const Text(
        'Task Trail',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "Recently Published",
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        // centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
        expandedTitleScale: 1.0,
      ),
    );
  }
}
