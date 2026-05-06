import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Message',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black87,
          ),
        ),
      ),
      body: ListView(
        children: [
          // Banner card
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFFFD86B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Join the Creator\nMonetization program',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Get paid when users engage with your bots.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Decorative icon
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFF7043),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.fitness_center,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Space traveler notification (with Share button)
          _NotificationTile(
            avatar: _buildSpaceAvatar(size: 50),
            title: 'Space traveler',
            subtitle: '🎉 The bot you created is approved.',
            trailing: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B61FF),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                elevation: 0,
              ),
              child: const Text('Share', style: TextStyle(fontSize: 14)),
            ),
            hasUnread: false,
          ),
          const Divider(height: 1),
          // System notification 1
          _NotificationTile(
            avatar: _buildStarryAvatar(size: 50),
            title: 'The user information was changed.',
            subtitle: 'System notifications',
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            hasUnread: true,
          ),
          const Divider(height: 1),
          // System notification 2
          _NotificationTile(
            avatar: _buildStarryAvatar(size: 50),
            title: 'Can you give me a score?',
            subtitle: 'System notifications',
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            hasUnread: true,
          ),
          const Divider(height: 1),
          // User messages
          ..._buildUserMessages(),
        ],
      ),
    );
  }

  List<Widget> _buildUserMessages() {
    const users = [
      ('MiaBlaze', 'Added your bot : Space traveler'),
      ('JackWhisper', 'Added your bot : Space traveler'),
      ('RubyWave', 'Added your bot : Space traveler'),
      ('ZoeDrift', 'Added your bot : Space traveler'),
    ];

    return users.map((u) {
      return Column(
        children: [
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            leading: _buildPersonAvatar(u.$1),
            title: Text(
              u.$1,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 15),
            ),
            subtitle: Text(
              u.$2,
              style: const TextStyle(color: Colors.grey, fontSize: 13),
            ),
            trailing: _buildSpaceAvatar(size: 44),
          ),
          const Divider(height: 1),
        ],
      );
    }).toList();
  }

  static Widget _buildSpaceAvatar({required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7B61FF), Color(0xFF9C27B0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.rocket_launch, color: Colors.white, size: size * 0.45),
    );
  }

  static Widget _buildStarryAvatar({required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF4DD0E1), Color(0xFFFFB74D)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(Icons.face, color: Colors.white, size: size * 0.5),
    );
  }

  static Widget _buildPersonAvatar(String name) {
    const colors = [
      [Color(0xFF9C27B0), Color(0xFF7B61FF)],
      [Color(0xFF4CAF50), Color(0xFF00BCD4)],
      [Color(0xFFFF9800), Color(0xFFFF5722)],
      [Color(0xFFE91E8C), Color(0xFF9C27B0)],
    ];
    final idx = name.length % colors.length;
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors[idx],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.substring(0, 1),
          style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final Widget avatar;
  final String title;
  final String subtitle;
  final Widget trailing;
  final bool hasUnread;

  const _NotificationTile({
    required this.avatar,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.hasUnread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          avatar,
          if (hasUnread)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight:
              hasUnread ? FontWeight.bold : FontWeight.w600,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: Colors.grey, fontSize: 13),
      ),
      trailing: trailing,
    );
  }
}
