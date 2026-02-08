# 🛍️ Inversiones W&M - Catálogo Web

Catálogo web profesional con integración a Supabase para gestión en tiempo real de productos y configuración.

## ✨ Características

- ✅ **Tiempo Real**: Los cambios en el panel admin se reflejan instantáneamente
- ✅ **Panel de Administración**: Gestiona productos, precios, imágenes y redes sociales
- ✅ **Responsive**: Diseño optimizado para móviles y escritorio
- ✅ **Redes Sociales**: Botones de WhatsApp, Instagram y TikTok con mensajes automáticos
- ✅ **Carga de Imágenes**: Sube fotos directamente a Supabase Storage
- ✅ **Diseño Moderno**: Inspirado en tutarjetaroja.com con efectos glassmorphism

## 🚀 Configuración de Supabase

### Paso 1: Crear Proyecto en Supabase

1. Ve a [supabase.com](https://supabase.com) y crea una cuenta
2. Crea un nuevo proyecto
3. Anota tu `Project URL` y `anon public key` (las necesitarás después)

### Paso 2: Configurar la Base de Datos

1. En tu proyecto de Supabase, ve a **SQL Editor**
2. Copia TODO el contenido del archivo `supabase-setup.sql`
3. Pégalo en el editor y haz clic en **Run**
4. Verifica que las tablas `productos` y `configuracion` se crearon correctamente

### Paso 3: Configurar Storage para Imágenes

1. Ve a **Storage** en el panel de Supabase
2. Haz clic en **New bucket**
3. Nombre del bucket: `productos`
4. Marca la opción **Public bucket** ✅
5. Haz clic en **Create bucket**

### Paso 4: Copiar Credenciales

1. Ve a **Settings** → **API** en tu proyecto de Supabase
2. Copia:
   - **Project URL** (ejemplo: `https://xxxxx.supabase.co`)
   - **anon public key** (es una clave larga que empieza con `eyJ...`)

## 💻 Instalación Local

### 1. Clonar e Instalar Dependencias

```bash
# Si descargaste el proyecto, navega a la carpeta
cd inversiones-wm-catalog

# Instalar dependencias
npm install
```

### 2. Configurar Variables de Entorno

Crea un archivo `.env.local` en la raíz del proyecto:

```env
VITE_SUPABASE_URL=https://tu-proyecto.supabase.co
VITE_SUPABASE_ANON_KEY=tu-anon-key-aqui
```

Reemplaza con tus credenciales reales de Supabase.

### 3. Ejecutar en Desarrollo

```bash
npm run dev
```

Abre [http://localhost:3000](http://localhost:3000) en tu navegador.

## 🌐 Despliegue en Vercel

### Opción 1: Deploy desde GitHub (Recomendado)

1. **Sube tu código a GitHub**:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/tu-usuario/inversiones-wm.git
   git push -u origin main
   ```

2. **Conecta con Vercel**:
   - Ve a [vercel.com](https://vercel.com)
   - Haz clic en **Add New** → **Project**
   - Importa tu repositorio de GitHub
   - Vercel detectará automáticamente que es un proyecto Vite

3. **Configurar Variables de Entorno**:
   - En la sección **Environment Variables** agrega:
     - `VITE_SUPABASE_URL` = tu URL de Supabase
     - `VITE_SUPABASE_ANON_KEY` = tu anon key de Supabase
   - Haz clic en **Deploy**

### Opción 2: Deploy Manual

```bash
# Instalar Vercel CLI
npm install -g vercel

# Login en Vercel
vercel login

# Deploy
vercel

# Durante el proceso, ingresa las variables de entorno cuando te las pida
```

### Configurar Variables en Vercel (Después del Deploy)

Si olvidaste configurar las variables:

1. Ve a tu proyecto en [vercel.com](https://vercel.com/dashboard)
2. Settings → Environment Variables
3. Agrega:
   - **Name**: `VITE_SUPABASE_URL` → **Value**: tu URL
   - **Name**: `VITE_SUPABASE_ANON_KEY` → **Value**: tu key
4. Haz clic en **Redeploy** para aplicar los cambios

## 🔐 Panel de Administración

### Acceso

- URL: `https://tu-dominio.vercel.app/admin`
- Contraseña por defecto: `admin123`

**⚠️ IMPORTANTE**: Cambia la contraseña en el archivo `src/pages/Admin.jsx` línea 15:

```javascript
const ADMIN_PASSWORD = 'tu_contraseña_segura_aqui'
```

### Funciones del Panel

#### Tab: Productos
- ➕ Agregar nuevos productos
- 📝 Editar nombre, precio, talle, descripción
- 🖼️ Subir imágenes
- 🗑️ Eliminar productos

#### Tab: Configuración
- 🏪 Cambiar nombre de la tienda
- 🎨 Subir logo
- 📱 Configurar enlaces de redes sociales
- 💬 Personalizar mensajes automáticos

## 📱 Funcionalidad de Redes Sociales

### WhatsApp
- Configura el número con código de país: `+573001234567`
- Los clientes pueden consultar productos directamente
- El mensaje se personaliza automáticamente con el producto

### Instagram
- URL completa: `https://instagram.com/tu_usuario`
- Abre el perfil en una nueva pestaña

### TikTok
- URL completa: `https://tiktok.com/@tu_usuario`
- Abre el perfil en una nueva pestaña

## 🎨 Personalización

### Colores y Fuentes

Edita `tailwind.config.js` y `src/index.css` para cambiar:
- Gradientes de fondo
- Colores de botones
- Fuentes tipográficas
- Animaciones

### Mensajes Automáticos

Se pueden personalizar desde el panel admin en la sección "Configuración".

## 📁 Estructura del Proyecto

```
inversiones-wm-catalog/
├── public/                 # Archivos estáticos
├── src/
│   ├── components/        # Componentes reutilizables
│   │   ├── Header.jsx     # Header con redes sociales
│   │   └── ProductCard.jsx # Tarjeta de producto
│   ├── pages/             # Páginas
│   │   ├── Home.jsx       # Página principal (catálogo)
│   │   └── Admin.jsx      # Panel de administración
│   ├── lib/
│   │   └── supabase.js    # Cliente y helpers de Supabase
│   ├── App.jsx            # Componente principal
│   ├── main.jsx           # Punto de entrada
│   └── index.css          # Estilos globales
├── supabase-setup.sql     # Script SQL para Supabase
├── package.json           # Dependencias
└── README.md              # Este archivo
```

## 🐛 Solución de Problemas

### Las imágenes no se cargan
- Verifica que el bucket `productos` esté configurado como PÚBLICO en Supabase Storage
- Revisa que las URLs de las imágenes sean correctas

### Los cambios no se reflejan en tiempo real
- Verifica que las tablas tengan habilitado Realtime en Supabase
- Ejecuta estos comandos en SQL Editor:
  ```sql
  ALTER PUBLICATION supabase_realtime ADD TABLE productos;
  ALTER PUBLICATION supabase_realtime ADD TABLE configuracion;
  ```

### Error de conexión a Supabase
- Verifica que las variables de entorno estén configuradas correctamente
- Asegúrate de que las credenciales sean las correctas
- En Vercel, verifica que las variables estén en "Environment Variables"

### La contraseña del admin no funciona
- Verifica que hayas cambiado `ADMIN_PASSWORD` en `src/pages/Admin.jsx`
- La contraseña por defecto es `admin123`

## 📞 Soporte

Para dudas o problemas:
1. Revisa la documentación de [Supabase](https://supabase.com/docs)
2. Revisa la documentación de [Vercel](https://vercel.com/docs)
3. Verifica los logs en la consola del navegador (F12)

## 📄 Licencia

Este proyecto está diseñado para uso comercial de Inversiones W&M.

---

**¡Hecho con ❤️ para Inversiones W&M!**
