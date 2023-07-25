import express from 'express';

import {
    getCitas,
    getCita,
    postCita,
    putCita,
    deleteCita
} from '../controller/citas.js';

const router = express.Router();

router.get( '/', getCitas );
router.get( '/:id', getCita );
router.post( '/', postCita );
router.put( '/:id', putCita );
router.delete( '/:id', deleteCita );

export default router;