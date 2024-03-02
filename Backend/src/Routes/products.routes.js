import { Router } from "express";
import { getProducts, getProductsById, createProduct, updateProduct, deleteProduct } from "../controllers/product.controller.js";
const router = Router();

router.get("/productos", getProducts);
router.get("/productos/:id", getProductsById);
router.post("/productos", createProduct);
router.put("/productos/:id", updateProduct);
router.delete("/productos/:id", deleteProduct);

export default router;
