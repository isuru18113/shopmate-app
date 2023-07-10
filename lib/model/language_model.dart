class Language {
  final int languageId;
  final String languageCode;
  final String name;
  final String countryFlag;

  Language(this.languageId, this.languageCode, this.name, this.countryFlag);



  static List<Language> languageList() {
    return <Language>[
      Language(1,'en','English','🇬🇧'),
      Language(2,'et','Estonian','🇪🇪'),
      Language(3,'lv','Latvian','🇱🇻'),
      Language(4,'lt','Lithuanian','🇱🇹'),


    ];
  }
}