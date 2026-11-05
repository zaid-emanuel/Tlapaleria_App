# Tlapalería App 🛠️

Aplicación móvil desarrollada con Flutter para la consulta y compra simulada de productos de una tlapalería. Este proyecto corresponde a la **Etapa 1 (MVP)** del proyecto final.

## 📱 Descripción del proyecto

Tlapalería App busca facilitar la consulta de productos de ferretería y tlapalería mediante una aplicación móvil sencilla e intuitiva.

Permite visualizar un catálogo, buscar productos, filtrarlos por categoría, consultar sus características, agregarlos a un carrito y simular una compra.

El proyecto utiliza una arquitectura organizada que permitirá incorporar Firebase y otras funcionalidades en la siguiente etapa.

## 🎯 Ruta seleccionada

**Ruta A: Cliente real.**

El desarrollo se orienta a las necesidades de un cliente real. Los requisitos específicos y la validación del MVP se documentarán mediante las reuniones y evidencias correspondientes.

## 👥 Integrantes del equipo

| Integrante | Rol |
|---|---|
| Leyver Aaron Gonzalez Mendoza | Coordinación, Git y documentación |
| Zaid Emanuel Hernandez Espinosa | UI/UX y diseño |
| Benjamin Alberto Arce Hernadez | Arquitectura, datos y navegación |

## ✨ Funcionalidades del MVP

- Pantalla de bienvenida (SplashScreen).
- Pantalla principal (HomeScreen).
- Catálogo de productos.
- Búsqueda de productos.
- Filtros por categoría.
- Visualización del detalle de cada producto.
- Agregar productos al carrito.
- Modificar cantidades y eliminar productos.
- Cálculo del total de compra.
- Simulación del proceso de compra.

## 🏗️ Arquitectura del proyecto

El proyecto utiliza una organización por funcionalidades para separar la interfaz, los datos y la lógica de la aplicación.

```text
lib/
├── core/
│   ├── theme/
│   └── widgets/
├── data/
│   ├── local/
│   └── repositories/
├── features/
│   ├── splash/
│   ├── home/
│   ├── catalog/
│   ├── product_detail/
│   └── cart/
├── models/
└── main.dart
```

### Componentes principales

- **Product:** modelo de datos de los productos.
- **ProductRepository:** encargado de proporcionar los datos del catálogo.
- **CartProvider:** administra el estado del carrito mediante Provider.
- **AppTheme:** centraliza los estilos visuales de la aplicación.
- **ProductCard:** componente reutilizable para mostrar productos.
- **CustomButton:** componente reutilizable para botones.

## 💻 Tecnologías utilizadas

- Flutter 3.x
- Dart
- Provider 6.1.5+1
- Git
- GitHub

## ⚙️ Instalación y ejecución

### Requisitos previos

- Tener Flutter instalado.
- Contar con Android Studio o Visual Studio Code.
- Disponer de un emulador Android o dispositivo físico.

### 1. Clonar el repositorio

```bash
git clone https://github.com/zaid-emanuel/Tlapaleria_App.git
```

### 2. Entrar a la carpeta del proyecto

```bash
cd Tlapaleria_App
```

### 3. Instalar dependencias

```bash
flutter pub get
```

### 4. Ejecutar la aplicación

```bash
flutter run
```

## 📸 Capturas de pantalla

En este apartado se agregarán capturas reales de las principales pantallas de la aplicación:

| Pantalla | Evidencia |
|---|---|
| SplashScreen | Pendiente |
| HomeScreen | Pendiente |
| Catálogo | Pendiente |
| Detalle del producto | Pendiente |
| Carrito de compras | Pendiente |

## 🧠 Decisiones técnicas

- **Provider:** permite administrar el estado compartido del carrito.
- **Repository Pattern:** separa el acceso a los datos de la interfaz y facilita una futura integración con Firebase.
- **Feature-first:** organiza el código por funcionalidades.
- **Componentes reutilizables:** permiten mantener consistencia en el diseño y reducir la duplicación de código.

## 🚀 Backlog de la Etapa 2

### Backend y autenticación
- Integración con Firebase Authentication.
- Persistencia de sesión.

### Administración de datos
- Integración con Cloud Firestore.
- Almacenamiento de productos y carritos por usuario.
- CRUD de productos para administradores.
- Registro y consulta de órdenes de compra.

### Experiencia de usuario
- Validaciones de formularios.
- Notificaciones.
- Mejoras de interacción.

### Despliegue
- Generación y validación de APK firmado.

## 🤖 Registro de uso de inteligencia artificial

El uso de herramientas de inteligencia artificial se documentará en el archivo `AI_LOG.md`, incluyendo las consultas realizadas, su propósito y la forma en que se utilizaron en el desarrollo del proyecto.

## 📂 Repositorio

[GitHub - Tlapaleria App](https://github.com/zaid-emanuel/Tlapaleria_App)

## 📧 Contacto

**Leyver Aaron Gonzalez Mendoza**
- Correo: gonzalezleyver6@gmail.com
- LinkedIn: [Perfil de LinkedIn](https://www.linkedin.com/in/leyver-aaron-gonzalez-mendoza-7026a73a8/)

**Benjamin Alberto Arce Hernadez**
- Correo: 233111887@upmh.edu.mx

**Zaid Emanuel Hernandez Espinosa**
- Correo: 233111046@upmh.edu.mx

---

**Proyecto Final Flutter — Etapa 1**
