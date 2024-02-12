import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatbotIntegration extends StatefulWidget {
  const ChatbotIntegration({Key? key}) : super(key: key);

  @override
  State<ChatbotIntegration> createState() => _ChatbotIntegrationState();
}

class _ChatbotIntegrationState extends State<ChatbotIntegration> {
  ChatUser myself = ChatUser(id: '1', firstName: 'User');
  ChatUser bot = ChatUser(id: '2', firstName: 'Friday');
  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];
  final TextEditingController _promptController = TextEditingController();
  final TextEditingController _responseController = TextEditingController();

  final CollectionReference<Map<String, dynamic>> _firestoreCollection =
  FirebaseFirestore.instance.collection('Users').doc('test@gmail.com').collection('messages');

  StreamSubscription<QuerySnapshot<Map<String, dynamic>>>? _snapshotSubscription;
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();

    _snapshotSubscription = _firestoreCollection
        .orderBy('startTime', descending: true)
        .limit(1)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final data = snapshot.docs.first.data();
        if (data['response'] != null && data['response'].isNotEmpty) {
          _responseController.text = data['response'];

          if (!isFirstTime) {
            // Add the Firestore response to DashChat only if it's not the first time
            ChatMessage firestoreResponse = ChatMessage(
              text: data['response'],
              user: bot,
              createdAt: DateTime.now(),
            );
            allMessages.insert(0, firestoreResponse);

            setState(() {});
          }

          isFirstTime = false;
        }
      }
    });
  }

  @override
  void dispose() {
    _snapshotSubscription?.cancel();
    _promptController.dispose();
    _responseController.dispose();
    super.dispose();
  }

  void sendMessageToFirestore(String prompt) async {
    try {
      await _firestoreCollection.add({
        'prompt': prompt,
        'response': '', // Add an empty response for the new prompt
        'startTime': FieldValue.serverTimestamp(),
      });

      _promptController.clear();
      typing.remove(bot);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Friday')),
      body: Column(
        children: [
          Expanded(
            child: DashChat(
              typingUsers: typing,
              currentUser: myself,
              onSend: (ChatMessage m) {
                typing.add(bot);
                // Send user message to Firestore
                sendMessageToFirestore(m.text);
                // Add user message to DashChat
                allMessages.insert(0, m);

                setState(() {});
              },
              messages: allMessages,
            ),
          ),
        ],
      ),
    );
  }
}
