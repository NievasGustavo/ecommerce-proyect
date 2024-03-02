import Sequelize  from 'sequelize';
import 'dotenv/config'

const config = {
    database: process.env.DATABASE,
    user: process.env.USER_DB,
    password: process.env.PASSWORD_DB,
    host: process.env.HOST_DB
}

const sequelize = new Sequelize(config.database, config.user, config.password, {
    host: config.host,
    dialect: 'postgres',
})

export { sequelize }

