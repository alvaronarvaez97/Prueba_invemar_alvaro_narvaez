const express = require('express');

const app = express();

app.set('port', process.env.PORT || 9003);

app.listen(app.get('port'), ()=>{
    console.log('El servidor esta desplegado en el puerto ', app.get('port'));
  });