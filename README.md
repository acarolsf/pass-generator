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

O projeto foi estruturado para separar completamente as strings de interface da lógica do código. Isso permite escalabilidade para adicionar novos idiomas no futuro sem a necessidade de alterar as views ou controladores do app.

- [x] Localization

  - [x] Portuguese (Brazil)
  
  - [x] English (EUA)

### Estrutura de Arquivos

A organização dos recursos de tradução foi centralizada e estruturada da seguinte forma:

```text
├── Resources/
│   ├── en.lproj/
│   │   └── Localizable.strings  <- Strings localizadas para Inglês
│   ├── pt.lproj/
│   │   └── Localizable.strings  <- Strings localizadas para Português
│   └── LocalizationKeys.swift   <- Centralização das chaves e helper de tradução
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
