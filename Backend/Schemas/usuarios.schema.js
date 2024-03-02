import pkg from 'pg';
const {Pool} = pkg;

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'muebleriaEcommerce',
    password: 'GustavoFacundo1!',
    port: 5432
})

export { pool }