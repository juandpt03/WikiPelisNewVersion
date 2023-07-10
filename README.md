# wikipelis

# Dev


1. Copiar el .env.template y renombrar a .env
2. Cambiar las variables de entorno (The MovieDB) genere y pegue su propia ApiKey
3. Cambios en la identidad para la implementación de Isar Database, hay que ejecutar el comando 
```
flutter pub run build_runner build

```
#   Prod
Para cambiar el nombre de la aplicación
```
flutter pub run change_app_package_name:main com.juandpt.WikiPelis

```

Para cambiar el ícono de la aplicación
```
flutter pub run flutter_launcher_icons

```
Para cambiar el Splash Screen
```
dart run flutter_native_splash:create

```