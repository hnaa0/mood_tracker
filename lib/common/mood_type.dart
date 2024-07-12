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
