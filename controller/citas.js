import Cita from '../models/Cita.js';


export const getCitas = async(req,res) =>{
    const citas = await Cita.findAll();
    res.json({proyectos: citas})
}

export const getCita = async (req,res) =>{
    const {id} = req.params
    const citas = await Cita.findByPk(id);
    if(citas){
        res.json(citas)
    }else{
        res.status(404).json({
            msg:`No existe la cita con el id ${id}`
        })
    }
}

export const postCita = async (req,res) => {

   const { body } = req;

   try {
        const existePk_idPaciente = await Cita.findOne({
                where:{
                    pk_idPaciente:body.pk_idPaciente
                }
        })

        if(existePk_idPaciente){
                return res.status(400).json({
                    msg:`Ya existe el id de la cita ${body.pk_idPaciente }`
                })
        }

        const cita = new Cita(body)
        await cita.save();
        res.json(cita)

   } catch (error) {
        res.status(500).json({
            msg:`${error}`
        })
   }
  

}

export const putCita = async (req,res) => {

    const { id } = req.params
    const { body } = req;

    try {
        const cita = await Cita.findByPk(id); 
        if(!cita){
            return res.status(404).json({
                msg:`No existe el proyecto con el id ${id}`
            })
        }
        await cita.update(body);
        res.json(cita)

    } catch (error) {
        res.status(500).json({
            msg:'Se ha producido un error, comuniquese con el administrador'
        })
    }
}

export const deleteCita = async (req,res) =>{
    const { id } = req.params
    
    const cita = await Cita.findByPk(id);

    if(!cita){
        return res.status(404).json({
            msg:`No existe el proyecto con el id ${id}`
        })
    }
    await cita.destroy();
    res.json(cita)
}

// Obtiene todas las tereas de un proyecto
// export async function getProyectoTareas(req,res) {
//     const { id } = req.params;
//     try {

//       const tareas = await Tarea.findAll({
//         attributes: ["id", "proyectoId", "nombre", "estado"],
//         where: { proyectoId: id },
//       });
     
//       if(!tareas){
//         console.log('Mierda', tareas.length)
//         return res.status(404).json({
//             msg:`El proyecto no tiene asignada ninguna tarea`
//         })
//       }else{
//         res.json(tareas);
//       }
    
      
     

//     } catch (e) {
//       return res.status(500).json({ message: e.message });
//     }
//   }