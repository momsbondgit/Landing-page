class WaitlistForm {
  final String fullName;
  final String email;
  final String momStage;
  final String interests;

  WaitlistForm({
    required this.fullName,
    required this.email,
    required this.momStage,
    required this.interests,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'momStage': momStage,
      'interests': interests,
    };
  }
} 