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

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary from employees    /* from - к какой таблице присоединяем */
full join employee_salary on employees.id = employee_salary.employee_id
full join salary on salary.id = employee_salary.salary_id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
SELECT employees.employee_name, salary.monthly_salary FROM employees
JOIN employee_salary ON employees.id = employee_salary.employee_id
JOIN salary ON salary.id = employee_salary.salary_id
WHERE salary.monthly_salary < 2000;                  

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
SELECT employees.employee_name, salary.monthly_salary FROM employees
full join employee_salary ON employees.id = employee_salary.employee_id
full join salary ON salary.id = employee_salary.salary_id
WHERE employees.employee_name is null;         

--  4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но непонятно кто её получает.)
SELECT employees.employee_name, salary.monthly_salary FROM employees
full join employee_salary ON employees.id = employee_salary.employee_id
full join salary ON salary.id = employee_salary.salary_id
WHERE salary.monthly_salary < 2000 and employees.employee_name is null;         

-- 5. Найти всех работников кому не начислена ЗП.
SELECT employees.employee_name, salary.monthly_salary FROM employees
full join employee_salary ON employees.id = employee_salary.employee_id
full join salary ON salary.id = employee_salary.salary_id
WHERE salary.monthly_salary is null;   

--  6. Вывести всех работников с названиями их должности.
select employees.employee_name, role.role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id;

--  7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, role.role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Java%';

--  8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, role.role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Python%';

--  9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, role.role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%QA%';

--  10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, role.role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Manual QA%';

--  11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, role.role_name from employees 
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Automation QA%';

--  12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Junior%';

--  13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Senior%';

--  15. Вывести зарплаты Java разработчиков
select salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Java%';

--  16. Вывести зарплаты Python разработчиков
select salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Python%';

--  17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Junior Python%';

--  18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Middle JavaScript%';

--  19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Senior Java%';

--  20. Вывести зарплаты Junior QA инженеров
select salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Junior%QA%';

--  21. Вывести среднюю зарплату всех Junior специалистов
select avg(salary.monthly_salary) as average_salary_Jun from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%Junior%';

--  22. Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) as sum_salary_JS from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%JavaScript%';

--  23. Вывести минимальную ЗП QA инженеров
select min(salary.monthly_salary) as min_salary_QA from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%QA%';

--  24. Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary) as min_salary_QA from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%QA%';

--  25. Вывести количество QA инженеров
select count(id) from role    
WHERE role.role_name LIKE '%QA%';

--  26. Вывести количество Middle специалистов.
select count(id) from role    
WHERE role.role_name LIKE '%Middle%';

--  27. Вывести количество разработчиков
select count(id) from role    
WHERE role.role_name LIKE '%developer%';

--  28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) as sum_salary_developer from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE role.role_name LIKE '%developer%';

--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
order by salary.monthly_salary asc;

--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE salary.monthly_salary between 1700 and 2300
order by salary.monthly_salary asc;

--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE salary.monthly_salary < 2300
order by salary.monthly_salary asc;

--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, salary.monthly_salary, role.role_name from employees    /* from - к какой таблице присоединяем */
join employee_salary on employees.id = employee_salary.employee_id
join salary on salary.id = employee_salary.salary_id
join roles_employee on employees.id = roles_employee.employee_id
join role on role.id = roles_employee.role_id
WHERE salary.monthly_salary in (1100, 1500, 2000)
order by salary.monthly_salary asc;