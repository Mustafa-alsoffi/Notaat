class University {
  String? country;
  String? name;
  List<String>? domains;
  String? alphaTwoCode;
  String? stateProvince;
  List<String>? webPages;

  University(
      {this.country,
      this.name,
      this.domains,
      this.alphaTwoCode,
      this.stateProvince,
      this.webPages});

  University.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    name = json['name'];
    domains = json['domains'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    stateProvince = json['state-province'];
    webPages = json['web_pages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['name'] = this.name;
    data['domains'] = this.domains;
    data['alpha_two_code'] = this.alphaTwoCode;
    data['state-province'] = this.stateProvince;
    data['web_pages'] = this.webPages;
    return data;
  }
}