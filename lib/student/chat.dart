import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final List<ChatMessage> messages = [
    ChatMessage(
        name: 'John',
        message: 'Hello!',
        imageUrl:
            'https://images.unsplash.com/photo-1541515929569-1771522cbaa9?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    ChatMessage(
        name: 'Jane',
        message: 'Hi there!',
        imageUrl:
            'https://images.unsplash.com/photo-1544252890-aaa73d400c5d?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
    // Add more chat messages as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Chat'),
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return ChatItem(message: messages[index]);
        },
      ),
    );
  }
}

class ChatMessage {
  final String name;
  final String message;
  final String imageUrl;

  ChatMessage(
      {required this.name, required this.message, required this.imageUrl});
}

class ChatItem extends StatelessWidget {
  final ChatMessage message;

  const ChatItem({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(message.imageUrl),
      ),
      title: Text(message.name),
      subtitle: Text(message.message),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatScreen(),
  ));
}
