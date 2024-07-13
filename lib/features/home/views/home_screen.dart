import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/home/view_models/fetch_mood_view_model.dart';
import 'package:mood_tracker/features/home/views/widgets/home_sliver_app_bar.dart';
import 'package:mood_tracker/features/home/views/widgets/mood_card.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';

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

  void _onDeletePress(String id) {
    final isDark = ref.watch(themeConfigProvider).darkMode;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(
            isDark ? ThemeColors.outerSpace : ThemeColors.babypowder,
          ),
          elevation: 0,
          title: const Center(
            child: Text(
              "Delete Mood",
            ),
          ),
          content: const Text(
            "Are you sure you want to delete this mood?",
          ),
          actionsPadding: const EdgeInsets.only(
            bottom: 6,
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(
                  color: isDark
                      ? const Color(ThemeColors.dimGray)
                      : const Color(
                          ThemeColors.platinum,
                        ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    ref.read(fetchMoodProvider.notifier).deleteMood(id);
                    context.pop();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(
                              ThemeColors.imperialRed,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: isDark
                      ? const Color(ThemeColors.dimGray)
                      : const Color(
                          ThemeColors.platinum,
                        ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
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
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Gap(80),
                                Text(
                                  "It's empty :(",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontFamily: "McKloudFilled",
                                    color: Color(ThemeColors.babypowder),
                                    shadows: [
                                      Shadow(
                                        color: Color(ThemeColors.lavenderPink),
                                        blurRadius: 10,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                ),
                                Gap(4),
                                Text(
                                  "Record your mood!",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(ThemeColors.lavenderPink),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SliverList.separated(
                            itemCount: moods.length,
                            itemBuilder: (context, index) {
                              var mood = moods[index];
                              return GestureDetector(
                                  onLongPress: () => _onDeletePress(mood.id),
                                  child: MoodCard(mood: mood));
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
