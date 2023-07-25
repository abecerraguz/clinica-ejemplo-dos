import Paciente from '../models/Paciente.js';

export const getPacientes = async(req,res)=>{
    const pacientes = await Paciente.findAll(); // SELECT * FROM usuarios;
    res.json({pacientes:pacientes})
}

export const getPaciente = async ( req,res ) => {
    const { id } = req.params
    const paciente = await Paciente.findByPk( id )

    if(paciente){
        res.json(paciente)
    }else{
        res.status(404).json({
            msg:`No existe el paciente con el id ${id}`
        })
    }
}

export const postPaciente = async (req,res) => {

    const { body } = req;
 
    try {
         const existePk_idPaciente = await Paciente.findOne({
                 where:{
                     pk_idPaciente:body.pk_idPaciente
                 }
         })
 
         if(existePk_idPaciente){
                 return res.status(400).json({
                     msg:`Ya existe el id del paciente ${body.pk_idPaciente }`
                 })
         }
 
         const paciente = new Paciente(body)
         await paciente.save();
         res.json(paciente)
 
    } catch (error) {
         res.status(500).json({
             msg:`${error}`
         })
    }
   
 
}

export const putPaciente = async (req,res) => {

    const { id } = req.params;
    const { body } = req

    try {
        const paciente = await Paciente.findByPk( id )
        if(!paciente){
            return res.status(404).json({
                msg:`No existe el paciente con el id ${id}`
            })
        }
        await paciente.update(body)
        res.json(paciente)
    } catch (error) {
        res.status(500).json({
            msg:`Se ha producido un error!`
        })
    }
}

export const deletePaciente = async (req,res) => {
    const { id } = req.params;
    const paciente = await Paciente.findByPk(id)
    if(!paciente){
        return res.status(404).json({
            msg:`No existe el paciente con el id ${id}`
        })
    }
    await paciente.destroy()
    res.json(paciente)
}

