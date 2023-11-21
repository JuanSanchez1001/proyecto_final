const express = require('express')
const mysql = require('mysql')
const bodyParser = require('body-parser')

const app = express()
const cors = require('cors');

app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());

app.use(cors());

app.use(function(req, res, next)
{
    res.setHeader('Access-Control-Allow-Origin', '*')
    res.setHeader('Access-Control-Allow-Methods', '*')
    next()
})

app.use(bodyParser.json())

const PUERTO = 3000

const conexion = mysql.createConnection(
    {
        host:'localhost',
        database:'cafetec',
        user:'root',
        password:''
    }
)

app.listen(PUERTO, () => {
    console.log(`Servidor OK -- Puerto: ${PUERTO}`)
})

conexion.connect(error => {
    if(error) throw error
    console.log('Conexion Exitosa');
})

app.get('/', (req, res) => {
    res.send('API')
})
//API's para el funcionamiento
app.get('/productos', (req, res) => {
    const query = 'SELECT * FROM productos'
    conexion.query(query, (error, resultado) => {
        if(error) return console.error(error.message)

        if(resultado.length > 0){
            res.json(resultado)

        } else{
            res.json('No hay registros')
        }
    })
})
app.post('/carrito/comprar', (req, res) => {
    const lista = {
        nombre_producto: req.body.nombre_producto,
        local: req.body.local,
        cantidad: req.body.cantidad,
        precio: req.body.precio,
        total: req.body.cantidad*req.body.precio,
        email: req.body.email,
    }

    
    const query = `INSERT INTO pedidos SET ?`
    conexion.query(query, lista, (error, resultado) => {
        if(error) return console.error(error.message)

        res.json(`Se realizo la compra`)
    })

})
app.get('/pedidos', (req, res) => {
    const query = 'SELECT * FROM pedidos'
    conexion.query(query, (error, resultado) => {
        if(error) return console.error(error.message)

        if(resultado.length > 0){
            res.json(resultado)

        } else{
            res.json('No hay registros')
        }
    })
})

//API's de login
const jwt = require('jsonwebtoken');

app.get('/', (req,res)=>{
  conexion.query('select * from usuarios', (err,rows,fields) => {
    if(!err){
      res.json(rows);
    }else{
      console.log(err);
    }
  })
});

app.post('/singin', (req,res) => {
  const { usuario, password } = req.body;
  conexion.query('select no_control,rol from usuarios where no_control=? and password=?',
  [usuario,password],
  (err,rows,fields) => {
    if(!err){
      if(rows.length >0){
        let data = JSON.stringify(rows[0]);
        const token = jwt.sign(data, 'villegas');
        res.json({token});
      }else{
        res.json('Usuario o clave incorrectos');
      }
      
    }else{
      console.log(err);
    }
  }
  )  
})

app.post('/test',verifyToken, (req,res) => {
  res.json('Informacion secreta');
})

function verifyToken(req,res, next){
  if(!req.headers.authorization) return res.status(401).json('No autorizado');

  const token = req.headers.authorization.substr(7);
  if(token!==''){
    const content = jwt.verify(token,'stil');
    req.data = content;
    next();
  }else{
    res.status(401).json('Token vacio');
  }

}