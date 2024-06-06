-- bbhyznxdlyipqmszsvba.areas definition

CREATE TABLE `areas` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `nombre_area` varchar(200) NOT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.autores definition

CREATE TABLE `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `seudonimo` varchar(20) NOT NULL,
  `fotografia` varchar(150) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `nacionalidad` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.categoria definition

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `categoria` varchar(20) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.estados definition

CREATE TABLE `estados` (
  `id_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(50) NOT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.etiquetas definition

CREATE TABLE `etiquetas` (
  `id_etiqueta` int NOT NULL AUTO_INCREMENT,
  `etiqueta_name` varchar(250) NOT NULL,
  PRIMARY KEY (`id_etiqueta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.formato definition

CREATE TABLE `formato` (
  `id_formato` int NOT NULL AUTO_INCREMENT,
  `formato` varchar(20) NOT NULL,
  PRIMARY KEY (`id_formato`),
  UNIQUE KEY `unq_formato` (`formato`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.modulos definition

CREATE TABLE `modulos` (
  `id_modulos` int NOT NULL AUTO_INCREMENT,
  `modulo_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id_modulos`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.roles definition

CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `rol` varchar(200) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.articulos definition

CREATE TABLE `articulos` (
  `id_articulo` int NOT NULL AUTO_INCREMENT,
  `art_name` varchar(100) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `resumen` text NOT NULL,
  `portada` varchar(150) NOT NULL,
  `fch_publicacion` date DEFAULT NULL,
  `fch_modificacion` date DEFAULT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `fk_articulos_estados` (`id_estado`),
  CONSTRAINT `fk_articulos_estados` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.etiqueta_articulos definition

CREATE TABLE `etiqueta_articulos` (
  `id_etiqueta` int NOT NULL,
  `id_articulos` int NOT NULL,
  KEY `fk_etiqueta_articulos` (`id_etiqueta`),
  KEY `fk_etiqueta_articulos_art` (`id_articulos`),
  CONSTRAINT `fk_etiqueta_articulos` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiquetas` (`id_etiqueta`),
  CONSTRAINT `fk_etiqueta_articulos_art` FOREIGN KEY (`id_articulos`) REFERENCES `articulos` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.libros definition

CREATE TABLE `libros` (
  `id_libro` int NOT NULL AUTO_INCREMENT,
  `lb_name` varchar(30) NOT NULL,
  `portada` varchar(50) NOT NULL,
  `resumen` text NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `archivo` varchar(100) NOT NULL,
  `fch_publicacion` date NOT NULL,
  `fch_modificacion` date DEFAULT NULL,
  `id_estado` int NOT NULL,
  PRIMARY KEY (`id_libro`),
  KEY `fk_libros_estados` (`id_estado`),
  CONSTRAINT `fk_libros_estados` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.operaciones definition

CREATE TABLE `operaciones` (
  `id_operaciones` int NOT NULL AUTO_INCREMENT,
  `operaciones_name` varchar(100) DEFAULT NULL,
  `id_modulo` int NOT NULL,
  PRIMARY KEY (`id_operaciones`),
  KEY `fk_operaciones_modulos` (`id_modulo`),
  CONSTRAINT `fk_operaciones_modulos` FOREIGN KEY (`id_modulo`) REFERENCES `modulos` (`id_modulos`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.rol_operaciones definition

CREATE TABLE `rol_operaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_roles` int NOT NULL,
  `id_operaciones` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_rol_operaciones` (`id_roles`),
  KEY `idx_rol_operaciones_0` (`id_operaciones`),
  CONSTRAINT `fk_rol_operaciones_operaciones` FOREIGN KEY (`id_operaciones`) REFERENCES `operaciones` (`id_operaciones`) ON UPDATE CASCADE,
  CONSTRAINT `fk_rol_operaciones_roles` FOREIGN KEY (`id_roles`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.usuarios definition

CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(20) NOT NULL,
  `segundo_nombre` varchar(20) DEFAULT NULL,
  `apellido_paterno` varchar(20) NOT NULL,
  `apellido_materno` varchar(20) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `cv` varchar(150) NOT NULL,
  `password` varchar(20) NOT NULL,
  `id_rol` int NOT NULL,
  `fch_creacion` date NOT NULL DEFAULT (curdate()),
  `fotografia` varchar(150) NOT NULL,
  `fch_actualizacion` date DEFAULT (curdate()),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `username` (`correo`),
  KEY `fk_usuarios_roles` (`id_rol`),
  CONSTRAINT `fk_usuarios_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.area_articulo definition

CREATE TABLE `area_articulo` (
  `id_area` int NOT NULL,
  `id_articulo` int NOT NULL,
  KEY `fk_area_articulo_areas` (`id_area`),
  KEY `fk_area_articulo_articulos` (`id_articulo`),
  CONSTRAINT `fk_area_articulo_areas` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  CONSTRAINT `fk_area_articulo_articulos` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.area_libro definition

CREATE TABLE `area_libro` (
  `id_area` int NOT NULL,
  `id_libro` int NOT NULL,
  KEY `fk_area_libro_areas` (`id_area`),
  KEY `fk_area_libro_libros` (`id_libro`),
  CONSTRAINT `fk_area_libro_areas` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  CONSTRAINT `fk_area_libro_libros` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.autor_libro definition

CREATE TABLE `autor_libro` (
  `id_libro` int NOT NULL,
  `id_autor` int NOT NULL,
  KEY `fk_autor_libro_libros` (`id_libro`),
  KEY `fk_autor_libro_autores` (`id_autor`),
  CONSTRAINT `fk_autor_libro_autores` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`),
  CONSTRAINT `fk_autor_libro_libros` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.autorizacion definition

CREATE TABLE `autorizacion` (
  `id_libro` int NOT NULL,
  `id_comite` int NOT NULL,
  `votos` int NOT NULL,
  `fecha` date NOT NULL,
  UNIQUE KEY `unq_autorizacion_id_libro` (`id_libro`),
  KEY `fk_autorizacion_usuarios` (`id_comite`),
  CONSTRAINT `fk_autorizacion_libros` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  CONSTRAINT `fk_autorizacion_usuarios` FOREIGN KEY (`id_comite`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.etiqueta_libro definition

CREATE TABLE `etiqueta_libro` (
  `id_etiqueta` int NOT NULL,
  `id_libro` int NOT NULL,
  KEY `fk_etiqueta_libro_etiquetas` (`id_etiqueta`),
  KEY `fk_etiqueta_libro_libros` (`id_libro`),
  CONSTRAINT `fk_etiqueta_libro_etiquetas` FOREIGN KEY (`id_etiqueta`) REFERENCES `etiquetas` (`id_etiqueta`),
  CONSTRAINT `fk_etiqueta_libro_libros` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.eventos definition

CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `event_name` varchar(50) NOT NULL,
  `baner` varchar(100) DEFAULT NULL,
  `fch_inicio` date NOT NULL,
  `hora` time NOT NULL,
  `ubicacion` varchar(50) DEFAULT NULL,
  `fch_finalizacion` date NOT NULL,
  `id_estado` int NOT NULL,
  `id_formato` int NOT NULL,
  `id_categoria` int NOT NULL,
  `id_organizador` int NOT NULL,
  PRIMARY KEY (`id_evento`),
  KEY `fk_eventos_formato` (`id_formato`),
  KEY `fk_eventos_categoria` (`id_categoria`),
  KEY `fk_eventos_estados` (`id_estado`),
  KEY `fk_eventos_usuarios` (`id_organizador`),
  CONSTRAINT `fk_eventos_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_eventos_estados` FOREIGN KEY (`id_estado`) REFERENCES `estados` (`id_estado`),
  CONSTRAINT `fk_eventos_formato` FOREIGN KEY (`id_formato`) REFERENCES `formato` (`id_formato`),
  CONSTRAINT `fk_eventos_usuarios` FOREIGN KEY (`id_organizador`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.revisiones definition

CREATE TABLE `revisiones` (
  `id_articulo` int NOT NULL,
  `id_primer_revisor` int NOT NULL,
  `id_segundo_revisor` int NOT NULL,
  `id_escritor` int NOT NULL,
  `fch_primer_revisor` date DEFAULT NULL,
  `fch_segunda_revisor` date DEFAULT NULL,
  `observaciones` text,
  UNIQUE KEY `unq_revisiones_id_articulo` (`id_articulo`),
  KEY `fk_primer_revisor` (`id_primer_revisor`),
  KEY `fk_segundo_revisor` (`id_segundo_revisor`),
  KEY `fk_revisiones_usuarios` (`id_escritor`),
  CONSTRAINT `fk_primer_revisor` FOREIGN KEY (`id_primer_revisor`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_revisiones_articulos` FOREIGN KEY (`id_articulo`) REFERENCES `articulos` (`id_articulo`),
  CONSTRAINT `fk_revisiones_usuarios` FOREIGN KEY (`id_escritor`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_segundo_revisor` FOREIGN KEY (`id_segundo_revisor`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.usuario_area definition

CREATE TABLE `usuario_area` (
  `id_usuario` int NOT NULL,
  `id_area` int NOT NULL,
  KEY `fk_usuario_area_areas` (`id_area`),
  KEY `fk_usuario_area_usuarios` (`id_usuario`),
  CONSTRAINT `fk_usuario_area_areas` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  CONSTRAINT `fk_usuario_area_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- bbhyznxdlyipqmszsvba.area_evento definition

CREATE TABLE `area_evento` (
  `id_area` int NOT NULL,
  `id_evento` int NOT NULL,
  KEY `fk_area_evento_areas` (`id_area`),
  KEY `fk_area_evento_eventos` (`id_evento`),
  CONSTRAINT `fk_area_evento_areas` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`),
  CONSTRAINT `fk_area_evento_eventos` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- datos sql
INSERT INTO areas( id_area, nombre_area ) VALUES ( 1, 'Linguistica');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 2, 'Musica');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 3, 'Literatura');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 4, 'Arqueologia');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 5, 'Psicologia');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 6, 'Musicologia');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 7, 'Antropologia');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 8, 'Historia');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 9, 'Turismo ');
INSERT INTO areas( id_area, nombre_area ) VALUES ( 10, 'Biologia');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 1, 'Maximiliano', null, 'M', 'bolivia');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 2, 'Carlos', null, 'M', 'peru');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 3, 'Percy', null, 'M', 'ecuador');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 4, 'Belen', null, 'F', 'bolivia');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 5, 'Alejandro', null, 'M', 'argentina');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 6, 'Mario', null, 'M', 'peru');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 7, 'Ana', null, 'F', 'brasil');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 8, 'Alan', null, 'M', 'argentina');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 9, 'Diego', null, 'M', 'bolivia');
INSERT INTO autores( id_autor, seudonimo, fotografia, genero, nacionalidad ) VALUES ( 10, 'Juana', null, 'F', 'bolivia');
INSERT INTO categoria( id_categoria, categoria ) VALUES ( 1, 'Taller');
INSERT INTO categoria( id_categoria, categoria ) VALUES ( 2, 'Ferias');
INSERT INTO categoria( id_categoria, categoria ) VALUES ( 3, 'Charlas');
INSERT INTO categoria( id_categoria, categoria ) VALUES ( 4, 'Ponencia');
INSERT INTO categoria( id_categoria, categoria ) VALUES ( 5, 'Simpocio');
INSERT INTO categoria( id_categoria, categoria ) VALUES ( 6, 'Simpocio');
INSERT INTO estados( id_estado, estado ) VALUES ( 1, 'Aprobado');
INSERT INTO estados( id_estado, estado ) VALUES ( 2, 'Observado');
INSERT INTO estados( id_estado, estado ) VALUES ( 3, 'Revison');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 1, 'dia_de_la_madre');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 2, 'navidad');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 3, 'alasitas');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 4, 'carnaval');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 5, 'todos_santos');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 6, 'corpus_cristi');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 7, 'dia_del_trabajo');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 8, 'dia_de_bolivia');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 9, 'san juan');
INSERT INTO etiquetas( id_etiqueta, etiqueta_name ) VALUES ( 10, 'pascua');
INSERT INTO formato( id_formato, formato ) VALUES ( 2, 'Presencial');
INSERT INTO formato( id_formato, formato ) VALUES ( 3, 'Semi Presencial');
INSERT INTO formato( id_formato, formato ) VALUES ( 1, 'Virtual');
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 5, 'Juan de la rosa', './', '"Juan de la Rosa" de Nataniel Aguirre es una novela histórica que narra las memorias de Juanito, un niño que vive la Guerra de Independencia de Bolivia. A través de sus ojos, se describen las luchas y sacrificios del pueblo boliviano contra la dominación española, resaltando temas de patriotismo, valentía y el despertar de la conciencia nacional.', '"Juan de la Rosa" es una novela histórica boliviana que narra la vida de Juanito durante la Guerra de la Independencia contra España en el siglo XIX, ofreciendo una mirada íntima de los eventos y sentimientos de la época.', './', '2024-05-03', '2024-05-03', 1);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 6, 'Los deshabilitados', './', '"Los deshabitados" de Marcelo Quiroga Santa Cruz es una novela que explora la vida de personajes que sienten una profunda alienación y desencanto en la sociedad boliviana. A través de sus historias, se abordan temas de desesperanza, búsqueda de sentido y la lucha contra la opresión y la injusticia social.', '"Los deshabitados" es una novela del autor boliviano Marcelo Quiroga Santa Cruz. Describe la alienación y el desencanto de varios personajes en la sociedad boliviana. A través de sus historias, la novela explora temas de desesperanza, búsqueda de sentido y lucha contra la opresión y la injusticia social.', './', '2024-10-06', '2024-10-12', 3);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 7, 'Raza de bronce', './', '"Raza de bronce" de Alcides Arguedas es una novela que describe la vida de los indígenas bolivianos en el altiplano. La obra muestra la explotación, miseria y sufrimiento que padecen a manos de los colonizadores y mestizos, destacando la resistencia y dignidad de los pueblos originarios. La novela es una crítica social que busca generar conciencia sobre las injusticias y desigualdades en Bolivia.', '"Raza de bronce" es una novela del escritor boliviano Alcides Arguedas. Ambientada en el altiplano boliviano, la obra retrata la vida de los indígenas y mestizos durante la época de la dominación española. Arguedas expone las injusticias y el sufrimiento de estos grupos bajo el sistema colonial, así como su resistencia y lucha por preservar su identidad cultural. La novela es una crítica social que busca concienciar sobre las desigualdades y el racismo en la sociedad boliviana.', './', '2024-12-09', '2024-12-18', 2);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 10, 'Tirinea', './', '"Tirinea" de Jesús Urzagasti es una novela que narra la historia de un hombre que llega a un pueblo llamado Tirinea, donde la realidad se mezcla con lo fantástico. A través de su viaje, el protagonista explora temas de soledad, identidad y la búsqueda de sentido en un mundo extraño y onírico. La obra es una reflexión sobre la condición humana y la conexión con la tierra y la memoria.', '"Tirinea" es una novela del autor boliviano Jesús Urzagasti. La historia sigue a un hombre que llega a un pueblo llamado Tirinea, donde la realidad se mezcla con lo fantástico. A través de su viaje, explora temas de soledad, identidad y búsqueda de sentido en un mundo misterioso y onírico. La obra es una reflexión sobre la condición humana y la conexión con la tierra y la memoria.', './', '2024-08-07', '2024-08-14', 3);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 11, 'El otro gallo', './', '"El otro gallo" de René Bascopé Aspiazu es una novela que se desarrolla en el contexto de la Revolución Nacional Boliviana de 1952. La historia sigue a diversos personajes que experimentan los cambios políticos y sociales de la época. A través de sus vivencias, la obra aborda temas como la lucha por el poder, la traición, y el impacto de la revolución en la vida cotidiana de la gente. Es una reflexión sobre las esperanzas y desilusiones generadas por los procesos revolucionarios.', '"El otro gallo" es una novela del autor boliviano René Bascopé Aspiazu. Situada en el contexto de la Revolución Nacional Boliviana de 1952, la historia sigue a varios personajes que experimentan los cambios políticos y sociales de la época. A través de sus vivencias, la obra aborda temas como la lucha por el poder, la traición y el impacto de la revolución en la vida cotidiana de la gente. Es una reflexión sobre las esperanzas y desilusiones generadas por los procesos revolucionarios.', './', '2024-05-07', '2024-05-20', 2);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 12, 'Intimas', './', '"Íntimas" de Adela Zamudio es una colección de poemas y prosas que exploran temas personales y sociales desde una perspectiva femenina. La obra aborda cuestiones de amor, soledad, identidad, y el rol de la mujer en la sociedad, reflejando las inquietudes y sentimientos de la autora. Con un estilo íntimo y reflexivo, Zamudio critica las injusticias y las restricciones impuestas a las mujeres, defendiendo la igualdad y la emancipación femenina.', '"Íntimas" es una colección de poemas y prosas de la escritora boliviana Adela Zamudio. Esta obra aborda temas como el amor, la soledad, la identidad y la posición de la mujer en la sociedad. A través de un estilo íntimo y reflexivo, Zamudio critica las injusticias y restricciones impuestas a las mujeres, defendiendo la igualdad y la emancipación femenina.', './', '2024-11-15', '2024-11-25', 2);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 13, 'Potosi 1600', './', '"Potosí 1600" de Bartolomé Arzáns de Orsúa y Vela es una crónica que describe la vida en la ciudad de Potosí durante el siglo XVII, cuando era uno de los centros mineros más importantes del mundo debido a sus ricos yacimientos de plata. La obra narra los eventos históricos, las costumbres, y las dificultades de la vida cotidiana en esta ciudad andina, destacando tanto su riqueza y esplendor como los conflictos y abusos que acompañaron su auge.', '"Potosí 1600" es una crónica escrita por Bartolomé Arzáns de Orsúa y Vela, que describe la vida en la ciudad de Potosí durante el siglo XVII. Este relato ofrece un vistazo a la riqueza, esplendor y complejidades sociales de la ciudad en su apogeo como uno de los centros mineros más importantes del mundo.', './', '2024-03-03', '2024-03-06', 1);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 14, 'Vidas y marginarias', './', '"Vidas y Muertes, Amores y Desamores, Historias Marginarias" de Jesús Urzagasti es una colección de relatos que exploran las vidas de personajes marginados en la sociedad boliviana. A través de estas historias, Urzagasti presenta una visión crítica de la realidad social, política y económica del país, destacando la lucha, la resistencia y la dignidad de aquellos que viven al margen de la sociedad. La obra combina realismo con elementos poéticos, ofreciendo una reflexión profunda sobre la condición humana y las injusticias sociales.', '"Vidas y marginarias" es una colección de relatos del autor boliviano Jesús Urzagasti. Estas historias exploran la vida contemporánea en Bolivia desde la perspectiva de personajes marginados en la sociedad. A través de estos relatos, Urzagasti presenta una visión crítica de la realidad social, política y económica del país, resaltando la lucha, la resistencia y la dignidad de aquellos que viven al margen.', './', '2024-02-03', '2024-02-11', 3);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 15, 'Miles de ojos', './', '"Miles de ojos" de Maximiliano Barrientos es una colección de relatos que explora la vida contemporánea en Bolivia a través de diferentes perspectivas. Los cuentos abordan temas como la violencia, la soledad, las relaciones humanas y la búsqueda de identidad en un mundo cambiante y a menudo hostil. Con un estilo directo y evocador, Barrientos retrata personajes complejos y situaciones que revelan las tensiones y contradicciones de la sociedad moderna.', '"Miles de ojos" es una colección de relatos del autor boliviano Maximiliano Barrientos. Estos cuentos exploran la vida contemporánea en Bolivia desde diversas perspectivas. Abordan temas como la violencia, la soledad, las relaciones humanas y la búsqueda de identidad en un mundo en constante cambio.', './', '2024-05-30', '2024-06-03', 2);
INSERT INTO libros( id_libro, lb_name, portada, resumen, descripcion, archivo, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 16, 'Los afectos', './', '"Los afectos" de Rodrigo Hasbún es una novela inspirada en la historia real de la familia Ertl, que emigró de Alemania a Bolivia después de la Segunda Guerra Mundial. La narrativa sigue las vidas de los miembros de esta familia, especialmente Hans Ertl, un cineasta y explorador, y sus hijas, particularmente Monika, quien se involucra en la guerrilla boliviana. La novela explora temas de exilio, búsqueda de identidad, complejidades familiares y el impacto de los eventos históricos en las vidas personales. Con una prosa contenida y evocadora, Hasbún presenta una reflexión sobre la memoria, el amor y la pérdida.', '"Los Afectos" es una novela del escritor boliviano Rodrigo Hasbún. Inspirada en la historia real de la familia Ertl, la narrativa sigue las vidas de los miembros de esta familia, especialmente de Hans Ertl, un cineasta y explorador, y de sus hijas, particularmente Monika, que se involucra en la guerrilla boliviana. La novela explora temas de exilio, búsqueda de identidad, complejidades familiares y el impacto de los eventos históricos en las vidas personales.', './', '2024-12-05', '2024-12-10', 1);
INSERT INTO modulos( id_modulos, modulo_name ) VALUES ( 1, 'Usuarios');
INSERT INTO modulos( id_modulos, modulo_name ) VALUES ( 2, 'Libros');
INSERT INTO modulos( id_modulos, modulo_name ) VALUES ( 3, 'Eventos');
INSERT INTO modulos( id_modulos, modulo_name ) VALUES ( 4, 'Articuos');
INSERT INTO operaciones( id_operaciones, operaciones_name, id_modulo ) VALUES ( 1, 'Crear', 1);
INSERT INTO operaciones( id_operaciones, operaciones_name, id_modulo ) VALUES ( 2, 'Leer', 1);
INSERT INTO operaciones( id_operaciones, operaciones_name, id_modulo ) VALUES ( 3, 'Acualizar', 1);
INSERT INTO operaciones( id_operaciones, operaciones_name, id_modulo ) VALUES ( 4, 'Eliminar', 1);
INSERT INTO roles( id_rol, rol ) VALUES ( 1, 'administrador');
INSERT INTO roles( id_rol, rol ) VALUES ( 2, 'pasante');
INSERT INTO roles( id_rol, rol ) VALUES ( 3, 'comite');
INSERT INTO roles( id_rol, rol ) VALUES ( 4, 'colaborador');
INSERT INTO roles( id_rol, rol ) VALUES ( 5, 'investigador');
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 1, 'Hector', 'Luis', 'Villegas', 'Martinez', 'hec@gmail.com', './', '123', 1, '2020-01-02', './', '2023-01-01');
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 2, 'Juan', null, 'Mendoza', 'Gomez', 'ju@gmail.com', './', '1234', 2, '2021-02-04', './', null);
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 3, 'Nicolas', 'Gustavo', 'Perez', 'Diaz', 'nico@gmail.com', './', '124', 2, '2022-03-06', './', null);
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 4, 'Victor', 'Diego', 'Villa', 'Sanchez', 'vic@gmail.com', './', '1254', 3, '2022-03-08', './', '2024-01-01');
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 5, 'Nicol', 'Katherine', 'Villanueva', 'Alvarez', 'ni@gmail.com', './', '1235', 3, '2022-03-10', './', '2024-01-01');
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 6, 'Belen', null, 'Gonzales', 'Romero', 'be@gmail.com', './', '1548', 3, '2022-04-11', './', null);
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 7, 'Lucia', 'Paola', 'Rodriguez', 'Sosa', 'lu@gmail.com', './', '5413', 4, '2023-01-01', './', '2024-01-01');
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 8, 'Maria', 'Marta', 'Lopez', 'Ruiz', 'mari@gmail.com', './', '4512', 4, '2023-01-20', './', null);
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 9, 'Miriam', 'Carla', 'Fernandez', 'Torres', 'miri@gmail.com', './', '5544', 4, '2023-03-10', './', '2024-01-01');
INSERT INTO usuarios( id_usuario, primer_nombre, segundo_nombre, apellido_paterno, apellido_materno, correo, cv, password, id_rol, fch_creacion, fotografia, fch_actualizacion ) VALUES ( 10, 'Andrea', null, 'Garcia', 'Tapia', 'andre@gmail.com', './', '4444', 5, '2024-01-01', './', '2024-01-01');
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 1, 5);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 2, 6);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 3, 7);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 4, 10);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 5, 11);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 6, 12);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 7, 13);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 8, 14);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 9, 15);
INSERT INTO area_libro( id_area, id_libro ) VALUES ( 10, 16);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 1, 'Evolucion Cultural', 'Modelado de la Difusion de Practicas Sociales', 'Este artículo explora cómo se difunden las prácticas sociales en la evolución cultural, utilizando modelos para entender este proceso.', './', '2023-05-15', '2023-09-08', 1);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 2, 'Cambio Cultural', 'Modela de la Innovacion', 'Se examina cómo cambian las sociedades prehistóricas a través de la difusión de innovaciones, utilizando modelos para entender este fenómeno histórico.', './', '2022-07-02', '2022-11-20', 2);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 4, 'Diversidad Cultural', 'Estudio de caso en comunidades', '- Este estudio de caso analiza cómo la diversidad cultural influye en la dinámica social dentro de comunidades indígenas específicas.', './', '2024-03-10', '2024-08-05', 2);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 5, 'Impacto Cultural', 'Un enfoque interdisciplinario', 'Se aborda cómo la globalización afecta la identidad cultural, adoptando un enfoque interdisciplinario para comprender este fenómeno complejo.', './', '2023-09-18', null, 3);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 6, 'Arqueologia del conocimiento', 'Practicas Culturales en Contextos Historicos', ' Explora cómo la arqueología del conocimiento puede reinterpretar las prácticas culturales en contextos históricos específicos.', './', '2022-12-07', null, 1);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 7, 'Cultura en el desarrollo', 'Pespectivas Interdisciplinarias', 'Se examina cómo la cultura influye en el desarrollo del lenguaje desde diversas perspectivas interdisciplinarias.\n\n', './', '2024-08-05', '2024-11-28', 1);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 8, 'Relaciones Sociales', 'Analisis Cuantitativo de redes sociales', 'Este artículo analiza cómo las relaciones sociales afectan el cambio cultural mediante un análisis cuantitativo de redes sociales.', './', '2023-01-20', '2023-04-14', 3);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 9, 'Cultura y Cognicion', 'Estudio Comparativo de patrones de pensamiento', 'Se lleva a cabo un estudio comparativo de patrones de pensamiento para comprender cómo la cultura influye en la cognición humana.', './', '2023-06-12', '2023-10-03', 3);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 10, 'Patrimonio Cultural', 'Retos y Oportunidades', 'Este artículo explora los retos y oportunidades del turismo sostenible en relación con el patrimonio cultural.', './', '2024-03-30', '2024-07-22', 2);
INSERT INTO articulos( id_articulo, art_name, descripcion, resumen, portada, fch_publicacion, fch_modificacion, id_estado ) VALUES ( 11, 'Innovacion Tecnologica', 'Un enfoque interdisciplinario cultural', ' Se investiga cómo la innovación tecnológica influye en el cambio cultural, adoptando un enfoque interdisciplinario para abordar esta cuestión.', './', '2022-11-08', '2023-02-01', 1);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 5, 1);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 6, 2);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 7, 3);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 10, 4);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 11, 5);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 12, 6);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 13, 7);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 14, 8);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 15, 9);
INSERT INTO autor_libro( id_libro, id_autor ) VALUES ( 16, 10);
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 5, 1, 7, '2024-05-07');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 6, 2, 4, '2024-10-09');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 7, 3, 8, '2024-05-05');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 10, 4, 9, '2024-11-20');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 11, 5, 10, '2024-12-02');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 12, 6, 5, '2024-03-16');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 13, 7, 4, '2024-04-30');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 14, 8, 2, '2024-09-22');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 15, 9, 8, '2024-02-03');
INSERT INTO autorizacion( id_libro, id_comite, votos, fecha ) VALUES ( 16, 10, 9, '2024-07-29');
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 1, 1);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 2, 2);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 3, 4);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 4, 5);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 5, 6);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 6, 8);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 7, 8);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 8, 9);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 9, 10);
INSERT INTO etiqueta_articulos( id_etiqueta, id_articulos ) VALUES ( 10, 11);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 1, 5);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 2, 6);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 3, 7);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 4, 10);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 5, 11);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 6, 12);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 7, 13);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 8, 14);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 9, 15);
INSERT INTO etiqueta_libro( id_etiqueta, id_libro ) VALUES ( 10, 16);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 1, 'Festival Internacional de la Cultura', './', '2023-08-10', '08:45:00', 'Plaza Murillo', '2023-12-28', 1, 1, 1, 1);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 2, 'Carnaval de Oruro', './', '2022-11-05', '13:20:00', 'Valle de la Luna', '2023-03-20', 2, 2, 2, 2);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 3, 'Feria Internacional de Cochabamb', './', '2024-04-15', '17:55:00', 'Mercado de las Brujas', '2024-09-30', 3, 3, 3, 3);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 4, 'Festival de la Canción de Eurovisión', './', '2022-10-20', '09:30:00', 'Teleférico La Paz', '2023-02-05', 2, 2, 3, 4);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 5, 'Feria Internacional de Santa Cruz', './', '2023-05-28', '14:10:00', 'Calle Jaén (Calle Museo)', '2023-10-15', 3, 3, 5, 5);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 6, 'Entrada Universitaria de La Paz', './', '2024-01-12', '19:45:00', 'Mirador Kili Kili', '2024-06-25', 2, 3, 6, 6);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 7, 'Feria Exposición de Sucre', './', '2022-09-17', '11:25:00', 'Cementerio General de La Paz', '2023-01-30', 1, 2, 2, 7);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 8, 'Festival Nacional de la Cueca', './', '2023-06-25', '16:40:00', 'Buenos Aires', '2023-11-10', 2, 1, 3, 8);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 9, 'Expo Bolivia Moda', './', '2024-02-08', '22:15:00', 'San Pedro', '2024-07-20', 1, 1, 2, 9);
INSERT INTO eventos( id_evento, event_name, baner, fch_inicio, hora, ubicacion, fch_finalizacion, id_estado, id_formato, id_categoria, id_organizador ) VALUES ( 10, 'Festival Internacional de la Cultura Andina', './', '2022-12-30', '12:05:00', 'Garita', '2023-05-15', 2, 3, 1, 10);
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 1, 1, 1, 1, '2023-04-20', '2023-09-15', 'Falta ortografica');
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 2, 2, 2, 2, '2022-10-12', '2023-02-28', null);
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 4, 3, 3, 3, '2024-01-05', '2024-06-20', 'Falta de coherencia');
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 5, 4, 4, 4, '2022-08-30', '2022-12-10', 'Muchas fallas ortograficas');
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 6, 5, 5, 5, '2023-11-18', '2024-03-05', 'Falta de logica');
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 7, 6, 6, 6, '2024-02-15', '2024-07-01', null);
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 8, 7, 7, 7, '2022-12-03', '2023-04-25', null);
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 9, 8, 8, 8, '2023-09-08', '2024-01-20', 'Falta de bibliografias');
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 10, 9, 9, 9, '2024-05-10', '2024-10-02', 'Falta de orden');
INSERT INTO revisiones( id_articulo, id_primer_revisor, id_segundo_revisor, id_escritor, fch_primer_revisor, fch_segunda_revisor, observaciones ) VALUES ( 11, 10, 10, 10, '2022-07-22', '2022-12-15', 'Falta de contenido');
INSERT INTO rol_operaciones( id, id_roles, id_operaciones ) VALUES ( 1, 1, 1);
INSERT INTO rol_operaciones( id, id_roles, id_operaciones ) VALUES ( 2, 1, 2);
INSERT INTO rol_operaciones( id, id_roles, id_operaciones ) VALUES ( 3, 1, 3);
INSERT INTO rol_operaciones( id, id_roles, id_operaciones ) VALUES ( 4, 1, 4);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 10, 1);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 9, 2);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 8, 3);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 7, 4);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 6, 5);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 5, 6);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 4, 7);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 3, 8);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 2, 9);
INSERT INTO usuario_area( id_usuario, id_area ) VALUES ( 1, 10);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 1, 1);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 2, 2);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 3, 4);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 4, 5);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 5, 6);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 6, 7);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 7, 8);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 8, 9);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 9, 10);
INSERT INTO area_articulo( id_area, id_articulo ) VALUES ( 10, 11);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 1, 1);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 2, 2);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 3, 3);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 4, 4);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 5, 5);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 6, 6);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 7, 7);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 8, 8);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 9, 9);
INSERT INTO area_evento( id_area, id_evento ) VALUES ( 10, 10);
