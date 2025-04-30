import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:futurex/Authentication/chatgpt_chatbot.dart';
import 'package:futurex/common_widget/common_widget.dart';
import 'package:futurex/features/pages/AI_page/ai_page_bloc/aipage_bloc.dart';
import 'package:futurex/utils/color_collections.dart';

class AIPage extends StatefulWidget {
  const AIPage({super.key});

  @override
  State<AIPage> createState() => _AIPageState();
}

class _AIPageState extends State<AIPage> {
  final TextEditingController _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // context.read<AipageBloc>().add(SendInitialMessage());
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<AipageBloc>().add(SendMessage(text));
      _controller.clear();
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: themeData.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorCollections.QuaterneryColor,
              ),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  Icon(
                    Icons.memory,
                    color: ColorCollections.PrimaryColor,
                    size: 40,
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        TextColor: ColorCollections.PrimaryColor,
                        TextString: "AI Assistance",
                        FontSize: 20,
                        TextFontWeight: FontWeight.w900,
                        FromBottom: 0,
                      ),
                      ReusableText(
                        TextColor: ColorCollections.PrimaryColor,
                        TextString: "Always here to help",
                        FontSize: 16,
                        FromBottom: 0,
                        FromTop: 0,
                        TextFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Chat Messages Area
            Expanded(
              child: BlocConsumer<AipageBloc, AipageState>(
                listener: (context, state) {
                  if (state is AipageError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        margin: const EdgeInsets.all(10),
                      ),
                    );
                  }
                  _scrollToBottom();
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          reverse: true,
                          itemCount: state.messages.length,
                          itemBuilder: (context, index) {
                            final message = state
                                .messages[state.messages.length - 1 - index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              child: BubbleNormal(
                                text: message.text,
                                isSender: message.isUser,
                                color: message.isUser
                                    ? ColorCollections.QuaterneryColor
                                    : themeData.onPrimaryContainer,
                                textStyle: TextStyle(
                                  color: message.isUser
                                      ? Colors.white
                                      : themeData.primary,
                                  fontSize: 16,
                                ),
                                seen: true,
                                delivered: true,
                              ),
                            );
                          },
                        ),
                      ),
                      if (state.isLoading)
                        const LinearProgressIndicator(
                          minHeight: 2,
                          color: Colors.blue,
                        ),
                    ],
                  );
                },
              ),
            ),

            // Input Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: reusableChatBotTextField(
                      context: context,
                      controller: _controller,
                      hintText: "Type your message",
                      textType: "text",
                      onTap: () => _sendMessage(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
