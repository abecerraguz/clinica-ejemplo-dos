import express from 'express';
import vistaHome from '../controller/vistasHome.js'
const router = express.Router();

router.get('/', vistaHome )

export default router;