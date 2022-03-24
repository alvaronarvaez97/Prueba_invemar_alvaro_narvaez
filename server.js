const express = require('express');
const mysql = require('mysql');
const myconn = require('express-myconnection');
const routes = require("./router");
const cors = require('cors')

const app = express();

app.set('port', process.env.PORT || 9003);

app.use(express.json());
//conexion base de datos-------------------
const dbOptions = {
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'password',   
    database: 'db_avistamiento_marino'
}

// middlewares -------------------------------------
app.use(myconn(mysql, dbOptions, 'single'));
app.use(express.json());
app.use(cors());

app.use('/api/resources', routes);

//server
app.listen(app.get('port'), ()=>{
    console.log('El servidor esta desplegado en el puerto ', app.get('port'));
  });