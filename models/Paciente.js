import { DataTypes } from "sequelize";
import db from '../db/connection.js';
import Expediente from "./Expediente.js";
import Cita from "./Cita.js";


const Paciente = db.define('paciente', {

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
    nombre:{
        type:DataTypes.STRING(20),
        allowNull:false,
    },
    apellido:{
        type:DataTypes.STRING(20),
        allowNull:false,
    },
    sexo:{
        type:DataTypes.CHAR(1),
        allowNull:false,
    },
    fechaNacimiento:{
        type:DataTypes.DATE,
        allowNull:false,
    },
    ciudad:{
        type:DataTypes.STRING(20),
        allowNull:false,
    },
    estado:{
        type:DataTypes.STRING(20),
        allowNull:false,
    },
    telefono:{
        type:DataTypes.CHAR(10),
        unique:true
    },
},
{
    timestamps:false
}
)

export default Paciente;

// RELACION UNO ES A UNO ENTRE PACIENTE Y EXPEDIENTE
Paciente.hasOne( Expediente ,{
    foreignKey:'pk_idPaciente',
    as:'expediente',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})

Expediente.belongsTo(Paciente,{
    foreignKey:'pk_idPaciente'
})

// RELACION ENTRE PACIENTE Y CITA RELACION 1 ES A MUCHOS
Paciente.hasMany( Cita,{
    foreignKey:'fk_idPaciente',
    as:'cita',
    onDelete: 'CASCADE',
    onUpdate: 'CASCADE'
})