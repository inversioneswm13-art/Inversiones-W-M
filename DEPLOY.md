# 🚀 GUÍA RÁPIDA DE DESPLIEGUE

## ⚡ Pasos Esenciales (5 minutos)

### 1️⃣ SUPABASE (2 minutos)

1. Ve a https://supabase.com y crea cuenta
2. **New Project** → Elige nombre y contraseña
3. Espera a que se cree (1-2 min)
4. **SQL Editor** → Pega el contenido de `supabase-setup.sql` → **Run**
5. **Storage** → **New bucket** → Nombre: `productos` → ✅ Public → Create
6. **Settings** → **API** → Copia:
   - Project URL
   - anon public key

### 2️⃣ VERCEL (3 minutos)

#### Opción A: Desde GitHub (Recomendada)

```bash
# En tu terminal, dentro de la carpeta del proyecto:
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/inversiones-wm.git
git push -u origin main
```

Luego en Vercel:
1. https://vercel.com → **New Project**
2. Importa tu repo de GitHub
3. En **Environment Variables** agrega:
   ```
   VITE_SUPABASE_URL = [tu-url-de-supabase]
   VITE_SUPABASE_ANON_KEY = [tu-anon-key]
   ```
4. **Deploy**

#### Opción B: Deploy Directo

```bash
# Instalar Vercel CLI
npm install -g vercel

# Deploy
vercel

# Cuando pregunte por environment variables:
# VITE_SUPABASE_URL? → pega tu URL
# VITE_SUPABASE_ANON_KEY? → pega tu key
```

### 3️⃣ CONFIGURACIÓN INICIAL

1. Abre tu sitio: `https://tu-proyecto.vercel.app`
2. Ve al panel admin: `https://tu-proyecto.vercel.app/admin`
3. Login con: `admin123` (cámbiala después)
4. Configura:
   - Nombre de la tienda
   - Logo
   - Enlaces de redes sociales
   - WhatsApp (formato: +573001234567)
5. Agrega tus primeros productos

## 🔧 Cambiar Contraseña del Admin

Edita `src/pages/Admin.jsx` línea 15:

```javascript
const ADMIN_PASSWORD = 'tu_nueva_contraseña_segura'
```

Luego haz commit y push (si usas GitHub) o redeploy en Vercel.

## ✅ Checklist Final

- [ ] Base de datos creada en Supabase
- [ ] Bucket 'productos' creado y público
- [ ] Variables de entorno configuradas en Vercel
- [ ] Sitio desplegado y funcionando
- [ ] Panel admin accesible
- [ ] Contraseña cambiada
- [ ] Logo y configuración personalizada
- [ ] Primer producto agregado

## 🆘 Problemas Comunes

**"Cannot read properties of null"**
→ Verifica que las variables de entorno estén en Vercel

**Imágenes no cargan**
→ El bucket debe ser PÚBLICO en Supabase Storage

**No se reflejan cambios en tiempo real**
→ Ejecuta en Supabase SQL Editor:
```sql
ALTER PUBLICATION supabase_realtime ADD TABLE productos;
ALTER PUBLICATION supabase_realtime ADD TABLE configuracion;
```

---

## 🎉 ¡Listo!

Tu catálogo está en línea en:
- **Frontend**: https://tu-proyecto.vercel.app
- **Admin**: https://tu-proyecto.vercel.app/admin

**Comparte el link con tus clientes y empieza a vender! 🚀**
