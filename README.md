# Password Generator
Just a **Password generator** to generate new passwords when I need :x

I also used this project to study about Localization (L10n) and Internationalization (i18n).

The project is not ready!

----
## Main features

- [x] Generate passwords

- [ ] Save password with a description

- [ ] Show password when user needs

- [ ] Password criptography
----

## Secondary features

The project was structured to completely separate UI strings from the application's business logic. This approach enables scalability for adding new languages in the future without requiring changes to the app's views or controllers.

- [x] Localization

  - [x] Portuguese (Brazil)
  
  - [x] English (EUA)

### File Structure

The translation resources were centralized and organized as follows:

```text
├── Resources/
│   ├── en.lproj/
│   │   └── Localizable.strings  <- Localized strings for English
│   ├── pt.lproj/
│   │   └── Localizable.strings  <- Localized strings for Portuguese
│   └── LocalizationKeys.swift   <- Centralized localization keys and translation helper
```

## Screens
- [ ] Home
- [x] Pass filter generator
- [x] Pass list
- [x] Save pass
- [ ] Success screen

## Screenshots

### Before add the localization files
Password filter generator | List of generated passwords | Save password | Security Tips
------------------------- | --------------------------- | -------------- | ---------
![](/screenshots/pass-generator.png) | ![](/screenshots/pass-list.png) | ![](/screenshots/save-pass.png) | ![](/screenshots/sec_tips.png)

### Portuguese
Password filter generator | List of generated passwords | Save password | Security Tips
------------------------- | --------------------------- | -------------- | ---------
![](/screenshots/pass-generator_pt.png) | ![](/screenshots/pass-list_pt.png) | ![](/screenshots/save-pass_pt.png) | ![](/screenshots/sec_tips_pt.png)

### English
Password filter generator | List of generated passwords | Save password | Security Tips
------------------------- | --------------------------- | -------------- | ---------
![](/screenshots/pass-generator_en.png) | ![](/screenshots/pass-list_en.png) | ![](/screenshots/save-pass_en.png) | ![](/screenshots/sec_tips_en.png)


## Contribution
If you want to contribute, feel free to fork and send me a pull request.
