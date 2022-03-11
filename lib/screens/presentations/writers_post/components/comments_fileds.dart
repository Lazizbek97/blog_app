import 'package:flutter/material.dart';
import 'package:work_task/core/utils/size_config.dart';

class AddCommentFields extends StatelessWidget {
  const AddCommentFields({
    Key? key,
    required GlobalKey<FormState> nameFormKey,
    required TextEditingController nameController,
    required GlobalKey<FormState> emailFormKey,
    required TextEditingController emailController,
    required GlobalKey<FormState> textFormKey,
    required TextEditingController textController,
  })  : _nameFormKey = nameFormKey,
        _nameController = nameController,
        _emailFormKey = emailFormKey,
        _emailController = emailController,
        _textFormKey = textFormKey,
        _textController = textController,
        super(key: key);

  final GlobalKey<FormState> _nameFormKey;
  final TextEditingController _nameController;
  final GlobalKey<FormState> _emailFormKey;
  final TextEditingController _emailController;
  final GlobalKey<FormState> _textFormKey;
  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(240),
      width: getWidth(300),
      child: Material(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: _nameFormKey,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Your name ...",
                  contentPadding:
                       EdgeInsets.symmetric(vertical: getHeight(5), horizontal: getWidth(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please, Enter your name";
                  }
                 
                },
              ),
            ),
            Form(
              key: _emailFormKey,
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Your email ...",
                  contentPadding:
                       EdgeInsets.symmetric(vertical: getHeight(5), horizontal: getWidth(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Please, Enter your email";
                  }
                  
                },
              ),
            ),
            Form(
              key: _textFormKey,
              child: TextFormField(
                controller: _textController,
                textInputAction: TextInputAction.go,
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: "Add comments here ...",
                  contentPadding:
                       EdgeInsets.symmetric(vertical: getHeight(5.0), horizontal: getWidth(10)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                validator: (v) {
                  if (v!.isEmpty) {
                    return "You've not commeted yet!";
                  }
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
