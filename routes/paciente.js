import express from "express";
import {
    getPacientes ,
    getPaciente,
    postPaciente,
    putPaciente,
    deletePaciente
} from '../controller/pacientes.js'
const router = express.Router();
// Router()
/*

    GET
    POST
    PUT
    DELETE

*/

// La raiz '/' es igual a decir ---> '/api/pacientes/P-0010'
router.get( '/', getPacientes );
router.get( '/:id', getPaciente );
router.post( '/', postPaciente );
router.put( '/:id', putPaciente );
router.delete( '/:id', deletePaciente );

export default router;
