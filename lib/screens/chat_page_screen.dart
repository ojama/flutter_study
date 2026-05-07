import 'package:flutter/material.dart';

const _kPrimary = Color(0xFF7B61FF);

const _kPopularBots = [
  _PopularBot(
    name: 'RealVisXL',
    desc: 'Generate photo-realistic pictures with RealVisXL 4.0',
    colors: [Color(0xFF9C27B0), Color(0xFF3F51B5)],
    icon: Icons.remove_red_eye,
  ),
  _PopularBot(
    name: 'Image Creators',
    desc: 'Describe the image you want to create.',
    colors: [Color(0xFF4CAF50), Color(0xFF00BCD4)],
    icon: Icons.image,
  ),
  _PopularBot(
    name: 'Romance',
    desc: 'Talks to you about relationship to make you u...',
    colors: [Color(0xFF3F51B5), Color(0xFF00BCD4)],
    icon: Icons.favorite,
  ),
];

const _kSuggestions = [
  'Goodnight stories',
  'Weight loss schedule',
  'Business plan',
  'Summary of this month\'s work',
  'Healthy Eating Pairing',
];

class _PopularBot {
  final String name;
  final String desc;
  final List<Color> colors;
  final IconData icon;

  const _PopularBot({
    required this.name,
    required this.desc,
    required this.colors,
    required this.icon,
  });
}

class ChatPageScreen extends StatelessWidget {
  const ChatPageScreen({super.key});

  Widget _buildBotAvatar(List<Color> colors, IconData icon, {double size = 50}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.5),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEFF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 20),
          onPressed: () => Navigator.of(context).pop(),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4DD0E1), Color(0xFFFFB74D)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.face, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 10),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'StarryAI bot',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '@Official',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.call_outlined, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.volume_up_outlined, color: Colors.black54),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black54),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  // Large bot avatar
                  Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF4DD0E1), Color(0xFFFFB74D)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.face,
                      color: Colors.white,
                      size: 80,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Suggestion chips
                  SizedBox(
                    height: 36,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: _kSuggestions
                          .map((s) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: _SuggestionChip(label: s),
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Popular bots section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Popular bots',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.black87,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'See all',
                            style: TextStyle(color: _kPrimary, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: _kPopularBots.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final bot = _kPopularBots[index];
                        return _PopularBotCard(
                          bot: bot,
                          buildAvatar: _buildBotAvatar,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          // Message input bar
          Container(
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F3F8),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text(
                        'Send message...',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.mic_none,
                        color: Colors.black54, size: 22),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F3F8),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.add,
                        color: Colors.black54, size: 22),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  final String label;

  const _SuggestionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12),
      ),
      child: Text(
        label,
        style:
            const TextStyle(fontSize: 13, color: Colors.black87),
      ),
    );
  }
}

class _PopularBotCard extends StatelessWidget {
  final _PopularBot bot;
  final Widget Function(List<Color> colors, IconData icon, {double size})
      buildAvatar;

  const _PopularBotCard({
    required this.bot,
    required this.buildAvatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAvatar(bot.colors, bot.icon, size: 48),
          const SizedBox(height: 8),
          Text(
            bot.name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            bot.desc,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
