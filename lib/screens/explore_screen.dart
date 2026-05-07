import 'package:flutter/material.dart';

const _kPrimary = Color(0xFF7B61FF);

const _kFilterChips = [
  'Official',
  'Featured',
  'Professional',
  'Popular',
  'AI',
  'Language',
];

class _BotEntry {
  final String name;
  final String desc;
  final List<Color> colors;
  final IconData icon;
  bool isFollowing;

  _BotEntry({
    required this.name,
    required this.desc,
    required this.colors,
    required this.icon,
    this.isFollowing = false,
  });
}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedFilter = 1; // 'Featured' selected by default

  final List<_BotEntry> _bots = [
    _BotEntry(
      name: 'Creative WritingsE',
      desc: 'Hello! I can provide assistance with your...',
      colors: [Color(0xFFE91E8C), Color(0xFF9C27B0)],
      icon: Icons.auto_awesome,
    ),
    _BotEntry(
      name: 'RealVisXL',
      desc: 'Generate photo-realistic pictures with Re...',
      colors: [Color(0xFF9C27B0), Color(0xFF3F51B5)],
      icon: Icons.remove_red_eye,
    ),
    _BotEntry(
      name: 'MrTeacherGPT',
      desc: 'I will help you learn anything you need h...',
      colors: [Color(0xFFFF5722), Color(0xFFFFD600)],
      icon: Icons.school,
    ),
    _BotEntry(
      name: 'Image Creators',
      desc: 'Describe the image you want to create.',
      colors: [Color(0xFF4CAF50), Color(0xFF00BCD4)],
      icon: Icons.image,
      isFollowing: true,
    ),
    _BotEntry(
      name: 'Photo CreateE',
      desc: 'This bot generates realistic, stock photo...',
      colors: [Color(0xFFFFD600), Color(0xFFFF9800)],
      icon: Icons.photo_camera,
      isFollowing: true,
    ),
    _BotEntry(
      name: 'PsychologicalExpert',
      desc: 'Expert in Psychology',
      colors: [Color(0xFF00BCD4), Color(0xFFE91E8C)],
      icon: Icons.psychology,
    ),
    _BotEntry(
      name: 'Doctorsage',
      desc: 'Dr. Sage answers uni med questions in a...',
      colors: [Color(0xFFFF9800), Color(0xFFFF5722)],
      icon: Icons.medical_services,
      isFollowing: true,
    ),
    _BotEntry(
      name: 'Mrstherapist',
      desc: 'Your very own therapist with relationship...',
      colors: [Color(0xFF00BCD4), Color(0xFFE91E8C)],
      icon: Icons.favorite,
      isFollowing: true,
    ),
  ];

  Widget _buildAvatar(_BotEntry bot, {double size = 50}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: bot.colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(bot.icon, color: Colors.white, size: size * 0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 44,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F3F8),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 12),
                    Icon(Icons.search, color: Colors.grey, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'Search for bots or people',
                      style: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Filter chips
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _kFilterChips.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final selected = index == _selectedFilter;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedFilter = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? _kPrimary : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected ? _kPrimary : Colors.black26,
                        ),
                      ),
                      child: Text(
                        _kFilterChips[index],
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.black87,
                          fontWeight: selected
                              ? FontWeight.w600
                              : FontWeight.normal,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            // Bot list
            Expanded(
              child: ListView.separated(
                itemCount: _bots.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, indent: 70, endIndent: 16),
                itemBuilder: (context, index) {
                  final bot = _bots[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 6),
                    leading: _buildAvatar(bot),
                    title: Text(
                      bot.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                    subtitle: Text(
                      bot.desc,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        setState(() => bot.isFollowing = !bot.isFollowing);
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: bot.isFollowing
                              ? Colors.transparent
                              : _kPrimary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: bot.isFollowing
                                ? _kPrimary.withAlpha(128)
                                : _kPrimary,
                          ),
                        ),
                        child: Icon(
                          bot.isFollowing ? Icons.check : Icons.add,
                          color: bot.isFollowing
                              ? _kPrimary.withAlpha(178)
                              : Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
