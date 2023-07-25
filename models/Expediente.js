import { DataTypes } from "sequelize";
import db from './../db/connection.js';

const Expediente = db.define('expediente',{
    
    pk_idPaciente:{
        type:DataTypes.CHAR(6),
        primaryKey:true,
        allowNull:false,
        validate:{
            pk_idPaciente(value){
                if(!value.match(/^[P]{1}[-]{1}\d{4}$/)){
                    throw new Error('El ID del paciente no coincide con el formato esperado P-0000 ')
                }
            }
        }

    },
    tipoSangre:{
        type:DataTypes.STRING(10),
        allowNull:false,
    },
    tipoAlergia:{
        type:DataTypes.STRING(50),
        allowNull:false,
    },
    padecimientoCro:{
        type:DataTypes.STRING(50),
        allowNull:false,
    },
    fechaCreacion:{
        type:DataTypes.DATE(6),
        allowNull:false,
    }
},
{
    timestamps:false
}
)

export default Expediente;