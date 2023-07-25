import { DataTypes } from "sequelize";
import db from '../db/connection.js';

const Cita = db.define('cita',{
    pk_idCita:{
        type:DataTypes.CHAR(7),
        primaryKey:true,
        allowNull:false,
        validate:{
            pk_idCita(value){
                if(!value.match(/^[CM]{2}[-]{1}\d{4}$/)){
                    throw new Error('El ID de la Cita no coincide con el formato esperado')
                }
            }
        }
    },
    fecha:{
        type:DataTypes.DATE,
        allowNull:false,
    },
    hora:{
        type:DataTypes.TIME,
        allowNull:false,
    }
},{
    timestamps:false
})

export default Cita;