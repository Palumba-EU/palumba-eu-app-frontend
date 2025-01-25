# Palumba (Palumba layout)

📲 Flutter version: 3.27.1

⭐️Flutter 3.0 (with sound null safety)⭐️

## 1️⃣ Getting Started
Please, do change the package name prior to start the project.

 1. Run pub get
 2. Run flutter pub run change_app_package_name:main <new_package_name>

## Generate Translations
To update the translations of the up just run the generation script from the project's root directory and provide the exported .zip file from crowdin as parameter:

```bash
sh scripts/generate_intl_resources.sh /path/to/translation-file.zip
```