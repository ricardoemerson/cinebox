import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/resources.dart';
import '../movie_view_model.dart';

class MoviesAppBar extends ConsumerStatefulWidget {
  const MoviesAppBar({super.key});

  @override
  ConsumerState<MoviesAppBar> createState() => _MoviesAppBarState();
}

class _MoviesAppBarState extends ConsumerState<MoviesAppBar> {
  Timer? _debounce;
  final _searchEC = TextEditingController();

  @override
  void dispose() {
    _searchEC.dispose();
    _debounce?.cancel();

    super.dispose();
  }

  void onSearchChanged(String query) {
    log('query: ${query}');
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(movieViewModelProvider.notifier).fetchMoviesBySearch(query.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.30,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(28),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: TextFormField(
            onChanged: onSearchChanged,
            controller: _searchEC,
            style: TextStyle(
              color: Colors.grey[600],
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Procurar filme',
              hintStyle: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Icon(Icons.search, color: Colors.grey[600]),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(top: 200, left: 16, right: 16, bottom: 8),
        background: Image.asset(
          R.ASSETS_IMAGES_SMALL_BANNER_PNG,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
