import Expediente from '../models/Expediente.js';



export const getExpedientes = async(req,res) =>{
    const expedientes = await Expediente.findAll();
    res.json({proyectos: expedientes})
}

export const getExpediente = async (req,res) =>{
    const {id} = req.params
    const expedientes = await Expediente.findByPk(id);
    if(expedientes){
        res.json(expedientes)
    }else{
        res.status(404).json({
            msg:`No existe el expediente con el id ${id}`
        })
    }
}

export const postExpediente = async (req,res) => {

   const { body } = req;

   try {
        const existePk_idPaciente = await Expediente.findOne({
                where:{
                    pk_idPaciente:body.pk_idPaciente
                }
        })

        if(existePk_idPaciente){
                return res.status(400).json({
                    msg:`Ya existe el id del expediente ${body.pk_idPaciente }`
                })
        }

        const expediente = new Expediente(body)
        await expediente.save();
        res.json(expediente)

   } catch (error) {
        res.status(500).json({
            msg:`${error}`
        })
   }
  

}

export const putExpediente = async (req,res) => {

    const { id } = req.params
    const { body } = req;

    try {
        const expediente = await Expediente.findByPk(id); 
        if(!expediente){
            return res.status(404).json({
                msg:`No existe el expediente con el id ${id}`
            })
        }
        await expediente.update(body);
        res.json(expediente)

    } catch (error) {
        res.status(500).json({
            msg:'Se ha producido un error, comuniquese con el administrador'
        })
    }
}

export const deleteExpediente = async (req,res) =>{
    const { id } = req.params
    
    const expediente = await Expediente.findByPk(id);

    if(!expediente){
        return res.status(404).json({
            msg:`No existe el expediente con el id ${id}`
        })
    }
    await expediente.destroy();
    res.json(expediente)
}

