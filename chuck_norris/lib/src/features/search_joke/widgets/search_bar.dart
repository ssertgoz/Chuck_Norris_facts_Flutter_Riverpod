import 'dart:async';
import 'package:chuck_norris/src/constants/colors.dart';
import 'package:chuck_norris/src/constants/font_styles.dart';
import 'package:chuck_norris/src/constants/paddings.dart';
import 'package:chuck_norris/src/features/search_joke/app/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBarUI extends ConsumerStatefulWidget {
  const SearchBarUI({super.key});

  @override
  ConsumerState<SearchBarUI> createState() => _SearchBarUIState();
}

class _SearchBarUIState extends ConsumerState<SearchBarUI> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  onSearchChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchJokeControllerProvider.notifier).searchJoke(text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: CustomPaddings.smallPaddingAll,
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: CustomColors.themColor,
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                style: CustomFontStyles.kalamNormal,
                onChanged: (value) {
                  onSearchChanged(value);
                },
                onSubmitted: (value) {
                  onSearchChanged(value);
                },
                cursorColor: CustomColors.themColor,
                decoration: const InputDecoration(
                    hintText: 'Searc jokes', border: InputBorder.none),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
