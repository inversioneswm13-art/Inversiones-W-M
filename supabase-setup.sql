-- ============================================
-- SCRIPT SQL PARA SUPABASE - INVERSIONES W&M
-- ============================================
-- Ejecuta este script en el SQL Editor de Supabase

-- 1. CREAR TABLA DE PRODUCTOS
CREATE TABLE IF NOT EXISTS productos (
  id BIGSERIAL PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  imagen_url TEXT,
  talle VARCHAR(50),
  descripcion TEXT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. CREAR TABLA DE CONFIGURACIÓN
CREATE TABLE IF NOT EXISTS configuracion (
  id INTEGER PRIMARY KEY DEFAULT 1,
  nombre_tienda VARCHAR(255) DEFAULT 'Inversiones W&M',
  logo_url TEXT,
  color_primario VARCHAR(7) DEFAULT '#f59e0b',
  color_secundario VARCHAR(7) DEFAULT '#0f0c29',
  link_ig TEXT,
  link_wa TEXT,
  link_tk TEXT,
  msj_wa TEXT DEFAULT 'Hola! Me gustaría tener más información',
  msj_ig TEXT DEFAULT 'Hola! Me interesa conocer más sobre sus productos',
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  CONSTRAINT single_config CHECK (id = 1)
);

-- 3. INSERTAR CONFIGURACIÓN INICIAL
INSERT INTO configuracion (id, nombre_tienda, msj_wa, msj_ig)
VALUES (
  1,
  'Inversiones W&M',
  'Hola! Me gustaría tener más información',
  'Hola! Me interesa conocer más sobre sus productos'
) ON CONFLICT (id) DO NOTHING;

-- 4. INSERTAR PRODUCTOS DE EJEMPLO (OPCIONAL)
INSERT INTO productos (nombre, precio, talle, descripcion, imagen_url)
VALUES 
  (
    'Camisa Deportiva Pro',
    89.99,
    'M, L, XL',
    'Camisa deportiva de alta calidad, ideal para entrenamientos y competencias.',
    'https://via.placeholder.com/400x400/f59e0b/ffffff?text=Camisa+Pro'
  ),
  (
    'Jersey Clásico',
    79.99,
    'S, M, L',
    'Jersey clásico con diseño elegante y materiales premium.',
    'https://via.placeholder.com/400x400/0f0c29/ffffff?text=Jersey+Clasico'
  ),
  (
    'Polo Premium',
    99.99,
    'M, L, XL, XXL',
    'Polo premium con acabados de lujo para uso casual o formal.',
    'https://via.placeholder.com/400x400/302b63/ffffff?text=Polo+Premium'
  )
ON CONFLICT DO NOTHING;

-- 5. HABILITAR REALTIME PARA AMBAS TABLAS
-- Esto permite que los cambios se reflejen instantáneamente
ALTER PUBLICATION supabase_realtime ADD TABLE productos;
ALTER PUBLICATION supabase_realtime ADD TABLE configuracion;

-- 6. CREAR POLÍTICAS DE SEGURIDAD (RLS)
-- Permitir lectura pública
ALTER TABLE productos ENABLE ROW LEVEL SECURITY;
ALTER TABLE configuracion ENABLE ROW LEVEL SECURITY;

-- Política para permitir SELECT a todos (lectura pública)
CREATE POLICY "Permitir lectura pública de productos"
  ON productos FOR SELECT
  TO public
  USING (true);

CREATE POLICY "Permitir lectura pública de configuración"
  ON configuracion FOR SELECT
  TO public
  USING (true);

-- Política para permitir INSERT, UPDATE, DELETE a todos (para simplificar)
-- IMPORTANTE: En producción, deberías proteger esto con autenticación
CREATE POLICY "Permitir todas las operaciones en productos"
  ON productos FOR ALL
  TO public
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Permitir todas las operaciones en configuración"
  ON configuracion FOR ALL
  TO public
  USING (true)
  WITH CHECK (true);

-- 7. CREAR BUCKET PARA ALMACENAR IMÁGENES
-- Este paso se hace desde la interfaz de Supabase en Storage
-- Nombre del bucket: 'productos'
-- Configuración: Público (para que las imágenes sean accesibles)

-- ============================================
-- NOTAS IMPORTANTES:
-- ============================================
-- 1. Después de ejecutar este script, ve a Storage en Supabase
-- 2. Crea un bucket llamado 'productos'
-- 3. Configúralo como PÚBLICO para que las URLs funcionen
-- 4. Copia las credenciales VITE_SUPABASE_URL y VITE_SUPABASE_ANON_KEY
-- 5. Pégalas en tu archivo .env.local o en Vercel
-- ============================================
