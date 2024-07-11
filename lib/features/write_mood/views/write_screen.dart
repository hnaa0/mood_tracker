import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:mood_tracker/common/mood_type.dart';
import 'package:mood_tracker/constants/colors.dart';
import 'package:mood_tracker/features/settings/view_models/theme_config_view_model.dart';
import 'package:mood_tracker/features/write_mood/view_models/upload_mood_view_model.dart';
import 'package:mood_tracker/features/write_mood/views/widgets/mood.dart';
import 'package:mood_tracker/features/write_mood/views/widgets/write_text_field.dart';

enum FieldType {
  title,
  content,
}

class WriteScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/write";
  static const routeName = "write";

  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  final Map<String, String> _formData = {};
  int _selectedMoodIdx = 0;

  void onMoodTap({required String mood, required int index}) {
    setState(() {
      _selectedMoodIdx = index;
      _formData["mood"] = mood;
    });
  }

  void _onPostTap() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ref
          .read(uploadMoodProvider.notifier)
          .uploadMood(
            form: _formData,
            context: context,
          )
          .then((value) {
        _contentController.clear();
        _titleController.clear();
        _selectedMoodIdx = 0;
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeConfigProvider).darkMode;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(20),
              const Padding(
                padding: EdgeInsets.only(
                  left: 4,
                ),
                child: Text(
                  "MOOD",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(
                      ThemeColors.lavenderPink,
                    ),
                  ),
                ),
              ),
              const Gap(8),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 28,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(28),
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: MoodType.values.length,
                  itemBuilder: (context, index) {
                    var mood = MoodType.values[index];
                    return GestureDetector(
                      onTap: () {
                        onMoodTap(mood: mood.name, index: index);
                      },
                      child: MoodBox(
                        mood: mood,
                        selectedIdx: _selectedMoodIdx,
                        index: index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(6),
                ),
              ),
              const Gap(14),
              Divider(
                color: isDark
                    ? const Color(ThemeColors.dimGray)
                    : const Color(
                        ThemeColors.platinum,
                      ),
              ),
              const Gap(14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      WriteTextField(
                        controller: _titleController,
                        fieldName: FieldType.title.name,
                        isDark: isDark,
                        formData: _formData,
                      ),
                      const Gap(20),
                      SingleChildScrollView(
                        child: WriteTextField(
                          controller: _contentController,
                          fieldName: FieldType.content.name,
                          isDark: isDark,
                          formData: _formData,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(28),
              GestureDetector(
                onTap: _onPostTap,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
                  decoration: BoxDecoration(
                    color: Color(
                      ref.watch(uploadMoodProvider).isLoading
                          ? ThemeColors.cadetgray
                          : ThemeColors.lavender,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(28),
                    ),
                  ),
                  child: const Text(
                    "Post",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
