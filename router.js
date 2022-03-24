const express = require('express');
const routes = express.Router();



//consulta de avisamiento por especie 
routes.get('/consulta', (req, res)=>{
    req.getConnection((err, conn)=>{
        if (err) return res.send(err);

        conn.query('select  * from tabla_especie_marina inner join categoria_toxinica on categoria_toxinica.id_categoria_toxinica = tabla_especie_marina.id_categoria_toxinica inner join tabla_avistamiento ta on ta.id_tabla_avistamiento = tabla_especie_marina.id_tabla_avistamiento inner join tabla_lugares tl on tl.id_tabla_lugares = tabla_especie_marina.id_tabla_lugares where categoria_toxinica.especie =?', [req.body.especie], (err, rows)=>{
            if(err) return res.send(err);

            res.json(rows);
        })
    })
});


//listar tabla lugares avistamientos
routes.get('/lugares', (req, res)=>{
    req.getConnection((err, conn)=>{
        if (err) return res.send(err);

        conn.query('SELECT * FROM tabla_lugares', (err, rows)=>{
            if(err) return res.send(err);

            res.json(rows);
        })
    })
});
// agregar lugares 
routes.post('/lugar/add', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('INSERT INTO tabla_lugares set ?', [req.body],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user add!');
        })
    })
})
//actualizar datos de lugar
routes.put('/lugar/update/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('UPDATE tabla_lugares set? WHERE id_tabla_lugares=?', [req.body ,req.params.id],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user Updatate!');
        })
    })
})
//elimunar lugar 
routes.delete('/lugar/delete/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('DELETE FROM  tabla_lugares WHERE id_tabla_lugares=?', [req.params.id],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user excluded!');
        })
    })
})

//--------------------------------------------------------

//listar tabla especies marinas
routes.get('/especies', (req, res)=>{
    req.getConnection((err, conn)=>{
        if (err) return res.send(err);

        conn.query('SELECT * FROM tabla_especie_marina', (err, rows)=>{
            if(err) return res.send(err);

            res.json(rows);
        })
    })
});
// agregar especie 
routes.post('/especies/add', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('INSERT INTO tabla_especie_marina set ?', [req.body],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user add!');
        })
    })
})
//actualizar datos de especie
routes.put('/especies/update/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('UPDATE tabla_especie_marina set? WHERE id_tabla_especie_marina=?', [req.body ,req.params.id],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user Updatate!');
        })
    })
})
//elimunar especie 
routes.delete('/especies/delete/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('DELETE FROM  tabla_especie_marina WHERE id_tabla_especie_marina=?', [req.params.id],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user excluded!');
        })
    })
})

//----------------------------------------------------------

//listar tabla de avistamiento
routes.get('/avistamiento', (req, res)=>{
    req.getConnection((err, conn)=>{
        if (err) return res.send(err);

        conn.query('SELECT * FROM tabla_avistamiento', (err, rows)=>{
            if(err) return res.send(err);

            res.json(rows);
        })
    })
});
// agregar avistameinto 
routes.post('/avistamiento/add', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('INSERT INTO tabla_avistamiento set ?', [req.body],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user add!');
        })
    })
})
//actualizar datos de avistameineto
routes.put('/avistamiento/update/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('UPDATE tabla_avistamiento set? WHERE id_tabla_avistamiento=?', [req.body ,req.params.id],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user Updatate!');
        })
    })
})
//elimunar avistamiento
routes.delete('/avistamiento/delete/:id', (req, res)=>{
    req.getConnection((err, conn)=>{
        if(err) return res.send(err);
        conn.query('DELETE FROM  tabla_avistamiento WHERE id_tabla_avistamiento=?', [req.params.id],(req, rows)=>{
            if (err) return res.send(err);

            res.send('user excluded!');
        })
    })
})

module.exports = routes;