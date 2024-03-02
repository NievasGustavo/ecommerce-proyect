import { DataTypes } from "sequelize";
import { sequelize } from "../database/connection.js";
import { Categorias } from "./categorySchema.js";

export const Producto = sequelize.define(
  "Productos",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
      allowNull: false
    },
    nombre: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    descripcion: {
      type: DataTypes.TEXT,
    },
    precio: {
      type: DataTypes.FLOAT(10, 2),
      allowNull: false,
    },
    stock: {
      type: DataTypes.BIGINT,
      allowNull: false,
    },
    imagen_url: {
      type: DataTypes.STRING,
    },
  },
  {
    timestamps: false,
  }
);

Producto.hasMany(Categorias, {
  foreignKey: "producto_id",
  sourceKey: "id",
});
Categorias.belongsTo(Producto, {
  foreignKey: "producto_id",
  targetId: "id",
});
