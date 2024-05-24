class UserDetailModel {
  bool? status;
  String? message;
  UserDetailData? data;

  UserDetailModel({this.status, this.message, this.data});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new UserDetailData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserDetailData {
  String? name;
  String? email;
  String? age;
  String? dob;
  String? gender;
  String? aboutYou;
  String? familyMembers;
  String? fatherName;
  String? fatherOccupation;
  String? motherName;
  String? motherOccupation;
  String? marriedSisters;
  String? unmarriedSisters;
  String? marriedBrothers;
  String? unmarriedBrothers;
  String? nativeLocation;
  String? religion;
  String? motherTongue;
  String? caste;
  String? subCaste;
  String? height;
  String? weight;
  String? maritialStatus;
  String? anyDisability;
  String? familyType;
  String? zodiac;
  String? star;
  String? havingDosham;
  String? education;
  String? employeedIn;
  String? companyName;
  String? occupation;
  String? annualIncome;
  String? workLocation;
  String? expHeight;
  String? expWeight;
  String? expMaritialStatus;
  String? expEducation;
  String? expOccupation;
  String? expSalary;
  Null? expLocation;
  String? profileImage1;
  String? profileImage2;
  String? profileImage3;
  String? profileImage4;
  String? profileImage5;
  String? phone;
  String? vvmId;
  String? createdAt;

  UserDetailData(
      {this.name,
        this.email,
        this.age,
        this.dob,
        this.gender,
        this.aboutYou,
        this.familyMembers,
        this.fatherName,
        this.fatherOccupation,
        this.motherName,
        this.motherOccupation,
        this.marriedSisters,
        this.unmarriedSisters,
        this.marriedBrothers,
        this.unmarriedBrothers,
        this.nativeLocation,
        this.religion,
        this.motherTongue,
        this.caste,
        this.subCaste,
        this.height,
        this.weight,
        this.maritialStatus,
        this.anyDisability,
        this.familyType,
        this.zodiac,
        this.star,
        this.havingDosham,
        this.education,
        this.employeedIn,
        this.companyName,
        this.occupation,
        this.annualIncome,
        this.workLocation,
        this.expHeight,
        this.expWeight,
        this.expMaritialStatus,
        this.expEducation,
        this.expOccupation,
        this.expSalary,
        this.expLocation,
        this.profileImage1,
        this.profileImage2,
        this.profileImage3,
        this.profileImage4,
        this.profileImage5,
        this.phone,
        this.vvmId,
        this.createdAt});

  UserDetailData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    age = json['age'];
    dob = json['dob'];
    gender = json['gender'];
    aboutYou = json['about_you'];
    familyMembers = json['family_members'];
    fatherName = json['father_name'];
    fatherOccupation = json['father_occupation'];
    motherName = json['mother_name'];
    motherOccupation = json['mother_occupation'];
    marriedSisters = json['married_sisters'];
    unmarriedSisters = json['unmarried_sisters'];
    marriedBrothers = json['married_brothers'];
    unmarriedBrothers = json['unmarried_brothers'];
    nativeLocation = json['native_location'];
    religion = json['religion'];
    motherTongue = json['mother_tongue'];
    caste = json['caste'];
    subCaste = json['sub_caste'];
    height = json['height'];
    weight = json['weight'];
    maritialStatus = json['maritial_status'];
    anyDisability = json['any_disability'];
    familyType = json['family_type'];
    zodiac = json['zodiac'];
    star = json['star'];
    havingDosham = json['having_dosham'];
    education = json['education'];
    employeedIn = json['employeed_in'];
    companyName = json['company_name'];
    occupation = json['occupation'];
    annualIncome = json['annual_income'];
    workLocation = json['work_location'];
    expHeight = json['exp_height'];
    expWeight = json['exp_weight'];
    expMaritialStatus = json['exp_maritial_status'];
    expEducation = json['exp_education'];
    expOccupation = json['exp_occupation'];
    expSalary = json['exp_salary'];
    expLocation = json['exp_location'];
    profileImage1 = json['profile_image_1'];
    profileImage2 = json['profile_image_2'];
    profileImage3 = json['profile_image_3'];
    profileImage4 = json['profile_image_4'];
    profileImage5 = json['profile_image_5'];
    phone = json['phone'];
    vvmId = json['vvm_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['age'] = this.age;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['about_you'] = this.aboutYou;
    data['family_members'] = this.familyMembers;
    data['father_name'] = this.fatherName;
    data['father_occupation'] = this.fatherOccupation;
    data['mother_name'] = this.motherName;
    data['mother_occupation'] = this.motherOccupation;
    data['married_sisters'] = this.marriedSisters;
    data['unmarried_sisters'] = this.unmarriedSisters;
    data['married_brothers'] = this.marriedBrothers;
    data['unmarried_brothers'] = this.unmarriedBrothers;
    data['native_location'] = this.nativeLocation;
    data['religion'] = this.religion;
    data['mother_tongue'] = this.motherTongue;
    data['caste'] = this.caste;
    data['sub_caste'] = this.subCaste;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['maritial_status'] = this.maritialStatus;
    data['any_disability'] = this.anyDisability;
    data['family_type'] = this.familyType;
    data['zodiac'] = this.zodiac;
    data['star'] = this.star;
    data['having_dosham'] = this.havingDosham;
    data['education'] = this.education;
    data['employeed_in'] = this.employeedIn;
    data['company_name'] = this.companyName;
    data['occupation'] = this.occupation;
    data['annual_income'] = this.annualIncome;
    data['work_location'] = this.workLocation;
    data['exp_height'] = this.expHeight;
    data['exp_weight'] = this.expWeight;
    data['exp_maritial_status'] = this.expMaritialStatus;
    data['exp_education'] = this.expEducation;
    data['exp_occupation'] = this.expOccupation;
    data['exp_salary'] = this.expSalary;
    data['exp_location'] = this.expLocation;
    data['profile_image_1'] = this.profileImage1;
    data['profile_image_2'] = this.profileImage2;
    data['profile_image_3'] = this.profileImage3;
    data['profile_image_4'] = this.profileImage4;
    data['profile_image_5'] = this.profileImage5;
    data['phone'] = this.phone;
    data['vvm_id'] = this.vvmId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
