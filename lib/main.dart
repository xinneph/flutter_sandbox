import 'package:flutter/material.dart';
import 'package:sandbox_flutter/chat_message.dart';

main() => runApp(const FriendlyChatApp());

class FriendlyChatApp extends StatelessWidget {
  const FriendlyChatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FriendlyChat',
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _messages = <ChatMessage>[];
  final _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friendly chat'),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemBuilder: (_, int index) {
                return _messages[index];
              },
              itemCount: _messages.length,
              reverse: true,
              padding: const EdgeInsets.all(8),
            ),
          ),
          const Divider(height: 1),
          _buildTextComposer(context),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (final message in _messages) {
      message.animationController.dispose();
    }
    super.dispose();
  }

  Widget _buildTextComposer(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Send a message'),
              focusNode: _focusNode,
            ),
          ),
          IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                onPressed: () => _handleSubmitted(_textController.text),
                icon: const Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String string) {
    _textController.clear();
    final message = ChatMessage(
      text: string,
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 900),
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    _focusNode.requestFocus();
    message.animationController.forward();
  }
}
