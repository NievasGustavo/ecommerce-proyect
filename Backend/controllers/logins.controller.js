import { pool } from '../Schemas/usuarios.schema.js';

const getUsers = async (req, res) => {
  const response = await pool.query(`SELECT * FROM "Productos"`);
  console.log(response.rows);
  res.send("users");
}

export { getUsers }
