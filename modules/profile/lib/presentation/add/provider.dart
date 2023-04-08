import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

enum ProfileUpdatePageEnum {
  personal,
  address,
  parents,
  qualification,
  kyc,
}

class ProfilePersonalAddData {
  ProfilePersonalAddData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    this.image,
  });

  factory ProfilePersonalAddData.empty() => ProfilePersonalAddData(
        firstName: "",
        lastName: "",
        email: "",
        phone: "",
  );

  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final XFile? image;
}

class ProfileAddressData {
  ProfileAddressData({
    required this.address,
    required this.city,
    required this.state,
    required this.pincode,
    required this.country,
  });

  factory ProfileAddressData.empty() => ProfileAddressData(
        address: "",
        city: "",
        state: "",
        pincode: "",
        country: "",
  );

  final String address;
  final String city;
  final String state;
  final String pincode;
  final String country;
}

class ProfileAddressAddData {
  final ProfileAddressData residentialAddress;
  final ProfileAddressData parentAddress;
  final bool isSameAsResidential;

  factory ProfileAddressAddData.empty() => ProfileAddressAddData(
        residentialAddress: ProfileAddressData.empty(),
        parentAddress: ProfileAddressData.empty(),
        isSameAsResidential: true,
  );

  ProfileAddressAddData({
    required this.residentialAddress,
    required this.parentAddress,
    required this.isSameAsResidential,
  }); 
}

class ProfileParentsData {
  final String name;
  final String occupation;
  final String qualification;
  final String phone;
  final String email;

  ProfileParentsData({
    required this.name,
    required this.occupation,
    required this.qualification,
    required this.phone,
    required this.email,
  });
}

class ProfileParentsAddData {
  final ProfileParentsData? father;
  final ProfileParentsData? mother;
  final ProfileParentsData? guardian;

  factory ProfileParentsAddData.empty() => ProfileParentsAddData();

  ProfileParentsAddData({
    this.father,
    this.mother,
    this.guardian,
  });
}

class ProfileQualificationData {
  final String education;
  final String specialization;
  final String university;
  final String yearOfPassing;
  final String grades;
  final String certificate;
  final String course;

  ProfileQualificationData({
    required this.education,
    required this.specialization,
    required this.university,
    required this.yearOfPassing,
    required this.grades,
    required this.certificate,
    required this.course,
  });

  factory ProfileQualificationData.empty() => ProfileQualificationData(
        education: "",
        specialization: "",
        university: "",
        yearOfPassing: "",
        grades: "",
        certificate: "",
        course: "",
  );
}

enum ProfileKycStatusEnum {
  uploadPending,
  uploadFailed,
  pendingValidation,
  rejectedValidation,
  validated,
}

class ProfileKycData {
  final String title;
  final ProfileKycStatusEnum status; // UPLOAD_PENDING, UPLOAD_FAILED, PENDING_VALIDATION, REJECTED_VALIDATION, VALIDATED
  
  ProfileKycData({
    required this.title,
    this.status = ProfileKycStatusEnum.uploadPending,
  });
}

class ProfileKycAddData {
  ProfileKycData aadhar = ProfileKycData(title: "Aadhar Card");
  ProfileKycData pan = ProfileKycData(title: "Pan Card");
  ProfileKycData address = ProfileKycData(title: "Address Proof");
  ProfileKycData other = ProfileKycData(title: "Other Proof");
  void updateStatus(String title, ProfileKycStatusEnum status) {
    switch (title) {
      case "Aadhar Card":
        aadhar = ProfileKycData(title: title, status: status);
        break;
      case "Pan Card":
        pan = ProfileKycData(title: title, status: status);
        break;
      case "Address Proof":
        address = ProfileKycData(title: title, status: status);
        break;
      case "Other Proof":
        other = ProfileKycData(title: title, status: status);
        break;
    }
  }
}

class ProfileAddPageData {
  final ProfilePersonalAddData? personal;
  final ProfileAddressAddData? address;
  final ProfileParentsAddData? parents;
  final List<ProfileQualificationData> qualificationList;
  final ProfileKycAddData kyc;

  final ProfileUpdatePageEnum page;

  ProfileAddPageData copyWith({
    ProfilePersonalAddData? personal,
    ProfileAddressAddData? address,
    ProfileParentsAddData? parents,
    List<ProfileQualificationData> qualificationList = const [],
    ProfileKycAddData? kyc,
    ProfileUpdatePageEnum? page,
  }) =>
      ProfileAddPageData(
        personal: personal ?? this.personal,
        address: address ?? this.address,
        parents: parents ?? this.parents,
        qualificationList: qualificationList.isEmpty ? this.qualificationList : qualificationList,
        kyc: kyc ?? this.kyc,
        page: page ?? this.page,
  );

  ProfileAddPageData({
    required this.personal,
    required this.address,
    required this.parents,
    required this.qualificationList,
    required this.kyc,
    required this.page,
  });

  factory ProfileAddPageData.empty() => ProfileAddPageData(
        personal: ProfilePersonalAddData.empty(),
        address: ProfileAddressAddData.empty(),
        parents: ProfileParentsAddData.empty(),
        qualificationList: [],
        kyc: ProfileKycAddData(),
        page: ProfileUpdatePageEnum.personal,
  );
}

class ProfileAddPageNotifier extends StateNotifier<ProfileAddPageData> {
  ProfileAddPageNotifier() : super(ProfileAddPageData.empty());
  void setPersonalData(ProfilePersonalAddData data) => state = state.copyWith(personal: data);
  void setAddressData(ProfileAddressAddData data) => state = state.copyWith(address: data);
  void setParentsData(ProfileParentsAddData data) => state = state.copyWith(parents: data);
  void setQualificationData(List<ProfileQualificationData> data) => state = state.copyWith(qualificationList: data);
  void setKYCData(ProfileKycAddData data) => state = state.copyWith(kyc: data);
  void setPersonal() => state = state.copyWith(page: ProfileUpdatePageEnum.personal);
  void setAddress() => state = state.copyWith(page: ProfileUpdatePageEnum.address);
  void setParents() => state = state.copyWith(page: ProfileUpdatePageEnum.parents);
  void setQualification() => state = state.copyWith(page: ProfileUpdatePageEnum.qualification);
  void setKYC() => state = state.copyWith(page: ProfileUpdatePageEnum.kyc);
  void reset() => state = ProfileAddPageData.empty();
  void pop(BuildContext context) {
    if (state.page == ProfileUpdatePageEnum.personal) {
      context.pop();
    } else {
      state = state.copyWith(page: ProfileUpdatePageEnum.values[state.page.index - 1]);
    }
  }
}

final pageDataProvider = StateNotifierProvider<ProfileAddPageNotifier, ProfileAddPageData>(
  (ref) => ProfileAddPageNotifier(),
);

final personalDataProvider = Provider((ref) {
  final pageData = ref.watch(pageDataProvider);
  return pageData.personal;
});

final addressDataProvider = Provider((ref) {
  final pageData = ref.watch(pageDataProvider);
  return pageData.address;
});

final parentsDataProvider = Provider((ref) {
  final pageData = ref.watch(pageDataProvider);
  return pageData.parents;
});

final qualificationDataProvider = Provider((ref) {
  final pageData = ref.watch(pageDataProvider);
  return pageData.qualificationList;
});

final kycDataProvider = Provider((ref) {
  final pageData = ref.watch(pageDataProvider);
  return pageData.kyc;
});

final pageProvider = Provider((ref) {
  final pageData = ref.watch(pageDataProvider);
  return pageData.page;
});