const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

router.get('/add', isLoggedIn, (req, res) => {

    res.render('empleados/add');
});

router.post('/add', isLoggedIn, async(req, res) => {

    const { name, last_name, job_title, age, email, photo, adress, phone } = req.body;
    const newEmpleado = {
        //id: null,
        name,
        last_name,
        job_title,
        age,
        email,
        photo,
        adress,
        phone

    };
    await pool.query('call insert_newemp(?,?,?,?,?,?,?,?)', [`${newEmpleado.name}`, `${newEmpleado.last_name}`, `${newEmpleado.job_title}`, `${newEmpleado.age}`, `${newEmpleado.email}`, `${newEmpleado.photo}`, `${newEmpleado.adress}`, `${newEmpleado.phone}`]);
    req.flash('success', 'Empleado guardado satisfactoriamente.');
    res.redirect('/empleados');
});


router.get('/', isLoggedIn, async(req, res) => {

    const emp = await pool.query('CALL get_empleados()');
    res.render('empleados/list', { emp: emp[0] });

});

router.get('/edit/empleados/delete/:id', isLoggedIn, async(req, res) => {

    const { id } = req.params;
    await pool.query('CALL delete_empleado(?)', [id]);
    req.flash('success', 'Empleado removido satisfactoriamente.');
    res.redirect('/empleados');
});

router.get('/edit/:id', isLoggedIn, async(req, res) => {

    const { id } = req.params;
    const empleados = await pool.query('CALL call_empleado(?)', [id]);
    res.render('empleados/edit', { empleados: empleados[0][0] });
});

router.post('/edit/:id', isLoggedIn, async(req, res) => {

    const { id } = req.params;
    const { name, last_name, job_title, age, email, photo, adress, phone } = req.body
    const newEmp = {
        id,
        name,
        last_name,
        job_title,
        age,
        email,
        photo,
        adress,
        phone

    };
    await pool.query('CALL edit_empleado(?,?,?,?,?,?,?,?,?)', [`${newEmp.id}`, `${newEmp.name}`, `${newEmp.last_name}`, `${newEmp.job_title}`, `${newEmp.age}`, `${newEmp.email}`, `${newEmp.photo}`, `${newEmp.adress}`, `${newEmp.phone}`]);
    req.flash('success', 'Empleado actualizado satisfactoriamente.');
    res.redirect('/empleados');
});

module.exports = router;