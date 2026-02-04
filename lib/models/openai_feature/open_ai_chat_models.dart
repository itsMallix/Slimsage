import 'dart:convert';

// Model untuk Chat Completion (GPT-3.5-turbo / GPT-4)
GPTChatData gptChatDataFromJson(String str) => GPTChatData.fromJson(json.decode(str));

String gptChatDataToJson(GPTChatData data) => json.encode(data.toJson());

class GPTChatData {
  String id;
  String object;
  int created;
  String model;
  List<ChatChoice> choices;
  ChatUsageData usage;

  GPTChatData({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  factory GPTChatData.fromJson(Map<String, dynamic> json) => GPTChatData(
        id: json["id"] ?? "",
        object: json["object"] ?? "",
        created: json["created"] ?? 0,
        model: json["model"] ?? "",
        choices: json["choices"] != null
            ? List<ChatChoice>.from(
                json["choices"].map((x) => ChatChoice.fromJson(x)))
            : [],
        usage: json["usage"] != null
            ? ChatUsageData.fromJson(json["usage"])
            : ChatUsageData(
                promptTokens: 0,
                completionTokens: 0,
                totalTokens: 0,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "object": object,
        "created": created,
        "model": model,
        "choices": List<dynamic>.from(choices.map((x) => x.toJson())),
        "usage": usage.toJson(),
      };
}

class ChatChoice {
  int index;
  ChatMessage message;
  String? finishReason;

  ChatChoice({
    required this.index,
    required this.message,
    this.finishReason,
  });

  factory ChatChoice.fromJson(Map<String, dynamic> json) => ChatChoice(
        index: json["index"] ?? 0,
        message: ChatMessage.fromJson(json["message"] ?? {}),
        finishReason: json["finish_reason"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "message": message.toJson(),
        "finish_reason": finishReason,
      };
}

class ChatMessage {
  String role;
  String content;

  ChatMessage({
    required this.role,
    required this.content,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
        role: json["role"] ?? "",
        content: json["content"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "role": role,
        "content": content,
      };
}

class ChatUsageData {
  int promptTokens;
  int completionTokens;
  int totalTokens;

  ChatUsageData({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  factory ChatUsageData.fromJson(Map<String, dynamic> json) => ChatUsageData(
        promptTokens: json["prompt_tokens"] ?? 0,
        completionTokens: json["completion_tokens"] ?? 0,
        totalTokens: json["total_tokens"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "prompt_tokens": promptTokens,
        "completion_tokens": completionTokens,
        "total_tokens": totalTokens,
      };
}
