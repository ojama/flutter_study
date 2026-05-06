import 'package:flutter/material.dart';
import 'chat_page_screen.dart';
import 'create_bot_screen.dart';

const _kBotList = [
  _BotData(
    name: 'StarryAI bot',
    desc: 'Psychologist that always listens to you',
    colors: [Color(0xFF4DD0E1), Color(0xFFFFB74D)],
    icon: Icons.face,
    badge: 'on',
  ),
  _BotData(
    name: 'Creative WritingsE',
    desc: 'Hello! I can provide assistance with your...',
    colors: [Color(0xFFE91E8C), Color(0xFF9C27B0)],
    icon: Icons.auto_awesome,
  ),
  _BotData(
    name: 'RealVisXL',
    desc: 'Generate photo-realistic pictures with Re...',
    colors: [Color(0xFF9C27B0), Color(0xFF3F51B5)],
    icon: Icons.remove_red_eye,
  ),
  _BotData(
    name: 'MrTeacherGPT',
    desc: 'I will help you learn anything you need h...',
    colors: [Color(0xFFFF5722), Color(0xFFFFD600)],
    icon: Icons.school,
  ),
  _BotData(
    name: 'Image Creators',
    desc: 'Describe the image you want to create.',
    colors: [Color(0xFF4CAF50), Color(0xFF00BCD4)],
    icon: Icons.image,
  ),
  _BotData(
    name: 'Photo CreateE',
    desc: 'This bot generates realistic, stock photo...',
    colors: [Color(0xFFFFD600), Color(0xFFFF9800)],
    icon: Icons.photo_camera,
  ),
  _BotData(
    name: 'PsychologicalExpert',
    desc: 'Expert in Psychology',
    colors: [Color(0xFF00BCD4), Color(0xFFE91E8C)],
    icon: Icons.psychology,
  ),
  _BotData(
    name: 'Doctorsage',
    desc: 'Dr. Sage answers uni med questions in a...',
    colors: [Color(0xFFFF9800), Color(0xFFFF5722)],
    icon: Icons.medical_services,
  ),
  _BotData(
    name: 'Mrstherapist',
    desc: 'Your very own therapist with relationship...',
    colors: [Color(0xFF00BCD4), Color(0xFFE91E8C)],
    icon: Icons.favorite,
  ),
];

class _BotData {
  final String name;
  final String desc;
  final List<Color> colors;
  final IconData icon;
  final String? badge;

  const _BotData({
    required this.name,
    required this.desc,
    required this.colors,
    required this.icon,
    this.badge,
  });
}

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  Widget _buildAvatar(_BotData bot, {double size = 50}) {
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'All chats',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, size: 20, color: Colors.black87),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            offset: const Offset(0, 45),
            onSelected: (value) {
              if (value == 'new_chat') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const ChatPageScreen()),
                );
              } else if (value == 'create_bot') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_) => const CreateBotScreen()),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'new_chat',
                child: Row(
                  children: [
                    Icon(Icons.add_comment_outlined, color: Colors.black87),
                    SizedBox(width: 12),
                    Text('New Chat'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'create_bot',
                child: Row(
                  children: [
                    Icon(Icons.edit_outlined, color: Colors.black87),
                    SizedBox(width: 12),
                    Text('Create Bot'),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.separated(
        itemCount: _kBotList.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, indent: 70, endIndent: 16),
        itemBuilder: (context, index) {
          final bot = _kBotList[index];
          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            leading: _buildAvatar(bot),
            title: Row(
              children: [
                Text(
                  bot.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 15),
                ),
                if (bot.badge != null) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7B61FF).withAlpha(26),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color(0xFF7B61FF), width: 1),
                    ),
                    child: const Text(
                      'on',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF7B61FF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ]
              ],
            ),
            subtitle: Text(
              bot.desc,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_) => const ChatPageScreen()),
              );
            },
          );
        },
      ),
    );
  }
}
