/* NOME: SULLIVAN SANTOS CASTILHO - GU3020363  - 27/08/2022 12:00
NOME: Suellen Dantas de Oliveira - GU3022129
NOME: Leandro de Paula Barbosa - GU3025853

CURSO: ANÁLISE E DESENVOLVIMENTO DE SISTEMAS - BANCO DE DADOS 
Prof. RENATO DOMINGOS DE OLIVEIRA   */

create database empresa
use empresa

CREATE TABLE employees (
    emp_no      INT             NOT NULL, 
    birth_date  DATE            NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL, 
    hire_date   DATE            NOT NULL,
    PRIMARY KEY (emp_no) 										
);

/* MySQL exibe dados teste tipo no padrao 'AAAA-MM-DD' ,e.g. 2018–08–06. */
INSERT INTO employees (emp_no , birth_date, first_name, last_name, gender, hire_date) VALUES (1, '03/03/1980', 'Joao', 'Oliveira', 'M', '08/01/2006');
/* Atualiza as linhas das datas de nascimento e contratacao usando o comando where */
UPDATE employees SET birth_date = '1980-12-03', hire_date = '2000-12-03' where emp_no = 1
INSERT INTO employees (emp_no , birth_date, first_name, last_name, gender, hire_date) VALUES (2, '1980-11-25', 'Luana', 'Oliveira', 'F', '2000-12-08');
INSERT INTO employees (emp_no , birth_date, first_name, last_name, gender, hire_date) VALUES (3, '1980-10-25', 'Ana', 'Oliveira', 'F', '2000-12-08');
INSERT INTO employees (emp_no , birth_date, first_name, last_name, gender, hire_date) VALUES (4, '1980-09-25', 'Joana', 'Oliveira', 'F', '2000-12-08');
INSERT INTO employees (emp_no , birth_date, first_name, last_name, gender, hire_date) VALUES (5, '1980-08-25', 'Lucas', 'Oliveira', 'M', '2000-12-08');
INSERT INTO employees (emp_no , birth_date, first_name, last_name, gender, hire_date) VALUES (6, '1980-07-25', 'Luan', 'Oliveira', 'M', '2000-12-08');
SELECT * FROM employees

CREATE TABLE departments (
    dept_no     CHAR(4)         NOT NULL,
    dept_name   VARCHAR(40)     NOT NULL,
    PRIMARY KEY (dept_no),
    UNIQUE  KEY (dept_name)
);

INSERT INTO departments (dept_no , dept_name) VALUES ('0001', 'RH');
INSERT INTO departments (dept_no , dept_name) VALUES ('0002', 'Engenharia');
INSERT INTO departments (dept_no , dept_name) VALUES ('0003', 'TI');
INSERT INTO departments (dept_no , dept_name) VALUES ('0004', 'Logistica');
INSERT INTO departments (dept_no , dept_name) VALUES ('0005', 'Producao');
INSERT INTO departments (dept_no , dept_name) VALUES ('0006', 'Financeiro');
SELECT * FROM departments

CREATE TABLE dept_emp (
    emp_no      INT         NOT NULL,
    dept_no     CHAR(4)     NOT NULL,
    from_date   DATE        NOT NULL,
    to_date     DATE        NOT NULL,
    KEY         (emp_no),   
    KEY         (dept_no),  
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, dept_no)
);

INSERT INTO dept_emp (emp_no , dept_no, from_date, to_date) VALUES (1, '0001', '1999-12-03', '2022-08-22');
INSERT INTO dept_emp (emp_no , dept_no, from_date, to_date) VALUES (2, '0002', '1999-12-04', '2022-08-22');
INSERT INTO dept_emp (emp_no , dept_no, from_date, to_date) VALUES (3, '0003', '1999-12-03', '2022-08-22');
INSERT INTO dept_emp (emp_no , dept_no, from_date, to_date) VALUES (4, '0004', '1999-12-04', '2022-08-22');
INSERT INTO dept_emp (emp_no , dept_no, from_date, to_date) VALUES (5, '0005', '1999-12-03', '2022-08-22');
INSERT INTO dept_emp (emp_no , dept_no, from_date, to_date) VALUES (6, '0006', '1999-12-04', '2022-08-22');
SELECT * FROM dept_emp

CREATE TABLE dept_manager (
   dept_no      CHAR(4)  NOT NULL,
   emp_no       INT      NOT NULL,
   from_date    DATE     NOT NULL,
   to_date      DATE     NOT NULL,
   KEY         (emp_no),
   KEY         (dept_no),
   FOREIGN KEY (emp_no)  REFERENCES employees (emp_no)    ON DELETE CASCADE,
   FOREIGN KEY (dept_no) REFERENCES departments (dept_no) ON DELETE CASCADE,
   PRIMARY KEY (emp_no, dept_no)
);

INSERT INTO dept_manager (dept_no, emp_no , from_date, to_date) VALUES ('0001', 1, '1998-12-03', '2022-08-22');
INSERT INTO dept_manager (dept_no, emp_no , from_date, to_date) VALUES ('0002', 2, '1998-12-04', '2022-08-22');
INSERT INTO dept_manager (dept_no, emp_no , from_date, to_date) VALUES ('0003', 3, '1998-12-03', '2022-08-22');
INSERT INTO dept_manager (dept_no, emp_no , from_date, to_date) VALUES ('0004', 4, '1998-12-04', '2022-08-22');
INSERT INTO dept_manager (dept_no, emp_no , from_date, to_date) VALUES ('0005', 5, '1998-12-03', '2022-08-22');
INSERT INTO dept_manager (dept_no, emp_no , from_date, to_date) VALUES ('0006', 6, '1998-12-04', '2022-08-22');
SELECT * FROM dept_manager

CREATE TABLE titles (
    emp_no      INT          NOT NULL,
    title       VARCHAR(50)  NOT NULL,
    from_date   DATE         NOT NULL,
    to_date     DATE,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, title, from_date)
);

INSERT INTO titles  (emp_no , title, from_date, to_date) VALUES (1, 'Analista', '1999-12-03', '2022-08-22');
INSERT INTO titles  (emp_no , title, from_date, to_date) VALUES (2, 'Engenheiro', '1999-12-04', '2022-08-22');
INSERT INTO titles  (emp_no , title, from_date, to_date) VALUES (3, 'Desenvolvedor', '1999-12-03', '2022-08-22');
INSERT INTO titles  (emp_no , title, from_date, to_date) VALUES (4, 'Auxiliar', '1999-12-04', '2022-08-22');
INSERT INTO titles  (emp_no , title, from_date, to_date) VALUES (5, 'Operador', '1999-12-03', '2022-08-22');
INSERT INTO titles  (emp_no , title, from_date, to_date) VALUES (6, 'Contador', '1999-12-04', '2022-08-22');
SELECT * FROM titles 

CREATE TABLE salaries (
    emp_no      INT    NOT NULL,
    salary      INT    NOT NULL,
    from_date   DATE   NOT NULL,
    to_date     DATE   NOT NULL,
    KEY         (emp_no),
    FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ON DELETE CASCADE,
    PRIMARY KEY (emp_no, from_date)
);

INSERT INTO salaries  (emp_no , salary, from_date, to_date) VALUES (1, 3000.00, '1999-12-03', '2022-08-22');
INSERT INTO salaries  (emp_no , salary, from_date, to_date) VALUES (2, 8000.00, '1999-12-04', '2022-08-22');
INSERT INTO salaries  (emp_no , salary, from_date, to_date) VALUES (3, 6000.00, '1999-12-03', '2022-08-22');
INSERT INTO salaries  (emp_no , salary, from_date, to_date) VALUES (4, 1500.00, '1999-12-04', '2022-08-22');
INSERT INTO salaries  (emp_no , salary, from_date, to_date) VALUES (5, 2000.00, '1999-12-03', '2022-08-22');
INSERT INTO salaries  (emp_no , salary, from_date, to_date) VALUES (6, 5000.00, '1999-12-04', '2022-08-22');
SELECT * FROM salaries

/* 1-Selecionando buscas por salario 3000 ou 2000 */
SELECT * FROM salaries WHERE salary = 3000 OR salary = 2000

/* 2-Selecionando todos os salários menos 3000 e 2000 */
SELECT * FROM salaries WHERE NOT salary = 3000 AND NOT salary = 2000

/* 3-HAVING */
SELECT emp_no, salary FROM salaries GROUP BY salary HAVING emp_no > 2;

/* 4-UNION */
SELECT dept_name FROM departments UNION SELECT title FROM titles ORDER BY dept_name;

/* 5-UNION ALL - Se existisse uma palavra que se repetisse em uma das duas tabelas ou nas duas, com esse comando ficaria duplicado */
SELECT dept_name FROM departments UNION ALL SELECT title FROM titles ORDER BY dept_name;

/* 6-Intersect */
SELECT from_date FROM dept_emp INTERSECT SELECT from_date FROM titles

/* 7-GROUP BY */
SELECT emp_no, first_name FROM employees GROUP BY first_name;

/* 8-LEFT JOIN chave retorna todos os registros da tabela da esquerda (employees) e os registros correspondentes (se houver) da tabela da direita (departments). */
SELECT employees.first_name, departments.dept_name FROM employees LEFT JOIN departments ON employees.emp_no = departments.dept_no ORDER BY employees.first_name

/* 9-RIGHT JOIN */
SELECT employees.emp_no, employees.first_name, departments.dept_name FROM employees RIGHT JOIN departments ON employees.emp_no = departments.dept_no ORDER BY employees.emp_no

/* 10-INNER JOIN */
SELECT employees.emp_no, employees.first_name, titles.title FROM employees INNER JOIN titles ON employees.emp_no = titles.emp_no

/* 11-CROSS JOIN */
SELECT employees.first_name, departments.dept_no FROM employees CROSS JOIN departments;

/* 12-SELF JOIN*/
SELECT A.first_name AS first_name1, B.first_name AS first_name2, A.gender FROM employees A, employees B WHERE A.emp_no <> B.emp_no AND A.gender = B.gender ORDER BY A.gender

/* 13/14/15-Ordenar o emp_no do 6 ao 1 e os nomes ascendente e descendente */
select * from employees order by emp_no desc
select * from employees order by first_name asc
select * from employees order by first_name desc

/* 16-Buscar datas de contratacoes diferentes*/
SELECT DISTINCT hire_date FROM employees

/* 17-Buscando nome atraves das condicoes */
SELECT first_name FROM employees WHERE gender = 'M' AND hire_date = '2000-12-08'

/* 18-Buscando entre numeros */
SELECT * FROM employees WHERE emp_no BETWEEN 2 AND 5

/* 19-LIKE */
SELECT * FROM employees WHERE first_name LIKE '%a'

/* 20-in */
SELECT * FROM titles WHERE title IN ('Engenheiro', 'Auxiliar', 'Operador')

/* 21-LIMIT */
SELECT * FROM salaries WHERE salary > 1500.00 LIMIT 4

/* 22-ALTER TABLE */
ALTER TABLE salaries ADD DateOfBirth date

/* 23-MODIFY*/
ALTER TABLE salaries MODIFY DateOfBirth year

/* 24-RECURSIVE */
with Salario_dos_Empregados as (select emp_no , salary, from_date, to_date from salaries where salary < 8000.00) select * from Salario_dos_Empregados where emp_no;

/* 25-GROUP BY */
SELECT salary, from_date, to_date FROM salaries GROUP BY salary;

/* 26-UNION */
SELECT salary FROM salaries UNION SELECT title FROM titles ORDER BY salary;

/* 27-Selecionando buscas por ID do empregado*/
SELECT * FROM titles WHERE emp_no = 2 OR emp_no = 5

/* 28-HAVING */
SELECT emp_no, salary FROM salaries GROUP BY salary HAVING emp_no > 4;

/* 29-Intersect */
SELECT * FROM employees WHERE emp_no BETWEEN 3 AND 6

/* 30-LIKE */
SELECT * FROM employees WHERE first_name LIKE '%n'
