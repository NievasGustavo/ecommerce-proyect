import { Router } from 'express';
const router = Router();

import { getUsers } from '../controllers/logins.controller.js';

router.get("/users", getUsers);

export default router;