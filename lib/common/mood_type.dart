enum MoodType {
  happy,
  calm,
  worried,
  excited,
  sad,
  scared,
  angry,
  infatuated,
  disppointed,
  frustrated;

  int get color => switch (this) {
        MoodType.happy => 0xffFF962D,
        MoodType.calm => 0xffA6C753,
        MoodType.worried => 0xff4BA98E,
        MoodType.excited => 0xff36A4FF,
        MoodType.sad => 0xff85CCDC,
        MoodType.scared => 0xff6E9ED6,
        MoodType.angry => 0xffFE8190,
        MoodType.infatuated => 0xffF481C5,
        MoodType.disppointed => 0xff8A84E2,
        MoodType.frustrated => 0xff8A6F64,
      };
}

extension MoodTypeExtension on MoodType {
  static MoodType fromString(String mood) {
    switch (mood) {
      case 'happy':
        return MoodType.happy;
      case 'calm':
        return MoodType.calm;
      case 'worried':
        return MoodType.worried;
      case 'excited':
        return MoodType.excited;
      case 'sad':
        return MoodType.sad;
      case 'scared':
        return MoodType.scared;
      case 'angry':
        return MoodType.angry;
      case 'infatuated':
        return MoodType.infatuated;
      case 'disppointed':
        return MoodType.disppointed;
      case 'frustrated':
        return MoodType.frustrated;
      default:
        throw Exception('Invalid mood type');
    }
  }
}
