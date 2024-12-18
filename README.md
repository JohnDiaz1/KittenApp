# Kitten App

App hecha en Flutter que consume el api del website https://thecatapi.com/,

## 🚀 Instalación Local


Este proyecto utiliza **Flutter 3.24.5** y requiere la configuración de un archivo **.env** con variables de entorno necesarias para su correcto funcionamiento.

## 📋 **Requisitos previos**

Antes de comenzar, asegúrese de tener lo siguiente instalado en su sistema:

- **Flutter 3.24.5**: [Instrucciones de instalación](https://docs.flutter.dev/get-started/install)
- **Dart SDK**: Generalmente se incluye con Flutter.
- **Editor de texto o IDE**: Se recomienda **Visual Studio Code** o **Android Studio**.

## 🚀 **Instrucciones de instalación local**

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/tu-repositorio.git
   cd tu-repositorio
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Configurar el archivo .env**
    - En la raíz del proyecto, se encuentra el archivo llamado **.env**
    - Agrega las siguientes variables y reemplázalas con los valores correspondientes:
      ```env
      API_KEY_CAT=TU_API_KEY_AQUI
      BASE_URL=https://api.thecatapi.com/v1
      ```

   > 🔥 **Importante:** Asegúrese de que no haya espacios alrededor del signo `=`.