enum MoodType {
  happy,
  calm,
  worried,
  sad,
  angry,
  infatuated,
  scared,
  disppointed,
  frustrated;

  int get color => switch (this) {
        MoodType.happy => 0xffFF962D,
        MoodType.calm => 0xffA6C753,
        MoodType.worried => 0xff4BA98E,
        MoodType.sad => 0xff7FE3F9,
        MoodType.angry => 0xffFE8190,
        MoodType.infatuated => 0xffF481C5,
        MoodType.scared => 0xff6E9ED6,
        MoodType.disppointed => 0xff8A84E2,
        MoodType.frustrated => 0xff8A6F64,
      };
}
