# Convenciones de Arquitectura

Este documento recopila las decisiones arquitectónicas del proyecto. Su objetivo es mantener un criterio consistente durante el desarrollo y evitar que las decisiones cambien entre features.

---

# Principios

- Favorecer clases pequeñas y con una única responsabilidad.
- Priorizar composición sobre herencia.
- Mantener el dominio independiente de Flutter y de cualquier tecnología externa.
- El dominio no debe conocer detalles de infraestructura.
- Cada capa solo conoce la inmediatamente inferior mediante abstracciones.

# NOTAS
- Para la conversión entre entidades de dominio y entidades de base de datos, usamos modelos enriquecidos, por ejemplo las entidades de Isar tienen un método llamado fromDomain, este recibe una entidad de dominio y retorna una entidad Isar

---

# Organización del proyecto

```text
lib/
│
├── app/
├── core/
├── features/
└── shared/
```

## app

Contiene la configuración global de la aplicación.

Ejemplos:

- App
- Router
- Dependency Injection
- Theme

---

## core

Contiene componentes técnicos reutilizables que no pertenecen al negocio.

Ejemplos:

- Result
- Failure
- Logger
- Helpers
- Extensions

Una clase pertenece a `core` si seguiría existiendo aunque la aplicación cambiara completamente de dominio.

---

## features

Cada funcionalidad visible para el usuario vive dentro de una feature.

Actualmente:

```text
features/
├── library/
├── player/
└── settings/
```

Cada feature es autosuficiente.

```text
library/
├── data/
├── domain/
└── presentation/
```

---

## shared

Contiene componentes reutilizables entre features.

Ejemplos:

- Widgets reutilizables
- Assets
- Componentes visuales

No debe contener lógica de negocio.

---

# Dominio

El dominio representa exclusivamente reglas del negocio.

No conoce:

- Flutter
- Isar
- Plugins
- Riverpod
- on_audio_query
- just_audio

---

# Entidades

## Convenciones

- Inmutables.
- Sin dependencias externas.
- Constructor `const` cuando sea posible.
- Identificador de tipo `String`.
- Igualdad basada únicamente en el `id`.
- Declaradas como `final class`.

Ejemplo:

```dart
final class Song {
  const Song({
    required this.id,
    required this.title,
  });

  final String id;
  final String title;
}
```

---

# Result

Todas las operaciones del dominio devuelven un `Result<T>`.

No se utilizan excepciones como mecanismo de comunicación entre capas.

```dart
Future<Result<List<Song>>>
```

Jerarquía:

```text
Result
├── SuccessResult
└── FailureResult
```

---

# Failure

Los errores del dominio se representan mediante objetos.

Nunca mediante `Exception`.

Ejemplo:

```dart
Failure

PermissionDeniedFailure

StorageFailure

UnknownFailure
```

---

# Repositories

Los repositories representan acceso a información del dominio.

No contienen reglas de negocio.

Su responsabilidad es obtener y persistir entidades.

Ejemplo:

```dart
LibraryRepository
```

Responsabilidades:

- obtener canciones
- guardar canciones
- eliminar canciones
- buscar canciones

No decide qué insertar o eliminar.

---

# Use Cases

Los casos de uso contienen la lógica del negocio.

Son responsables de orquestar múltiples repositories.

Ejemplo:

```text
SynchronizeLibraryUseCase

↓

ScanRepository.scan()

↓

LibraryRepository.getAll()

↓

Comparar

↓

LibraryRepository.save()

↓

LibraryRepository.delete()
```

Toda decisión del negocio debe vivir aquí.

---

# Manejo de excepciones

## DataSource

Puede utilizar `try/catch`.

Convierte excepciones externas en errores conocidos.

Ejemplo:

```dart
PlatformException
↓
PermissionDeniedException
```

---

## Repository

Nunca propaga excepciones.

Convierte las excepciones en `FailureResult`.

Ejemplo:

```dart
try {
   ...
} on PermissionDeniedException {
   return FailureResult(PermissionDeniedFailure());
}
```

---

## UseCase

Nunca utiliza `try/catch`.

Trabaja únicamente con `Result<T>`.

---

## UI

Nunca captura excepciones del dominio.

Siempre maneja:

```dart
switch(result) {
  case SuccessResult():
  case FailureResult():
}
```

---

# Dart

## sealed class

Se utiliza cuando la jerarquía debe ser cerrada.

Ejemplo:

```dart
sealed class Result<T>
```

---

## final class

Se utiliza para todas las implementaciones concretas.

Ejemplo:

```dart
final class Song

final class Playlist

final class SuccessResult
```

---

# Convenciones de nombres

## Nombres de archivos

Cada archivo debe incluir explícitamente en su nombre (en `snake_case`) el tipo o rol arquitectónico al que pertenece:

- **Use Cases**: `nombre_use_case.dart` (ejemplo: `synchronize_library_use_case.dart`)
- **Repositories**: `nombre_repository.dart` (ejemplo: `library_repository.dart`)
- **Value Objects**: `nombre_value_object.dart` (ejemplo: `synchronization_result_value_object.dart`)
- **Services**: `nombre_service.dart` (ejemplo: `library_synchronizer_service.dart`)
- **Data Sources**: `nombre_data_source.dart` (ejemplo: `audio_file_data_source.dart`)

---

## Repositories

Representan sustantivos.

✔ Correcto

- LibraryRepository
- PlaylistRepository

✘ Incorrecto

- ScanRepository
- GetSongsRepository

---

## UseCases

Representan acciones.

Ejemplos:

- SynchronizeLibraryUseCase
- SearchSongsUseCase
- GetLibrarySongsUseCase

---

# Principio más importante

Los **UseCases contienen la inteligencia del negocio**.

Los **Repositories ejecutan operaciones específicas**.

Mientras más simples sean los repositories y más inteligentes los casos de uso, más mantenible será la arquitectura.