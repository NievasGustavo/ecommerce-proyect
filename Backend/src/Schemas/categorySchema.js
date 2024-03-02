import { Sequelize } from "sequelize";
import { sequelize } from "../database/connection.js";

export const Categorias = sequelize.define(
    "Categorias",
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoincrement: true,
            allowNull: false,
        },
        nombre: {
            type: Sequelize.STRING,
            allowNull: false,
        },
    },
    {
        timestamps: false,
    }
)