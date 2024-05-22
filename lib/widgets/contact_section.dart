import 'package:flutter/material.dart';
import 'package:gloryportifolio/constants/colors.dart';
import 'package:gloryportifolio/constants/links.dart';
import 'package:gloryportifolio/constants/size.dart';
import 'package:gloryportifolio/widgets/custom_text_field.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  Future<void> _sendEmail(BuildContext context) async {
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String message = _messageController.text;

    final Uri uri =Uri.parse('https://wraisedev.netlify.app/send-email');// Adjust the URL to match your backend

    try {
      final response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'name': name,
          'email': email,
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Message sent')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to send message')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.bglight1,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          const Text(
            'Get in touch',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
              maxHeight: 100,
            ),
            child: LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth >= kMinDesktopWIdth) {
                return buildNameEmailDesktop();
              }
              return buildNameEmailMobile();
            }),
          ),
          const SizedBox(height: 20),
          // message texfield
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: CustomTextfield(
              hintText: 'Your message',
              maxLines: 16,
              controller: _messageController,
            ),
          ),
          const SizedBox(height: 20),
          // send elevated button
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  _sendEmail(context); // Use the modified method
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      CustomColor.orangePrimary),
                ),
                child: const Text(
                  "Get in touch",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          // divider
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: const Divider(),
          ),
          const SizedBox(height: 15),
          // SNS icon button links
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.github]);
                },
                child: Image.asset(
                  'assets/project/github.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SnsLinks.linkedin]);
                },
                child: Image.asset(
                  'assets/project/linkedin.png',
                  width: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row buildNameEmailDesktop() {
    return Row(
      children: [
        // name texfield
        Flexible(
          child: CustomTextfield(
            hintText: 'Your name',
            controller: _nameController,
          ),
        ),
        const SizedBox(width: 15),
        // email texfield
        Flexible(
          child: CustomTextfield(
            hintText: 'Your email',
            controller: _emailController,
          ),
        ),
      ],
    );
  }

  Column buildNameEmailMobile() {
    return Column(
      children: [
        // name texfield
        Flexible(
          child: CustomTextfield(
            hintText: 'Your name',
            controller: _nameController,
          ),
        ),
        const SizedBox(height: 15),
        // email texfield
        Flexible(
          child: CustomTextfield(
            hintText: 'Your email',
            controller: _emailController,
          ),
        ),
      ],
    );
  }
}
