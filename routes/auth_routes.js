const express = require('express');
const router = express.Router();



router.get('/login', ()=>{
    console.log('login')
})
router.get('/registration', ()=>{
    console.log('registration')
})
router.get('/logout', ()=>{
    console.log('logout')
})




module.exports = router;