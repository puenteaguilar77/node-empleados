require('./config/config');
const express = require('express');
const morgan = require('morgan');
const path = require('path');
const exphbs = require('express-handlebars');
const flash = require('connect-flash');
const session = require('express-session');
const MySQLStore = require('express-mysql-session');
const passport = require('passport');
const bodyParser = require('body-parser');


const { database } = require('./keys');



//Inicializaciones
const app = express();
require('./lib/passport');

//Configuraciones
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views')); //une las rutas de las direcciones
app.engine('.hbs', exphbs({
    defaultLayout: 'main',
    layoutsDir: path.join(app.get('views'), 'layouts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars')
}));
app.set('view engine', '.hbs'); //utilizando el motor

//Middlewares
app.use(session({
    secret: 'usesqlsession',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));
app.use(flash()); //para poder utilizar los mensajes en el front end
app.use(morgan('dev'));
app.use(bodyParser.urlencoded({ extended: true })); //Solo se reciben textos
app.use(bodyParser.json()); //para que pueda recibir objetos
app.use(passport.initialize()); //Inicializa el módulo de Passport
app.use(passport.session());

//Variables Globales
app.use((req, res, next) => {
    app.locals.success = req.flash('success')
    app.locals.success = req.flash('message')
    app.locals.user = req.user;
    next(); //Toma la inf. del ususario y sigue con el resto del código
});


//Routes
app.use(require('./routes/'));
app.use(require('./routes/authentication'));
app.use('/empleados', require('./routes/empleados')); //se usa el prefijo empleados

//Public
app.use(express.static(path.join(__dirname, 'public')));

//Inicializar el servidor
app.listen(process.env.PORT, () => {
    console.log('Server on port', app.get('port'));
});