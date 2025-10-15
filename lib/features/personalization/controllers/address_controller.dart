import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/circular_loader.dart';
import 'package:t_store/common/widgets/text/section_heading.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/personalization/screens/adress/add_new_address.dart';
import 'package:t_store/features/personalization/screens/adress/widgets/single_address.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// Variables
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  final RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value =
          addresses.firstWhere((element) => element.selectedAddress,
              orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  /// Select Address Function
  Future selectAddress(AddressModel newSelectedAddress) async {
    try {

      Get.defaultDialog(
        title: '',
        onWillPop: () async {return false;},
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const TCircularLoader(),
      );

      // Clear The Selected Address Field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSingleField(
            selectedAddress.value.id, false);
      }

      // Assign New Selected Address
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // Set the "Selected" field to true for the newly selected address
      await addressRepository.updateSingleField(selectedAddress.value.id, true);

      Get.back();

    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  Future addNewAddress() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Storing Address...', TImages.docerAnimation);

      // Check Internet Activity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);

      // Update Selected Address Status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // Show Success Message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your address has been saved successfully');

      // Refresh Address Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address Not Found!', message: e.toString());
    }
  }

  /// Show Addresses ModalBottomSheet at checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeadings(title: 'Select Address', showActionButton: false),
              FutureBuilder(future: getAllUserAddresses(),
                  builder: (_, snapshot) {
                    // Helper Function : Handle Loader, No Record, or Error Message
                    final response = TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot);
                    if(response != null) return response;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => TSingleAddress(
                          address: snapshot.data![index],
                          isSelected: selectedAddress.value.id == snapshot.data![index].id,
                          onTap: () async {
                            await selectAddress(snapshot.data![index]);
                            Get.back();
                          }
                      ),
                    );
                  }
              ),
              const SizedBox(height: TSizes.defaultSpace * 2),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.to(() => const AddNewAddress()), child: const Text('Add New Address')),
              ),
            ],
          ),
        ),
    );
  }

  /// Function to reset Form Fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    state.clear();
    postalCode.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}