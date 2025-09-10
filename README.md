# Тестовое задание

🔹 Проект состоит из двух экранов и функционала авторизации через Apple и Google с использованием Firebase ID Token. [Cсылка на задание](https://docs.google.com/document/d/198U8c_myr7YOA91Jmuw0NZHyGLYceXBdlHjDC2idExg/edit?usp=sharing).

<p align="left">

<img src="https://github.com/CocoaDevCat/TestWork/blob/main/test/Screens/auth.png?raw=true" alt="App Screenshot" width="300"/>

<img src="https://github.com/CocoaDevCat/TestWork/blob/main/test/Screens/home.png?raw=true" alt="App Screenshot" width="300"/>
</p>

---

## Требования

Для корректного запуска проекта необходимо:

- 🖥 **Xcode 16+** (или новее)  
- 📱 **iOS 18.5+** в качестве минимальной версии SDK  
- 🔑 **Apple Developer Account** — требуется для использования **Sign in with Apple**  
- 🔥 **Firebase Account** — для настройки **Firebase Authentication** (Google/Apple ID Token)  
- 🌐 Подключение к интернету для загрузки зависимостей через **Swift Package Manager**  

---

## Установка проекта вручную

1. **Склонируйте репозиторий**:

После клонирования репозитория необходимо открыть проект, все зависимости скачаются автоматически через Swift Package Manager.

```
git clone https://github.com/CocoaDevCat/TestWork.git
```

## Описание
- 🖌️ **Верстка:** проект сверстан с помощью SwiftUI по атомарному принципу.
- ⚙️ **Архитектура:** проект реализован по принципам Clean Swift, с использованием Dependency Injection (DI) и Factory.

## 📦 Структура проекта
- **App:** в нем находятся App и Scene Delegate, а также Info.plist.
- **Data:** реализация репозиториев, API, Keychain, DTO.
- **Domain:** бизнес-логика, модели, UseCases.
- **Presentation:** DI + Factory, SwiftUI Views, ViewModels, UI-компоненты.
- **Resources:** изображения, цвета и шрифты.
- **SupportingFiles:** LaunchScreen.
- **Core:** базовые классы, код Router и DI.

## 📦 Используемые библиотеки

В проекте используются следующие библиотеки и фреймворки:

- 🔹 [Firebase](https://firebase.google.com/) — для авторизации через Google и Apple, работы с ID Token.
- 🔹 [GoogleSignIn](https://developers.google.com/identity/sign-in/ios) — для входа через Google.

## Что бы вы улучшили в продакшен-версии
- Разделил проект на модули (Feature, Core, App)
- Добавить обработчик запросов и реализовал отображение ошибок
- Добавить дизайн-систему
- Добавить линтер и настроить CI/CD
- Написал unit-тесты для слоя Domain
- До конца реализовать Network слой (возможно переписать используя Alamofire)


