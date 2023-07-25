import express from "express";
import db from '../db/connection.js';
import pacienteRoutes from '../routes/paciente.js';
import expedienteRoutes from '../routes/expediente.js';
import citaRoutes from '../routes/cita.js';
import homeRoutes from '../routes/home.routes.js';
import { create } from 'express-handlebars';
import './Cita.js';

// Creación de variables de entorno
import { fileURLToPath } from 'url'
import { dirname } from "path";

const __filename = fileURLToPath( import.meta.url )
const __dirname = dirname( __filename )

class Server {
    constructor(){
        this.app = express();
        this.port =  process.env.PORT || '8000';

        this.apiPaths = {
            // RUTAS que son para las distintas API del Backend
            pacientes:'/api/pacientes',
            // especialistas:'/api/especialistas',
            expedientes:'/api/expedientes',
            citas:'/api/citas',
            // agendar_citas:'api/agendar_citas'

            // RUTAS que son para front
            root:'/'

        }

        // Vamos a definir e iniciar nuestros metodos
        this.dbConnection();
        this.middlewares();
        this.routes();

    }

    async dbConnection(){
        try {
            // await db.authenticate();
            await db.sync({ force: false });
        } catch (error) {
            throw new Error(error)
        }
    }

    middlewares(){
        this.app.use( express.json() );
        this.app.use( express.static('public'));

        this.app.use('/bootstrapCss', express.static(`${__dirname}/../node_modules/bootstrap/dist/css`) );
        this.app.use('/bootstrapJs', express.static(`${__dirname}/../node_modules/bootstrap/dist/js`) );
        this.app.use('/css', express.static(`${__dirname}/../public/assets/css`) );
    }

    routes(){
        this.app.use( this.apiPaths.pacientes, pacienteRoutes )
        // this.app.use(this.apiPaths.especialistas,  )
        this.app.use( this.apiPaths.expedientes, expedienteRoutes  )
        this.app.use( this.apiPaths.citas, citaRoutes   )
        // this.app.use(this.apiPaths.agendar_citas,  )
        this.app.use(this.apiPaths.root, homeRoutes )
    }

    initHandelbars(){

        this.hbs = create({
            partialsDir:[
                "views/"
            ]
        });

        this.app.engine( "handlebars", this.hbs.engine );
        this.app.set("view engine","handlebars");
    }


    listen(){
        this.app.listen(this.port,()=>{
            console.log(`Servidor corriendo en el puerto ${this.port}`)
        })
    }
}


export default Server;