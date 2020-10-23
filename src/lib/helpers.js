const bcrypt = require('bcryptjs');
const helpers = {};

//Métodos que sirven para realizar el cifrado de la contraseña de los usuarios

//Método para encriptar contraseñas
helpers.encryptPassword = async(password) => {
    const salt = await bcrypt.genSalt(10); //Genera un salt 10 veces
    const hash = await bcrypt.hash(password, salt); //Se toma el salt creado y se encripta
    return hash;
};

//Método para comparar contraseña
helpers.matchPassword = async(password, savedPassword) => {
    try {
        return await bcrypt.compare(password, savedPassword); //compara dos cadenas de texto
    } catch (e) {
        console.log(e)
    }
};

module.exports = helpers;