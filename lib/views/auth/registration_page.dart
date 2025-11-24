import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hello_bus/core/theme/app_theme.dart';
import 'package:hello_bus/core/theme/colors.dart';
import 'package:hello_bus/widgets/linked_text_checkbox.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_symbols_icons/symbols.dart';

class HelloBusRegistrationPage extends StatefulWidget {
  const HelloBusRegistrationPage({super.key});

  @override
  State<HelloBusRegistrationPage> createState() =>
      _HelloBusRegistrationPageState();
}

class _HelloBusRegistrationPageState extends State<HelloBusRegistrationPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _agree = false;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordsMatch = true;
  bool _isEmailValid = true;
  bool _isFullNameValid = true;
  bool _isPhoneValid = true;
  bool _isPasswordValid = true;
  bool _isConfirmPasswordValid = true;

  String _passwordStrength = "";

  final RegExp _emailRegex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

  void _checkPasswords() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text;
      _updatePasswordStrength(_passwordController.text);
      _isPasswordValid = _passwordController.text.isNotEmpty;
      _isConfirmPasswordValid =
          _confirmPasswordController.text.isNotEmpty && _passwordsMatch;
    });
  }

  void _validateEmail(String email) {
    setState(() {
      _isEmailValid = _emailRegex.hasMatch(email);
    });
  }

  void _validateFullName(String name) {
    setState(() {
      _isFullNameValid = name.trim().isNotEmpty;
    });
  }

  void _validatePhone(String phone) {
    setState(() {
      _isPhoneValid = phone.trim().isNotEmpty && phone.length >= 10;
    });
  }

  void _updatePasswordStrength(String password) {
    if (password.isEmpty) {
      _passwordStrength = "";
    } else if (password.length < 6) {
      _passwordStrength = "Weak";
    } else if (password.length < 10) {
      _passwordStrength = "Medium";
    } else {
      final hasUpper = password.contains(RegExp(r'[A-Z]'));
      final hasLower = password.contains(RegExp(r'[a-z]'));
      final hasDigit = password.contains(RegExp(r'\d'));
      final hasSpecial = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      _passwordStrength = (hasUpper && hasLower && hasDigit && hasSpecial)
          ? "Strong"
          : "Medium";
    }
  }

  void _handleRegistration() {
    _validateFullName(_fullNameController.text);
    _validateEmail(_emailController.text);
    _validatePhone(_phoneController.text);
    _checkPasswords();

    if (!_isFullNameValid ||
        !_isEmailValid ||
        !_isPhoneValid ||
        !_isPasswordValid ||
        !_isConfirmPasswordValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fix the highlighted fields."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (!_agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("You must agree to the terms and conditions."),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registration Successful!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

    // TODO: Implement actual registration logic
  }

  void _signUpWithGoogle() {
    // TODO: Implement Google Sign Up logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Google Sign Up Clicked!"),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Color _getStrengthColor() {
    switch (_passwordStrength) {
      case "Weak":
        return Colors.red;
      case "Medium":
        return Colors.orange;
      case "Strong":
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }

  double _getStrengthValue() {
    switch (_passwordStrength) {
      case "Weak":
        return 0.33;
      case "Medium":
        return 0.66;
      case "Strong":
        return 1.0;
      default:
        return 0.0;
    }
  }

  Widget _buildOrDivider() {
    return Row(
      children: const [
        Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text("OR", style: TextStyle(color: AppColors.gray600)),
        ),
        Expanded(child: Divider(thickness: 1)),
      ],
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // removes debug banner
      theme: helloBusTheme,
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ), // reduced vertical padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo - moved closer to top
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/logo.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12), // reduced from 12
                // Title
                Text(
                  "Create Account",
                  style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),

                // Google Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _signUpWithGoogle,
                    icon: Image.asset(
                      "assets/images/google.png", // <-- path to your asset
                      width: 25,
                      height: 25,
                    ),
                    label: const Text(
                      "Sign Up with Google",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: AppColors.neutral),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // OR Divider
                _buildOrDivider(),
                const SizedBox(height: 24),

                // Form Fields
                Column(
                  children: [
                    // Full Name
                    TextField(
                      controller: _fullNameController,
                      onChanged: _validateFullName,
                      decoration: InputDecoration(
                        hintText: "Full Name",
                        errorText: _isFullNameValid
                            ? null
                            : "Full Name is required",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Phone
                    TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      onChanged: _validatePhone,
                      decoration: InputDecoration(
                        hintText: "Phone Number",
                        errorText: _isPhoneValid
                            ? null
                            : "Invalid phone number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email
                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: _validateEmail,
                      decoration: InputDecoration(
                        hintText: "Email",
                        errorText: _isEmailValid
                            ? null
                            : "Invalid email address",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      onChanged: (_) => _checkPasswords(),
                      decoration: InputDecoration(
                        hintText: "Password",
                        errorText: _isPasswordValid
                            ? null
                            : "Password is required",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Symbols.visibility
                                : Symbols.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    if (_passwordStrength.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 6, bottom: 12),
                        child: LinearProgressIndicator(
                          value: _getStrengthValue(),
                          minHeight: 6,
                          backgroundColor: AppColors.neutral.withOpacity(0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _getStrengthColor(),
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),

                    // Confirm Password
                    TextField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      onChanged: (_) => _checkPasswords(),
                      decoration: InputDecoration(
                        hintText: "Confirm Password",
                        errorText: _isConfirmPasswordValid
                            ? null
                            : "Passwords do not match",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureConfirmPassword
                                ? Symbols.visibility
                                : Symbols.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    LinkedTextCheckbox(
                      value: _agree,
                      onChanged: (val) {
                        setState(() => _agree = val ?? false);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Create Account Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleRegistration,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _agree
                          ? AppColors.primary
                          : AppColors.gray400,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Create Account"),
                  ),
                ),
                const SizedBox(height: 20),

                // Login Text
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: AppColors.gray600,
                      fontSize: 14,
                    ),
                    children: [
                      const TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {
                          Navigator.pushNamed(context, "/login");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
