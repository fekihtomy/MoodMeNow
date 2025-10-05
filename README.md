# MoodUpNow

![MoodUpNow Banner](https://via.placeholder.com/800x200.png?text=MoodUpNow)

## Description

**MoodUpNow** est une application mobile Flutter innovante dédiée au bien-être multi-domaine, qui fournit des conseils personnalisés grâce à une intelligence artificielle bienveillante. Elle permet aux utilisateurs d'évaluer leur niveau de stress, d'énergie, qualité de sommeil, alimentation et activité physique, puis de recevoir des recommandations simples, concrètes et motivantes pour améliorer leur quotidien.

L’application s’appuie sur Firebase pour la gestion des données et OpenAI pour générer des conseils personnalisés.

---

## Fonctionnalités principales

- Questionnaire interactif pour évaluer différents aspects du bien-être
- Utilisation de l’API OpenAI pour générer des conseils personnalisés, motivants et adaptés
- Intégration Firebase pour la gestion sécurisée des utilisateurs et données
- Interface utilisateur intuitive et moderne développée avec Flutter et Riverpod

---

## Installation

### Prérequis

- Flutter SDK >= 2.18.0 et < 3.0.0
- Un compte Firebase configuré avec ton projet
- Une clé API OpenAI (optionnel pour tests sans génération automatique)

### Étapes

1. **Cloner le dépôt :**
    ```bash
    git clone https://github.com/ton-utilisateur/MoodUpNow.git
    cd MoodUpNow
    ```

2. **Installer les dépendances Flutter :**
    ```bash
    flutter pub get
    ```

3. **Configurer Firebase :**
    - Exécute `flutterfire configure` pour générer `firebase_options.dart` avec ta config Firebase.

4. **Ajouter ta clé API OpenAI :**
    - Dans `lib/services/openai_service.dart`, remplace `'YOUR_OPENAI_API_KEY'` par ta clé personnelle.

5. **Lancer l’application :**
    ```bash
    flutter run
    ```

---

## Architecture

- **lib/main.dart** : point d’entrée principal de l’application.
- **lib/screens/questionnaire_screen.dart** : interface utilisateur du questionnaire.
- **lib/services/openai_service.dart** : gestion des appels à l’API OpenAI.
- **firebase_options.dart** : configuration Firebase (générée par `flutterfire`).

---

## Contribution

Ce projet est actuellement en développement actif. Les contributions sont **pour le moment privées** et doivent être discutées avec l’équipe de développement. Merci de ne pas ouvrir de Pull Requests sans accord préalable.

---

## Licence

© 2025 MoodUpNow

Tous droits réservés.  
Ce projet est **strictement privé** et son utilisation, modification, distribution ou copie sans autorisation expresse écrite de MoodUpNow est **formellement interdite**.

Vous pouvez consulter le code source sur GitHub à des fins d’audit ou de consultation uniquement, sous réserve de ne pas copier ni redistribuer.

Pour toute demande commerciale ou d’utilisation, veuillez contacter :

**contact@moodupnow.com**

---

## Contact

- Auteur : Tomy FEKIH
- Email : contact@moodupnow.com  
- Site web : [https://moodupnow.com](https://moodupnow.com)

---

## Remerciements

Merci à Flutter, Firebase, et OpenAI pour rendre ce projet possible.

---
