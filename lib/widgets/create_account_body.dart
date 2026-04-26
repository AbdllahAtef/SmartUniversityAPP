import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_university_app/providers/create_account_provider.dart';
import 'package:smart_university_app/utils/validator.dart';
import 'package:smart_university_app/widgets/create_account_header.dart';
import 'package:smart_university_app/widgets/custom_elevated_button.dart';
import 'package:smart_university_app/widgets/custom_text_form_field.dart';
import 'package:smart_university_app/widgets/faculty_dropdown.dart';
import 'package:smart_university_app/widgets/role_selector.dart';

class CreateAccountBody extends ConsumerStatefulWidget {
  const CreateAccountBody({super.key});

  @override
  ConsumerState<CreateAccountBody> createState() => _CreateAccountBodyState();
}

class _CreateAccountBodyState extends ConsumerState<CreateAccountBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(createAccountProvider);
    final notifier = ref.read(createAccountProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 30.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CreateAccountHeader(),
              SizedBox(height: 40.h),

              CustomTextFormField(
                isPassword: false,
                hint: 'UserName',
                onChanged: notifier.updateName,
                validator: (value) => Validators.required(value, 'Username'),
              ),

              SizedBox(height: 15.h),

              CustomTextFormField(
                isPassword: false,
                hint: 'Email',
                onChanged: notifier.updateEmail,
                validator: (value) => Validators.email(value),
              ),

              SizedBox(height: 15.h),

              CustomTextFormField(
                isPassword: false,
                hint: 'Id',
                isID: true,
                onChanged: notifier.updateNationalId,
                validator: (value) => Validators.nationalId(value),
              ),

              SizedBox(height: 15.h),

              CustomTextFormField(
                isPassword: true,
                hint: 'Password',
                onChanged: notifier.updatePassword,
                validator: (value) => Validators.password(value),
              ),

              SizedBox(height: 15.h),

              CustomTextFormField(
                isPassword: true,
                hint: 'Retype Password',
                validator: (value) =>
                    Validators.confirmPassword(value, state.password),
                onChanged: notifier.updateConfirmPassword,
              ),

              SizedBox(height: 30.h),

              FormField<String>(
                initialValue: state.role,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a role';
                  }
                  return null;
                },
                builder: (field) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RoleSelector(
                        selectedRole: field.value ?? '',
                        onChanged: (value) {
                          field.didChange(value);
                          notifier.changeRole(value);
                        },
                      ),
                      if (field.hasError)
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            field.errorText!,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                    ],
                  );
                },
              ),
              if (state.role == "Student") ...[
                const SizedBox(height: 30),
                FacultyDropdown(
                  selectedFaculty: state.faculty,
                  onChanged: (value) {
                    notifier.changeFaculty(value);
                  },
                ),
              ],

              SizedBox(height: 50.h),

              CustomElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () async {
                        final result = await notifier.submit(_formKey);

                        if (result == null) return;

                        if (result == "success") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Registered Successfully ✅"),
                            ),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(result)));
                        }
                      },
                text: '',
                child: state.isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
