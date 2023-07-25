import express from 'express';
import {
    getExpedientes,
    getExpediente,
    postExpediente,
    putExpediente,
    deleteExpediente
} from '../controller/expedientes.js';

const router = express.Router();

router.get( '/', getExpedientes );
router.get( '/:id', getExpediente);
router.post( '/', postExpediente );
router.put( '/:id', putExpediente );
router.delete( '/:id', deleteExpediente );

export default router;
