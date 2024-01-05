-- Crear la tabla estado de admisión
CREATE TABLE status(
	status_id SERIAL PRIMARY KEY,
	name VARCHAR(255)
	);
-- Crear la tabla método de pago
CREATE TABLE pagament(
	pagament_id SERIAL PRIMARY KEY,
	name VARCHAR(255)
	);
-- Crear la tabla de herramientas
CREATE TABLE tool (
	tool_id SERIAL PRIMARY KEY,
	name VARCHAR(255)
	);
-- Crear la tabla de salario
CREATE TABLE salary (
	salary_id SERIAL PRIMARY KEY,
	salary INT
	); 

-- Crear la tabla bootcamp
CREATE TABLE bootcamp (
    bootcamp_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    duration INT,
    start_date DATE,
    end_date DATE
    );
ALTER TABLE bootcamp
ADD CONSTRAINT name UNIQUE (name);

ALTER TABLE bootcamp
ALTER COLUMN name SET NOT NULL;


-- Crear la tabla student
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    background VARCHAR(255),
    status_id INT,
    pagament_id INT,
    FOREIGN KEY (status_id) REFERENCES status(status_id),
    FOREIGN KEY (pagament_id) REFERENCES pagament(pagament_id)
);

ALTER TABLE student
ADD CONSTRAINT email UNIQUE (email);

ALTER TABLE student
ALTER COLUMN email SET NOT NULL;

-- Crear la tabla de profesorado
CREATE TABLE teacher (
    teacher_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(20),
    start_date_kc DATE,
    salary_id INT,
    FOREIGN KEY (salary_id) REFERENCES salary(salary_id)
    );

ALTER TABLE teacher
ADD CONSTRAINT email UNIQUE (email);

ALTER TABLE teacher
ALTER COLUMN email SET NOT NULL;

ALTER TABLE teacher
ALTER COLUMN salary_id SET NOT NULL;

-- Crear la tabla de modulos

CREATE TABLE module (
    module_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    teacher_id INT ,
    duration INT,
    tool_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
    FOREIGN KEY (tool_id) REFERENCES tool(tool_id)
    );
ALTER TABLE module
ALTER COLUMN name SET NOT NULL;

ALTER TABLE module
ALTER COLUMN teacher_id SET NOT NULL;

-- Crear la tabla STUD-BOOTCAMP (relación muchos a muchos entre STUDENT y BOOTCAMP)
CREATE TABLE stud_bootcamp (
    stud_bootcamp_id SERIAL PRIMARY KEY,
    student_id INT,
    bootcamp_id INT,
    FOREIGN KEY (student_id) REFERENCES student(student_id),
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamp(bootcamp_id),
    UNIQUE (bootcamp_id, student_id)
);

-- Crear la tabla MOD-BOOTCAMP (relación muchos a muchos entre MODULE y BOOTCAMP)
CREATE TABLE mod_bootcamp (
    mod_bootcamp_id SERIAL PRIMARY KEY,
    module_id INT,
    bootcamp_id INT,
    FOREIGN KEY (module_id) REFERENCES module(module_id),
    FOREIGN KEY (bootcamp_id) REFERENCES bootcamp(bootcamp_id),
    UNIQUE (bootcamp_id, module_id)
);

INSERT INTO status (name)
VALUES
  ('Interesado'),
  ('Inscrito'),
  ('Matriculado'),
  ('En proceso de pago'),
  ('Pagado'),
  ('Pagado y Finalizado'),
  ('Aprobado'),
  ('Certificado')
  ;

INSERT INTO pagament (name)
VALUES
  ('Precio total'),
  ('Descuento pago único'),
  ('Financiado'),
  ('Becado Agile Content'),
  ('Becado Glovo')
  ;

INSERT INTO tool (name)
VALUES
  ('BigQuery'),
  ('Python'),
  ('PostgreSQL'),
  ('Jupyter Notebook'),
  ('Pandas'),
  ('Numpy'),
  ('Draw.io'),
  ('Visual Studio Code'),
  ('Google Cloud'),
  ('Tableau'),
  ('Power BI')
  ;

INSERT INTO salary (salary)
VALUES
  (25000),
  (30000),
  (35000),
  (40000),
  (45000),
  (50000),
  (55000)
  ;


INSERT INTO student (name, surname, email, phone, background, status_id, pagament_id) VALUES
('Ana', 'González', 'ana.gonzalez@email.com', '912-222333', 'ingeniería', 3, 1),
('Juan', 'Martínez', 'juan.martinez@email.com', '944-555666', 'programador web', 4, 2),
('Laura', 'Hernández', 'laura.hernandez@email.com', '977-888999', 'ingeniería de sistemas', 5, 5),
('Pedro', 'López', 'pedro.lopez@email.com', '910-112131', 'arquitectura', 3, 2),
('María', 'Rodríguez', 'maria.rodriguez@email.com', '915-161718','informática',3,4 ),
('Javier', 'Sánchez', 'javier.sanchez@email.com', '919-021222','diseño de sistemas', 2, 1),
('Carmen', 'Pérez', 'carmen.perez@email.com', '924-252627', 'geóloga', 4, 4),
('Antonio', 'García', 'antonio.garcia@email.com', '928-293031','programador web', 1,1),
('Isabel', 'Fernández', 'isabel.fernandez@email.com', '932-333435', 'informática',5,2)
;

INSERT INTO bootcamp(name, duration, start_date, end_date) VALUES
 ('Big Data', 8, DATE '2023-11-01', DATE '2024-09-30'),
  ('Programar desde cero', 6, DATE '2024-02-04', DATE '2024-08-10'),
  ('Desarrollo Web', 8, DATE '2024-03-02', DATE '2024-11-10'),
  ('Apps Móviles IOs', 8, DATE '2024-05-13', DATE '2024-12-15'),
  ('DevOps', 6, DATE '2024-06-16', DATE '2024-12-18'),
  ('Ciberseguridad', 7, DATE '2024-03-19', DATE '2024-10-21'),
  ('Marketing Digital', 5, DATE '2024-07-22', DATE '2024-12-20'),
  ('Inteligencia Artificial', 8, DATE '2024-04-25', DATE '2024-12-20')
  ;

INSERT INTO teacher (name, surname, email, phone, start_date_kc, salary_id) VALUES
('Carlos', 'Gómez', 'carlos.gomez@email.com', '123-456-7890', DATE '2020-12-20', 20),
('Elena', 'Rodríguez', 'elena.rodriguez@email.com', '987-654-3210', DATE '2019-11-01',21),
('Antonio', 'López', 'antonio.lopez@email.com', '555-123-4567', DATE '2019-10-12',21),
('María', 'Fernández', 'maria.fernandez@email.com', '789-456-1230', DATE '2023-10-01', 19),
('Javier', 'Sánchez', 'javier.sanchez@email.com', '111-222-3333', DATE '2023-01-08',19),
('Ana', 'Pérez', 'ana.perez@email.com', '444-555-6666', DATE '2021-09-10', 23),
('José', 'García', 'jose.garcia@email.com', '777-888-9999', DATE '2018-02-01', 23),
('Carmen', 'Martínez', 'carmen.martinez@email.com', '101-112-1314', DATE '2020-03-02', 22),
('Juan', 'Díaz', 'juan.diaz@email.com', '151-161-1718', DATE '2019-10-30', 21),
('Laura', 'Moreno', 'laura.moreno@email.com', '192-021-2223', DATE '2023-11-10', 23)
; 

INSERT INTO module (name, teacher_id, duration, tool_id, start_date, end_date) VALUES
  ('Data 101', 11, 8, null, DATE '2023-11-01', DATE '2023-11-07'),
  ('Python para Big Data', 12, 12,2, DATE '2023-11-10', DATE '2023-11-22'),
  ('Diseño bases de datos y SQL', 13, 16, 1, DATE '2023-12-02', DATE '2023-12-20'),
  ('Big Data Arquitecture', 14, 32, 8, DATE '2024-01-15', DATE '2024-02-15'),
  ('Big Data Processing', 15, 12, null, DATE '2024-02-20', DATE '2024-02-27'),
  ('Visualización de datos', 16, 10, 9, DATE '2024-03-09', DATE '2024-03-21'),
  ('Estadística', 17, 12, null, DATE '2024-04-12', DATE '2024-04-20'),
  ('Data Mining', 18, 24, null, DATE '2024-05-25', DATE '2024-06-20')
  ;


INSERT INTO stud_bootcamp (student_id, bootcamp_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 8),
  (5, 8),
  (6, 2),
  (7, 1),
  (8, 2),
  (9, 1)
  ;

INSERT INTO mod_bootcamp (module_id, bootcamp_id)
VALUES
  (9, 1),
  (10, 1),
  (11, 1),
  (12, 1),
  (13, 1),
  (14, 1),
  (15, 1),
  (16, 1),
  (9, 7),
  (10,8),
  (10,2),
  (11,8)
  ;
DROP TABLE IF EXISTS stud_bootcamp;
DROP TABLE IF EXISTS mod_bootcamp;
DROP TABLE IF EXISTS salary;