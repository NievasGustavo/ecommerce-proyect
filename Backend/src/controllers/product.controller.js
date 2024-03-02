import { Producto } from "../Schemas/productSchema.js";

export const getProducts = async (req, res, next) => {
  try {
    const products = await Producto.findAll();
    res.json(products);
  } catch (error) {
    next(error);
  }
};

export const getProductsById = async (req, res) => {
  res.send("products");
};

export const createProduct = async (req, res) => {
  const { nombre, descripcion, precio, stock, imagen_url } = req.body;

  const newProducto = await Producto.create({
    nombre,
    descripcion,
    precio,
    stock,
    imagen_url,
  });
  res.json(newProducto);
};

export const updateProduct = async (req, res) => {
  res.send("editing products");
};

export const deleteProduct = async (req, res) => {
  res.send("deleting products");
};
