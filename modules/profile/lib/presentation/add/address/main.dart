// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:profile/presentation/add/button.dart';
import 'package:profile/presentation/add/provider.dart';
import 'package:profile/presentation/text_field.dart';
import 'package:shared/shared.dart';
import 'package:styles/styles.dart';

class ProfileAddAddress extends HookConsumerWidget {
  const ProfileAddAddress({super.key});

  String? _validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return "Residential address is required";
    }
    return null;
  }

  String? _validateCity(String? value) {
    if (value == null || value.isEmpty) {
      return "City is required";
    }
    return null;
  }

  String? _validateState(String? value) {
    if (value == null || value.isEmpty) {
      return "State is required";
    }
    return null;
  }

  String? _validatePincode(String? value) {
    if (value == null || value.isEmpty) {
      return "Pincode is required";
    }
    return null;
  }

  String? _validateCountry(String? value) {
    if (value == null || value.isEmpty) {
      return "Country is required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final address = ref.watch(addressDataProvider);
    final residentialAddressHandler = useTextFieldHandler(
      initialText: address?.residentialAddress.address,
      validator: _validateAddress,
      keyboardType: TextInputType.streetAddress,
    );
    final residentialCityHandler = useTextFieldHandler(
      initialText: address?.residentialAddress.city,
      validator: _validateCity,
      keyboardType: TextInputType.streetAddress,
    );
    final residentialStateHandler = useTextFieldHandler(
      initialText: address?.residentialAddress.state,
      validator: _validateState,
      keyboardType: TextInputType.streetAddress,
    );
    final residentialPincodeHandler = useTextFieldHandler(
      initialText: address?.residentialAddress.pincode,
      validator: _validatePincode,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false),
    );
    final residentialCountryHandler = useTextFieldHandler(
      initialText: address?.residentialAddress.country,
      validator: _validateCountry,
      keyboardType: TextInputType.streetAddress,
    );
    final sameAsResidentialAddress = useState(address?.isSameAsResidential ?? true);
    final parentAddressHandler = useTextFieldHandler(
      initialText: address?.parentAddress.address,
      validator: _validateAddress,
      keyboardType: TextInputType.streetAddress,
    );
    final parentCityHandler = useTextFieldHandler(
      initialText: address?.parentAddress.city,
      validator: _validateCity,
      keyboardType: TextInputType.streetAddress,
    );
    final parentStateHandler = useTextFieldHandler(
      initialText: address?.parentAddress.state,
      validator: _validateState,
      keyboardType: TextInputType.streetAddress,
    );
    final parentPincodeHandler = useTextFieldHandler(
      initialText: address?.parentAddress.pincode,
      validator: _validatePincode,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: false, signed: false),
    );
    final parentCountryHandler = useTextFieldHandler(
      initialText: address?.parentAddress.country,
      validator: _validateCountry,
      keyboardType: TextInputType.streetAddress,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Address Details").titleMedium(color: defaultBlackColor),
        ProfileTextField(
          label: "Residential Address",
          handler: residentialAddressHandler,
          paddingTop: 15,
        ),
        ProfileTextField(label: "City", handler: residentialCityHandler),
        Row(
          children: [
            Expanded(
              child: ProfileTextField(
                  label: "State", handler: residentialStateHandler),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ProfileTextField(
                  label: "Pincode", handler: residentialPincodeHandler),
            ),
          ],
        ),
        ProfileTextField(label: "Country", handler: residentialCountryHandler),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            AppCheckBox(
              isChecked: sameAsResidentialAddress.value,
              onCheckChanged: (value) {
                sameAsResidentialAddress.value = value;
              },
            ),
            const SizedBox(width: 16),
            Flexible(
                child: GestureDetector(
              onTap: () => sameAsResidentialAddress.value =
                  !sameAsResidentialAddress.value,
              child: const Text(
                'Same as Residential Address',
                overflow: TextOverflow.visible,
              ).bodyMedium(color: defaultBlackColor),
            )),
          ],
        ),
        ProfileTextField(
          label: "Parent Address",
          handler: sameAsResidentialAddress.value
              ? residentialAddressHandler
              : parentAddressHandler,
          paddingTop: 23,
          isDisabled: sameAsResidentialAddress.value,
        ),
        ProfileTextField(
          label: "City",
          handler: sameAsResidentialAddress.value
              ? residentialCityHandler
              : parentCityHandler,
          isDisabled: sameAsResidentialAddress.value,
        ),
        Row(
          children: [
            Expanded(
              child: ProfileTextField(
                  label: "State",
                  handler: sameAsResidentialAddress.value
                      ? residentialStateHandler
                      : parentStateHandler,
                  isDisabled: sameAsResidentialAddress.value),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: ProfileTextField(
                  label: "Pincode",
                  handler: sameAsResidentialAddress.value
                      ? residentialPincodeHandler
                      : parentPincodeHandler,
                  isDisabled: sameAsResidentialAddress.value),
            ),
          ],
        ),
        ProfileTextField(
            label: "Country",
            handler: sameAsResidentialAddress.value
                ? residentialCountryHandler
                : parentCountryHandler,
            isDisabled: sameAsResidentialAddress.value),
        NextButton(onNext: () {
          ProfileAddressData residentialAddress = ProfileAddressData(
            address: residentialAddressHandler.text,
            city: residentialCityHandler.text,
            state: residentialStateHandler.text,
            pincode: residentialPincodeHandler.text,
            country: residentialCountryHandler.text,
          );
          ProfileAddressData parentAddress;
          if (sameAsResidentialAddress.value) {
            parentAddress = residentialAddress;
          } else {
            parentAddress = ProfileAddressData(
              address: parentAddressHandler.text,
              city: parentCityHandler.text,
              state: parentStateHandler.text,
              pincode: parentPincodeHandler.text,
              country: parentCountryHandler.text,
            );
          }
          ProfileAddressAddData addressAddData = ProfileAddressAddData(
            residentialAddress: residentialAddress,
            parentAddress: parentAddress,
            isSameAsResidential: sameAsResidentialAddress.value,
          );
          ref.read(pageDataProvider.notifier).setAddressData(addressAddData);
          ref.read(pageDataProvider.notifier).setParents();
        })
      ],
    );
  }
}
