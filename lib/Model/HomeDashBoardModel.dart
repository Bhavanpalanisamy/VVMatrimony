class HomeDashBoardModel {
  bool? status;
  String? message;
  List<HomeDashBoardData>? data;

  HomeDashBoardModel({this.status, this.message, this.data});

  HomeDashBoardModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HomeDashBoardData>[];
      json['data'].forEach((v) {
        data!.add(new HomeDashBoardData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeDashBoardData {
  String? vvmId;
  String? name;
  String? age;
  String? maritialStatus;
  String? nativeLocation;
  String? occupation;
  String? workLocation;
  String? profileImage1;

  HomeDashBoardData(
      {this.vvmId,
        this.name,
        this.age,
        this.maritialStatus,
        this.nativeLocation,
        this.occupation,
        this.workLocation,
        this.profileImage1});

  HomeDashBoardData.fromJson(Map<String, dynamic> json) {
    vvmId = json['vvm_id'];
    name = json['name'];
    age = json['age'];
    maritialStatus = json['maritial_status'];
    nativeLocation = json['native_location'];
    occupation = json['occupation'];
    workLocation = json['work_location'];
    profileImage1 = json['profile_image_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vvm_id'] = this.vvmId;
    data['name'] = this.name;
    data['age'] = this.age;
    data['maritial_status'] = this.maritialStatus;
    data['native_location'] = this.nativeLocation;
    data['occupation'] = this.occupation;
    data['work_location'] = this.workLocation;
    data['profile_image_1'] = this.profileImage1;
    return data;
  }
}
