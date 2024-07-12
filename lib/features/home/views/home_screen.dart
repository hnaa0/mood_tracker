import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mood_tracker/features/home/view_models/fetch_mood_view_model.dart';
import 'package:mood_tracker/features/home/views/widgets/home_sliver_app_bar.dart';
import 'package:mood_tracker/features/home/views/widgets/mood_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchMoodProvider).when(
          data: (moods) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                ),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    HomeSliverAppBar(scrollTop: _scrollToTop),
                    const SliverGap(20),
                    moods.isEmpty
                        ? const SliverToBoxAdapter(
                            child: Center(
                              child: Column(
                                children: [
                                  Text("It's empty:("),
                                  Text("Record your mood!"),
                                ],
                              ),
                            ),
                          )
                        : SliverList.separated(
                            itemCount: moods.length,
                            itemBuilder: (context, index) {
                              var mood = moods[index];
                              return MoodCard(mood: mood);
                            },
                            separatorBuilder: (context, index) => const Gap(20),
                          ),
                    const SliverGap(52),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text("$error"),
          ),
          loading: () => const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        );
  }
}
