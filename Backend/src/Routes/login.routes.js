import { Router } from 'express';
const router = Router();

import { getUsers } from '../controllers/product.controller.js';

router.get("/users", getUsers);

export default router;