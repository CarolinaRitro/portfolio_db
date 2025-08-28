
CREATE TABLE idioma (
  id_idioma INT IDENTITY(1,1) PRIMARY KEY,
  codigo VARCHAR(5) NOT NULL UNIQUE,
  nombre TEXT NOT NULL
);

CREATE TABLE estado_curso (
  id_estado INT IDENTITY(1,1) PRIMARY KEY,
  descripcion TEXT 
);

CREATE TABLE nivel (
  id_nivel     INT IDENTITY(1,1) PRIMARY KEY,
  nombre       TEXT NOT NULL,
  descripcion  TEXT
);

CREATE TABLE institucion (
  id_institucion INT IDENTITY(1,1) PRIMARY KEY,
  nombre TEXT NOT NULL,
  descripcion TEXT
);

CREATE TABLE curso (
  id_curso    INT IDENTITY(1,1) PRIMARY KEY,
  nombre      TEXT NOT NULL,
  descripcion TEXT,
  categoria   TEXT,
  id_idioma   INT NOT NULL REFERENCES idioma(id_idioma),
  id_estado   INT NOT NULL REFERENCES estado_curso(id_estado),
  id_nivel    INT NOT NULL REFERENCES nivel(id_nivel)
);




CREATE TABLE curso_institucion (
  id_institucion INT NOT NULL REFERENCES institucion(id_institucion) ON DELETE CASCADE,
  id_curso INT NOT NULL REFERENCES curso(id_curso) ON DELETE CASCADE,
  fecha_inicio DATE,
  fecha_fin DATE,
  PRIMARY KEY (id_institucion, id_curso),
  CONSTRAINT ck_ci_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

CREATE INDEX ix_curso_idioma ON curso(id_idioma);
CREATE INDEX ix_curso_estado ON curso(id_estado);
CREATE INDEX ix_ci_curso ON curso_institucion(id_curso);


