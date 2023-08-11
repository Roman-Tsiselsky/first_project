const express = require("express");
const auth_router = require('./routes/auth_routes')
//const test_driver = require('./postgres_drivers/test_driver')
const app = express();

const PORT = 2000;

app.use('/api/v1', auth_router);

//app.use('/driver', test_driver)

app.get('/', (req, res) => {
    res.send('Hello')
})

app.listen(PORT)

//библиотека node postgres