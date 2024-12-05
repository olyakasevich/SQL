create table employees (
id serial primary key,
employee_name Varchar(50) not null    /* макс длина одной ячейки - 50 */
);

select * from employees /* seletc - выбрать * всё в таблице */

INSERT INTO employees (employee_name) 
VALUES ('Алексей'),
       ('Алина'),
       ('Андрей'),
       ('Анна'),
       ('Арсений'),
       ('Артем'),
       ('Василий'),
       ('Виктория'),
       ('Владимир'),
       ('Владислав'),
       ('Галина'),
       ('Глеб'),
       ('Григорий'),
       ('Даниил'),
       ('Дарья'),
       ('Евгений'),
       ('Екатерина'),
       ('Елена'),
       ('Елизавета'),
       ('Иван'),
       ('Игорь'),
       ('Инна'),
       ('Ирина'),
       ('Кирилл'),
       ('Константин'),
       ('Ксения'),
       ('Леонид'),
       ('Лилия'),
       ('Любовь'),
       ('Максим'),
       ('Маргарита'),
       ('Марина'),
       ('Мария'),
       ('Михаил'),
       ('Надежда'),
       ('Наталья'),
       ('Никита'),
       ('Николай'),
       ('Оксана'),
       ('Олег'),
       ('Ольга'),
       ('Павел'),
       ('Петр'),
       ('Полина'),
       ('Роман'),
       ('Светлана'),
       ('Сергей'),
       ('София'),
       ('Станислав'),
       ('Тамара'),
       ('Татьяна'),
       ('Тимофей'),
       ('Ульяна'),
       ('Федор'),
       ('Юлия'),
       ('Яна'),
       ('Ярослав'),
       ('Анастасия'),
       ('Александр'),
       ('Валентина'),
       ('Василиса'),
       ('Вера'),
       ('Виталий'),
       ('Георгий'),
       ('Евдокия'),
       ('Ефим'),
       ('Кристина'),
       ('Людмила'),
       ('Матвей'),
       ('Ростислав');
      
create table salary (
id Serial  primary key,
monthly_salary Int not null    
);

select * from salary /* seletc - выбрать * всё в таблице */

INSERT INTO salary (monthly_salary) 
VALUES (1000),
       (1100),
       (1200),
       (1300),
       (1400),
       (1500),
       (1600),
       (1700),
       (1800),
       (1900),
       (2000),
       (2100),
       (2200),
       (2300),
       (2400),
       (2500);
      
create table employee_salary (
id Serial  primary key,
employee_id Int not null unique,
salary_id Int not null
);

select * from employee_salary /* select - выбрать * всё в таблице */

INSERT INTO employee_salary (employee_id, salary_id) 
VALUES (71, 1),
       (72, 2),
       (73, 3),
       (74, 4),
       (75, 5),
       (76, 6),
       (77, 7),
       (78, 8),
       (79, 9),
       (80, 10),
       (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 11),
       (12, 12),
       (13, 13),
       (14, 14),
       (15, 15),
       (16, 16),
       (17, 1),
       (18, 2),
       (19, 3),
       (20, 4),
       (21, 5),
       (22, 6),
       (23, 7),
       (24, 8),
       (25, 9),
       (26, 10),
       (27, 11),
       (28, 12),
       (29, 13),
       (30, 14);
      
create table role (
id Serial  primary key,
role_name int not null unique
);

select * from role /* select - выбрать * всё в таблице */

ALTER TABLE role ALTER COLUMN role_name type Varchar (30); /* смена типа данных: таблица, колонка, тип данных */

INSERT INTO role (role_name) 
VALUES ('Junior Python develop,er'),
       ('Middle Python developer'),
       ('Senior Python developer'),
       ('Junior Java developer'),
       ('Middle Java developer'),
       ('Senior Java developer'),
       ('Junior JavaScript developer'),
       ('Middle JavaScript developer'),
       ('Senior JavaScript developer'),
       ('Junior Manual QA engineer'),
       ('Middle Manual QA engineer'),
       ('Senior Manual QA engineer'),
       ('Project Manager'),
       ('Designer'),
       ('HR'),
       ('CEO'),
       ('Sales manager'),
       ('Junior Automation QA engineer'),
       ('Middle Automation QA engineer'),
       ('Senior Automation QA engineer');

create table roles_employee (
id Serial  primary key,
employee_id int not null unique,
FOREIGN KEY (employee_id) REFERENCES employees(id), /* какой столбец хотим связать с какой таблицей и каким ее столбцом */
role_id Int not null,
FOREIGN KEY (role_id) REFERENCES role(id)
);

select * from roles_employee 

INSERT INTO roles_employee  (employee_id, role_id) 
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(26, 6),
(27, 7),
(28, 8),
(29, 9),
(30, 10),
(31, 11),
(32, 12),
(33, 13),
(34, 14),
(35, 15),
(36, 16),
(37, 17),
(38, 18),
(39, 19),
(40, 20);
