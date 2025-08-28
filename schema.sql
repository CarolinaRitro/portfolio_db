
CREATE TABLE idioma (
  id_idioma INT IDENTITY(1,1) PRIMARY KEY,
  codigo VARCHAR(5) NOT NULL UNIQUE,
  nombre  VARCHAR(200) NOT NULL
);

CREATE TABLE estado_programa (
  id_estado INT IDENTITY(1,1) PRIMARY KEY,
  descripcion NVARCHAR(200) NOT NULL UNIQUE
);

CREATE TABLE nivel (
  id_nivel     INT IDENTITY(1,1) PRIMARY KEY,
  nombre       NVARCHAR(100) NOT NULL UNIQUE,
  descripcion  NVARCHAR(500) NULL
);

CREATE TABLE tipo_programa (
  id_tipo INT IDENTITY (1,1) PRIMARY KEY,
  nombre NVARCHAR(100) NOT NULL UNIQUE
  );

CREATE TABLE institucion (
  id_institucion INT IDENTITY(1,1) PRIMARY KEY,
  nombre         NVARCHAR(200) NOT NULL UNIQUE,
  descripcion    NVARCHAR(500) NULL
);

CREATE TABLE programa (
  id_curso    INT IDENTITY(1,1) PRIMARY KEY,
  nombre      NVARCHAR(200) NOT NULL,
  descripcion NVARCHAR(MAX) NULL,
  categoria   NVARCHAR(100) NULL,
  id_idioma     INT NOT NULL FOREIGN KEY REFERENCES idioma(id_idioma),
  id_estado     INT NOT NULL FOREIGN KEY REFERENCES estado_programa(id_estado),
  id_tipo_programa INT NOT NULL FOREIGN KEY REFERENCES tipo_programa(id_tipo_programa),
  id_nivel      INT NULL  FOREIGN KEY REFERENCES nivel(id_nivel) 
);

CREATE TABLE programa_institucion (
  id_institucion INT NOT NULL FOREIGN KEY REFERENCES institucion(id_institucion) ON DELETE CASCADE,
  id_programa    INT NOT NULL FOREIGN KEY REFERENCES programa(id_programa)       ON DELETE CASCADE,
  fecha_inicio   DATE NULL,
  fecha_fin      DATE NULL,
  link_drive     NVARCHAR(500) NULL,        
  CONSTRAINT PK_programa_institucion PRIMARY KEY (id_institucion, id_programa),
  CONSTRAINT ck_pi_fechas CHECK (fecha_fin IS NULL OR fecha_fin >= fecha_inicio)
);

CREATE INDEX ix_programa_idioma  ON programa(id_idioma);
CREATE INDEX ix_programa_estado  ON programa(id_estado);
CREATE INDEX ix_programa_tipo    ON programa(id_tipo_programa);
CREATE INDEX ix_programa_nivel   ON programa(id_nivel);
CREATE INDEX ix_pi_programa      ON programa_institucion(id_programa);




