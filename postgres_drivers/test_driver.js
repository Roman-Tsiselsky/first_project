// const { Pool } = require('pg')

// const pool = new Pool({
//     host: 'localhost',
//     port: '6434',
//     database: 'test_db',
//     user: 'root',
//     password: 'root'
// });

// const fields = ['schemaname', 'tablename', 'tableowner'].join(', ');
// const sql = `SELECT ${fields} FROM pg_tables WHERE tableowner = $1`;
// pool.query(sql, ['root'], (err, res) => {
//     if (err) throw err;

//     console.log({ res });
//     console.table(res.fields);
//     console.table(res.rows);
//     pool.end();
// });

// (async () => {
//     const fields = ['schemaname', 'tablename', 'tableowner'].join(', ');
//     const sql = `SELECT ${fields} FROM pg_tables WHERE tableowner = $1`;
//     const { rows } = await pool.query(sql, ['root']);
//     console.table(rows);
//     pool.end();
// })();

// const fields = ['schemaname', 'tablename', 'tableowner'].join(', ');
// const sql = `SELECT ${fields} FROM pg_catalog.pg_tables WHERE tableowner = $1`
// pool.query(sql, ['root'])
// .then(res => {
//     const {rows} = res;
//     console.table(rows);
// })
// .catch(err => {
//     console.log(err)
// })
// .finally(() => {
//     pool.end()
// });


const db = require('./sql_bilder.js');

const pg = db.open({
    host: 'localhost',
    port: '6434',
    database: 'test_db',
    user: 'root',
    password: 'root'
});

console.dir({ pg });

pg.select('pg_tables')
  .where({ tableowner: 'marcus', schemaname: 'public' })
  .fields(['schemaname', 'tablename', 'tableowner', 'hasindexes'])
  .order('tablename')
  .then((rows) => {
    console.table(rows);
    pg.close();
  });


  
