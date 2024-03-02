 -- CREATE DATABASE muebleriaEcommerce; Descomenta para crear la Base de Datos.

-- Crear la tabla Usuarios
CREATE TABLE IF NOT EXISTS Usuarios(
    usuario_id SERIAL PRIMARY KEY, -- Identificador único del usuario
    nombre VARCHAR(100) NOT NULL, -- Nombre del usuario
    email VARCHAR(100) UNIQUE NOT NULL, -- Correo electrónico del usuario (debe ser único)
    contraseña VARCHAR(100) NOT NULL, -- Contraseña del usuario
    direccion VARCHAR(255), -- Dirección del usuario
    ciudad VARCHAR(100), -- Ciudad del usuario
    codigo_postal VARCHAR(20), -- Código postal del usuario
    pais VARCHAR(100), -- País del usuario
    numero_celular VARCHAR(20), -- Número de celular del usuario
    es_admin BOOLEAN DEFAULT FALSE -- Indica si el usuario es administrador
);

-- Crear la tabla Categorias
CREATE TABLE IF NOT EXISTS Categorias (
    categoria_id SERIAL PRIMARY KEY, -- Identificador único de la categoría
    nombre VARCHAR(100) NOT NULL -- Nombre de la categoría
);

-- Crear la tabla Productos
CREATE TABLE IF NOT EXISTS Productos (
    producto_id SERIAL PRIMARY KEY, -- Identificador único del producto
    nombre VARCHAR(255) NOT NULL, -- Nombre del producto
    descripcion TEXT, -- Descripción del producto
    precio NUMERIC(10, 2) NOT NULL, -- Precio del producto
    stock INT NOT NULL, -- Stock del producto
    imagen_url VARCHAR(255) -- URL de la imagen del producto
);

-- Crear la tabla ProductoCategorias
CREATE TABLE IF NOT EXISTS ProductoCategorias(
    producto_id INT REFERENCES Productos(producto_id) ON DELETE CASCADE, -- Clave foránea hacia la tabla de Productos
    categoria_id INT REFERENCES Categorias(categoria_id) ON DELETE CASCADE, -- Clave foránea hacia la tabla de Categorías
    PRIMARY KEY (producto_id, categoria_id)); -- Clave primaria compuesta

-- Crear la tabla Carrito
CREATE TABLE IF NOT EXISTS Carrito (
    carrito_id SERIAL PRIMARY KEY, -- Identificador único del elemento en el carrito
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE, -- Clave foránea hacia la tabla de Usuarios
    producto_id INT REFERENCES Productos(producto_id) ON DELETE CASCADE, -- Clave foránea hacia la tabla de Productos
    cantidad INT NOT NULL, -- Cantidad del producto en el carrito
    UNIQUE (usuario_id, producto_id) -- Restricción de unicidad para evitar duplicados
);

-- Crear la tabla Ordenes
CREATE TABLE IF NOT EXISTS Ordenes (
    orden_id SERIAL PRIMARY KEY, -- Identificador único de la orden
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE, -- Clave foránea hacia la tabla de Usuarios
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación de la orden
    total NUMERIC(10, 2) NOT NULL -- Total de la orden
);

-- Crear la tabla DetalleOrden
CREATE TABLE IF NOT EXISTS DetalleOrden (
    detalle_id SERIAL PRIMARY KEY, -- Identificador único del detalle de la orden
    orden_id INT REFERENCES Ordenes(orden_id) ON DELETE CASCADE, -- Clave foránea hacia la tabla de Ordenes
    producto_id INT REFERENCES Productos(producto_id) ON DELETE CASCADE, -- Clave foránea hacia la tabla de Productos
    cantidad INT NOT NULL, -- Cantidad del producto en la orden
    precio_unitario NUMERIC(10, 2) NOT NULL, -- Precio unitario del producto en la orden
    subtotal NUMERIC(10, 2) NOT NULL -- Subtotal del producto en la orden
);



CREATE TABLE IF NOT EXISTS "Productos"("id" INTEGER NOT NULL , "nombre" VARCHAR(255) NOT NULL, 
"descripcion" TEXT, "precio" FLOAT NOT NULL, "stock" BIGINT NOT NULL, "imagen_url" VARCHAR(255), 
"createdAt" TIMESTAMP WITH TIME ZONE NOT NULL, "updatedAt" TIMESTAMP WITH TIME ZONE NOT NULL, 
PRIMARY KEY ("id"));
Executing (default): SELECT i.relname AS name, ix.indisprimary AS primary, ix.indisunique AS unique, ix.indkey AS indkey, array_agg(a.attnum) as column_indexes, array_agg(a.attname) AS column_names, pg_get_indexdef(ix.indexrelid) AS definition FROM pg_class t, pg_class i, pg_index ix, 
pg_attribute a WHERE t.oid = ix.indrelid AND i.oid = ix.indexrelid AND a.attrelid = t.oid AND t.relkind = 'r' and t.relname = 'Productos' GROUP BY i.relname, ix.indexrelid, ix.indisprimary, ix.indisunique, ix.indkey ORDER BY i.relname