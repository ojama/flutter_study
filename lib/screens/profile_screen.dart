import 'package:flutter/material.dart';

const _kPrimary = Color(0xFF7B61FF);

const _kMyBots = [
  _MyBot(
    name: 'Creative WritingsE',
    desc: 'Hello! I can provide assistance with your writing needs.',
    colors: [Color(0xFFE91E8C), Color(0xFF9C27B0)],
    icon: Icons.auto_awesome,
  ),
  _MyBot(
    name: 'Doctorsage',
    desc:
        'Dr. Sage answers uni med questions in a structured way - fi...',
    colors: [Color(0xFFFF9800), Color(0xFFFF5722)],
    icon: Icons.medical_services,
  ),
  _MyBot(
    name: 'Photo CreateE',
    desc:
        'This bot generates realistic, stock photos, style-photos or animal ph...',
    colors: [Color(0xFFFFD600), Color(0xFFFF9800)],
    icon: Icons.photo_camera,
  ),
];

class _MyBot {
  final String name;
  final String desc;
  final List<Color> colors;
  final IconData icon;

  const _MyBot({
    required this.name,
    required this.desc,
    required this.colors,
    required this.icon,
  });
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget _buildBotAvatar(_MyBot bot, {double size = 56}) {
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
      backgroundColor: const Color(0xFFF2F3F8),
      body: SafeArea(
        child: Column(
          children: [
            // Settings icon
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16, top: 8),
                child: IconButton(
                  icon: const Icon(Icons.settings_outlined,
                      color: Colors.black54, size: 26),
                  onPressed: () {},
                ),
              ),
            ),
            // User info card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // User avatar
                    Container(
                      width: 72,
                      height: 72,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF4CAF50),
                            Color(0xFF9C27B0),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.face_retouching_natural,
                        color: Colors.white,
                        size: 44,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Name and ID
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'StarrySia',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'ID 845289347',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Edit button
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: _kPrimary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // My bots section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                        child: Text(
                          'My bots',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemCount: _kMyBots.length,
                          separatorBuilder: (_, __) => const Divider(
                              height: 1, indent: 72, endIndent: 0),
                          itemBuilder: (context, index) {
                            final bot = _kMyBots[index];
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              leading: _buildBotAvatar(bot),
                              title: Text(
                                bot.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                              subtitle: Text(
                                bot.desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 13),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
