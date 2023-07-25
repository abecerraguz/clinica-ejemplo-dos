/*

    METODOS PARA ESTABLECER RELACIONES EN MODELOS
    hasOne() ---> "Tiene un" / Relacion 1 es a 1
    belongsTo() ---> "Pertenece a" / Vicula la relación a quien pertenece el modelo
    hasMany() ---> "Tiene muchas" / Relación de 1 es a Muchos y de Muchao a uno

*/

/*
    RELACION DE UNO ES A UNO

    En Sequelize ORM, puedes establecer una relación uno a uno entre dos modelos utilizando las asociaciones. Aquí hay un ejemplo de cómo hacerlo:

    Supongamos que tienes dos modelos: Usuario y Perfil. Quieres establecer una relación uno a uno entre ellos, donde cada usuario tiene un perfil asociado.

*/

// Usuario.js
const Usuario = sequelize.define('usuario', {
    username: DataTypes.STRING,
    // otras propiedades del usuario
});
  
// Perfil.js
const Perfil = sequelize.define('perfil', {
    fullName: DataTypes.STRING,
    // otras propiedades del perfil
});

// 1. Establece la asociación en uno de los modelos ( por ejemplo, en Usuario ):
    // Cada usuario "tiene un" perfil asociado (hasOne ---> "Tiene un")
Usuario.hasOne( Perfil, {
    foreignKey: 'usuarioId', // clave foránea en el modelo Perfil
    as: 'perfil' // nombre de la propiedad en el modelo Usuario para acceder al perfil asociado
});

// 2. Establece la asociación inversa en el otro modelo (Profile):
   // El modelo Perfil "pertenece a" un usuario ( belongsTo ---> "Pertenece a" )
Perfil.belongsTo( Usuario, {
    foreignKey: 'usuarioId' // clave foránea en el modelo Perfil
});


/*
RELACION DE UNO ES A MUCHOS

    En Sequelize ORM, puedes establecer una relación uno a muchos entre dos modelos utilizando las asociaciones. Aquí hay un ejemplo de cómo hacerlo:

    Supongamos que tienes dos modelos: Usuario y Post. Quieres establecer una relación uno a muchos, donde un usuario puede tener varios posts asociados.

*/

// User.js
const Ususario = sequelize.define('usuario', {
    username: DataTypes.STRING,
    // otras propiedades del usuario
  });
  
  // Post.js
  const Publicacion = sequelize.define('publicacion', {
    title: DataTypes.STRING,
    content: DataTypes.TEXT,
    // otras propiedades del post
  });

//  1. Establece la asociación en uno de los modelos (por ejemplo, en User):
    // Cada usuario "tiene muchas" publicaciones  (hasMany ---> Tiene Muchas )
    Usuario.hasMany( Publicacion, {
        foreignKey: 'userId', // clave foránea en el modelo Post
        as: 'publicaciones' // nombre de la propiedad en el modelo User para acceder a los posts asociados
    });

// 2. Establece la asociación inversa en el otro modelo (Publicacion):
   // El modelo Publicación "pertenece a" un usuario ( belongsTo ---> "Tiene un" )
   Publicacion.belongsTo( Usuario, {
       foreignKey: 'userId' // clave foránea en el modelo Publicacion
   });


/*
RELACION DE MUCHOS A UNO

    En Sequelize ORM, puedes establecer una relación de muchos a uno entre dos modelos utilizando las asociaciones. Aquí tienes un ejemplo de cómo hacerlo:

    Supongamos que tienes dos modelos: Post y Category. Quieres establecer una relación de muchos a uno, donde varios posts pueden pertenecer a una categoría.

    Define los modelos:

*/

// Post.js
const Post = sequelize.define('Post', {
    title: DataTypes.STRING,
    // otras propiedades del post
});
  
// Category.js
const Category = sequelize.define('Category', {
    name: DataTypes.STRING,
    // otras propiedades de la categoría
});

// 1 Establece la asociación en uno de los modelos (por ejemplo, en Post):
/*
    En este ejemplo, la función belongsTo establece una relación de muchos a uno desde el modelo Post hacia el modelo Category. Se especifica la clave foránea categoryId en el modelo Post para establecer la asociación.
*/
Post.belongsTo(Category, {
    foreignKey: 'categoryId', // clave foránea en el modelo Post
    as: 'category' // nombre de la propiedad en el modelo Post para acceder a la categoría asociada
})

// 2 Establece la asociación inversa en el otro modelo (Category):
/*
    La función hasMany establece la asociación inversa desde el modelo Category hacia el modelo Post. También se especifica la clave foránea categoryId en el modelo Post.
*/
Category.hasMany(Post, {
    foreignKey: 'categoryId' // clave foránea en el modelo Post
});