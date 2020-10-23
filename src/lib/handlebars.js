//Función y librería para poder manipular la fecha
const { format } = require('timeago.js');


const helpers = {}; //Constante utilizada por la vista

helpers.timeago = (created_at) => {
    return format(created_at);
};

module.exports = helpers;