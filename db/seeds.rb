# region_1 = FactoryBot.create(:region)
# region_2 = FactoryBot.create(:region)
# region_3 = FactoryBot.create(:region)
#
# country_1 = FactoryBot.create(:country, region: region_1)
# country_2 = FactoryBot.create(:country, region: region_2)
# country_3 = FactoryBot.create(:country, region: region_3)
#
# job_1 = FactoryBot.create(:job)
# job_2 = FactoryBot.create(:job)
# job_3 = FactoryBot.create(:job)
# job_4 = FactoryBot.create(:job)
# job_5 = FactoryBot.create(:job)
#
# location_1 = FactoryBot.create(:location, country: country_3)
# location_2 = FactoryBot.create(:location, country: country_1)
# location_3 = FactoryBot.create(:location, country: country_2)
# location_4 = FactoryBot.create(:location, country: country_2)
# location_5 = FactoryBot.create(:location, country: country_3)
#
# department_1 = FactoryBot.create(:department, location: location_1)
# department_2 = FactoryBot.create(:department, location: location_4)
# department_3 = FactoryBot.create(:department, location: location_5)
# department_4 = FactoryBot.create(:department, location: location_5)
# department_5 = FactoryBot.create(:department, location: location_2)
#
# employee_1 = FactoryBot.create(:employee, job: job_1, department: department_2)
# employee_2 = FactoryBot.create(:employee, job: job_2, department: department_5)
# employee_3 = FactoryBot.create(:employee, job: job_1, department: department_3)
# employee_4 = FactoryBot.create(:employee, job: job_3, department: department_5)
# employee_5 = FactoryBot.create(:employee, job: job_4, department: department_5)
#
# job_history_1 = FactoryBot.create(:job_history, job: job_5, department: department_5)
# job_history_2 = FactoryBot.create(:job_history, job: job_5, department: department_5)
# job_history_3 = FactoryBot.create(:job_history, job: job_5, department: department_5)

def make_query(task_desc, sql)
  p task_desc
  p 'result:'
  p ActiveRecord::Base.connection.exec_query(sql)
end

task1 = 'Таблица Employees. Получить список с информацией обо всех сотрудниках'
query = """SELECT * FROM employees"""
# make_query(task, query)

task2 = 'Таблица Employees. Получить список всех сотрудников с именем David'
query = """SELECT * FROM employees WHERE first_name LIKE 'David'"""
# make_query(task, query)

task3 = "Таблица Employees. Получить список всех сотрудников с job title равным 'IT_PROG'"
query = """SELECT * FROM employees LEFT JOIN jobs on employees.job_id = jobs.id WHERE jobs.title LIKE 'IT_PROG'"""
# make_query(task, query)

task4 = 'Таблица Employees. Получить список всех сотрудников из 5 отдела (department_id = 5) с зарплатой(salary), большей 3000'
query1 = """SELECT * FROM employees LEFT JOIN departments on employees.department_id = departments.id WHERE departments.id = 5 AND employees.salary > 3000"""
query2 = """SELECT * FROM employees WHERE department_id = 5 AND employees.salary > 3000"""
# make_query(task, query)

task5 = "Таблица Employees. Получить список всех сотрудников из 2го и из 3го отдела (department_id)"
query = """SELECT * FROM employees WHERE department_id = 2 OR department_id = 3"""
# make_query(task, query)

task6 = "Таблица Employees. Получить список всех сотрудников у которых последняя буква в имени равна 'a'"
query = """SELECT * FROM employees WHERE first_name LIKE '%a'"""
# make_query(task, query)

task7 = "Таблица Employees. Получить список всех сотрудников из 5го и из 2го отдела (department_id) у которых есть бонус (значение в колонке commission_pct не пустое)"
query = """SELECT * FROM employees WHERE (department_id = 2 OR department_id = 5) AND commission_pct IS NOT NULL"""
# make_query(task, query)

task8 = "Таблица Employees. Получить список всех сотрудников у которых в имени содержатся минимум 2 буквы 'n'"
query = """SELECT * FROM employees WHERE first_name LIKE '%n%n%'"""
# make_query(task, query)

task9 = "Таблица Employees. Получить список всех сотрудников у которых длина имени больше 4 букв"
query = """SELECT * FROM employees WHERE LENGTH(first_name) > 4"""
# make_query(task, query)

task10 = "Таблица Employees. Получить список всех сотрудников у которых зарплата находится в промежутке от 8000 до 9000 (включительно)"
query = """SELECT * FROM employees WHERE salary BETWEEN 6000 AND 8000"""
# make_query(task, query)

task11 = "Таблица Employees. Получить список всех сотрудников у которых в имени содержится символ '%'"
query = """SELECT * FROM employees WHERE first_name LIKE '%\%%' ESCAPE '\'"""
# make_query(task, query)

task12 = "Таблица Employees. Получить список всех ID менеджеров"
query = """SELECT DISTINCT manager_id FROM employees WHERE manager_id IS NOT NULL"""
# make_query(task, query)

task13 = "Таблица Employees. Получить список работников с их позициями в формате: Donald(job_title)"
query = """SELECT first_name || '(' || LOWER(title) || ')' FROM employees INNER JOIN jobs ON employees.job_id = jobs.id"""
# make_query(task, query)

task14 = "Таблица Employees. Получить список всех сотрудников у которых длина имени больше 10 букв"
query = """SELECT * FROM employees WHERE LENGTH(first_name) > 10"""
# make_query(task, query)

task15 = "Таблица Employees. Получить список всех сотрудников у которых в имени есть буква 'b' (без учета регистра)"
query = """SELECT * FROM employees WHERE LOWER(first_name) LIKE '%b%'"""
# make_query(task, query)

task16 = "Таблица Employees. Получить список всех сотрудников у которых в имени содержатся минимум 2 буквы 'a'"
query = """SELECT * FROM employees WHERE first_name LIKE '%a%a%'"""
# make_query(task, query)

task17 = "Таблица Employees. Получить список всех сотрудников зарплата которых кратна 1000"
query = """SELECT * FROM employees WHERE MOD(CAST(salary AS int), 1000) = 0"""
# make_query(task, query)

task18 = "Таблица Employees. Получить первое 3х значное число телефонного номера сотрудника если его номер в формате ХХХ.ХХХ.ХХХХ"
query = """SELECT SUBSTR(phone_number, 1, 3) FROM employees WHERE phone_number LIKE '___.___.____'"""
# make_query(task, query)

task19 = "Таблица Departments. Получить первое слово из имени департамента для тех у кого в названии больше одного слова"
query = """ """
# make_query(task, query)

task20 = "Таблица Employees. Получить имена сотрудников без первой и последней буквы в имени"
query = """SELECT SUBSTRING(first_name, 2, LENGTH(first_name) - 2), first_name FROM employees"""
# make_query(task, query)

task21 = "Таблица Employees. Получить список всех сотрудников у которых последняя буква в имени равна 'm' и длинной имени большей 5ти"
query = """SELECT first_name FROM employees WHERE LENGTH(first_name) <= 5 AND first_name LIKE '%m'"""
# make_query(task, query)

task22 = "Таблица Dual. Получить дату следующей пятницы"
query = """ """
# make_query(task, query)

task23 = "Таблица Employees. Получить список всех сотрудников которые работают в компании больше 17 лет"
query = """SELECT * FROM employees WHERE MONTHS_BETWEEN(SYSDATE, hire_date) / 12 > 17;"""
# make_query(task, query)

task24 = "Таблица Employees. Получить список всех сотрудников у которых последня цифра телефонного номера нечетная и состоит из 3ех чисел разделенных точкой"
query = """SELECT * FROM employees WHERE cast(substring(phone_number, LENGTH(phone_number)) as int) % 2 = 1 AND phone_number LIKE '%___.___.___%'"""
# make_query(task, query)

task25 = "Таблица Employees. Получить список всех сотрудников у которых в значении job_id после знака '_' как минимум 3 символа но при этом это значение после '_' не равно 'CLERK'"
query = """SELECT * FROM employees LEFT JOIN jobs on jobs.id = employees.job_id WHERE POSITION('_' in jobs.title) != 0 AND LENGTH(substring(jobs.title, POSITION('_' in jobs.title) + 1)) >= 3 AND substring(jobs.title, POSITION('_' in jobs.title) + 1) != 'CLERK'"""
# make_query(task, query)

task26 = "Таблица Employees. Получить список всех сотрудников заменив в значении PHONE_NUMBER все '.' на '-'"
query = """SELECT phone_number, REPLACE (phone_number, '.', '-') as new_phone_number FROM employees;"""
# make_query(task, query)


task27 = "Таблица Employees. Получить список всех сотрудников которые пришли на работу в первый день месяца (любого)"
query = """SELECT * FROM employees WHERE TO_CHAR(hire_date, 'DD') = '01';"""
# make_query(task, query)

task28 = "Таблица Employees. Получить список всех сотрудников которые пришли на работу в 2008ом году"
query = """SELECT * FROM employees WHERE TO_CHAR(hire_date, 'YYYY') = '2008'"""
# make_query(task, query)

task29 = "Таблица DUAL. Показать завтрашнюю дату в формате: Tomorrow is Second day of January"
# SELECT TO_CHAR (SYSDATE, 'fm""Tomorrow is ""Ddspth ""day of"" Month') info FROM DUAL;
query = """not work"""
# make_query(task, query)

task30 = "Таблица Employees. Получить список всех сотрудников и дату прихода на работу каждого в формате: 21st of June, 2007"
query = """SELECT TO_CHAR(hire_date, 'DD"st of" Month, YYYY') FROM employees """
# make_query(task, query)

task31 = "Таблица Employees. Получить список работников с увеличенными зарплатами на 20%. Зарплату показать со знаком доллара"
query = """SELECT first_name, salary || '$' as old_salary, salary + FLOOR(salary * 0.2) || '$' as updated_salary FROM employees"""
# make_query(task, query)

task32 = "Таблица Employees. Получить список всех сотрудников которые приши на работу в феврале 2007го года"
query = """SELECT * FROM employees WHERE TO_CHAR(hire_date, 'Month') = 'February' AND TO_CHAR(hire_date, 'YYYY') = '2007'"""
# make_query(task, query)


task33 = "Таблица DUAL. Вывезти актуальную дату, + секунда, + минута, + час, + день, + месяц, + год"
# SELECT SYSDATE                          now,
#        SYSDATE + 1 / (24 * 60 * 60)     plus_second,
#        SYSDATE + 1 / (24 * 60)          plus_minute,
#        SYSDATE + 1 / 24                 plus_hour,
#        SYSDATE + 1                      plus_day,
#        ADD_MONTHS (SYSDATE, 1)          plus_month,
#        ADD_MONTHS (SYSDATE, 12)         plus_year
#   FROM DUAL;
query = """SELECT NOW()"""
# make_query(task, query)

task34 = "Таблица Employees. Получить список всех сотрудников с полными зарплатами (salary + commission_pct(%)) в формате: $24,000.00"
query = """SELECT first_name, to_char(salary + salary * commission_pct, '$24,000.00') as full_salary FROM employees WHERE commission_pct is not null"""
# make_query(task, query)

task35 = "Таблица Employees. Получить список всех сотрудников и информацию о наличии бонусов к зарплате (Yes/No)"
query = """SELECT first_name, CASE WHEN LENGTH(to_char(commission_pct, '')) = 0 THEN 'yes' ELSE 'no' END as has_bonus FROM employees"""
# make_query(task, query)

task36 = "Таблица Employees. Получить уровень зарплаты каждого сотрудника: Меньше 5000 считается Low level, Больше или равно 5000 и меньше 10000 считается Normal level, Больше иои равно 10000 считается High level"
query = """SELECT first_name, CASE WHEN salary < 5000 THEN 'Low level' WHEN salary > 5000 AND salary < 10000 THEN 'Normal level' WHEN salary > 10000 THEN 'High level' ELSE 'lol' END FROM employees"""
# make_query(task, query)

task37 = "Таблица Countries. Для каждой страны показать регион в котором он находится: 1-Europe, 2-America, 3-Asia, 4-Africa (без Join)"
query = """SELECT regions.name, countries.name FROM regions, countries WHERE regions.id = countries.region_id"""
# make_query(task, query)

task38 = "Таблица Employees. Сколько сотрудников имена которых начинается с одной и той же буквы? Сортировать по количеству. Показывать только те где количество больше 1"
query = """SELECT count(substring(first_name, 1, 1)) as lol FROM employees GROUP BY substring(first_name, 1, 1) HAVING count(*) > 1 ORDER BY lol DESC"""
# make_query(task, query)

task39 = "Таблица Employees. Сколько сотрудников которые работают в одном и тоже отделе и получают одинаковую зарплату?"
query = """SELECT count(salary), department_id as same_salary_people, salary FROM employees GROUP BY salary, department_id HAVING count(*) > 1"""
# make_query(task, query)

task40 = "Таблица Employees. Получить репорт сколько сотрудников приняли на работу в каждый день недели. Сортировать по количеству"
query = """SELECT count(to_char(hire_date, 'DD')), to_char(hire_date, 'DD') FROM employees GROUP BY to_char(hire_date, 'DD') ORDER BY count(to_char(hire_date, 'DD'))"""
# make_query(task, query)

task41 = "Таблица Employees. Получить репорт сколько сотрудников приняли на работу по годам. Сортировать по количеству"
query = """SELECT count(to_char(hire_date, 'YYYY')), to_char(hire_date, 'YYYY') FROM employees GROUP BY to_char(hire_date, 'YYYY') ORDER BY count(to_char(hire_date, 'YYYY'))"""
# make_query(task, query)

task42 = "Таблица Employees. Получить количество департаментов в котором есть сотрудники"
query = """SELECT count(distinct department_id) FROM employees"""
# make_query(task, query)

task43 = "Таблица Employees. Получить список department_id в котором работают больше 2 сотрудников"
query = """SELECT count(department_id), departments.name FROM employees LEFT JOIN departments on employees.department_id = departments.id GROUP BY department_id, departments.name HAVING count(department_id) > 2"""
# make_query(task, query)

task44 = "Таблица Employees. Получить список department_id и округленную среднюю зарплату работников в каждом департаменте."
query = """SELECT department_id, round(avg(salary)) FROM employees GROUP BY department_id"""
# make_query(task, query)

task45 = "Таблица Countries. Получить список region_id сумма всех букв всех country_name в котором больше 10ти"
query = """SELECT region_id FROM countries group by region_id having sum(length(name)) > 10"""
# make_query(task, query)

task46 = "Таблица Employees. Получить список department_id в котором работают работники нескольких (>1) job_id"
query = """SELECT department_id FROM employees group by department_id having count(distinct(job_id)) > 1"""
# make_query(task, query)

task47 = "Таблица Employees. Получить список manager_id у которых количество подчиненных больше 5 и сумма всех зарплат его подчиненных больше 50000"
query = """SELECT manager_id FROM employees group by manager_id having count(manager_id) > 5 AND sum(salary) > 5000"""
# make_query(task, query)

task48 = "Таблица Employees. Получить список manager_id у которых средняя зарплата всех его подчиненных находится в промежутке от 6000 до 9000 которые не получают бонусы (commission_pct пустой)"
query = """SELECT manager_id FROM employees where commission_pct is null group by manager_id having avg(salary) BETWEEN 6000 AND 90000"""
# make_query(task, query)

task49 = "Таблица Employees. Получить максимальную зарплату из всех сотрудников job_id которыз заканчивается на слово 'CLERK'"
query = """SELECT max(salary) FROM employees left join jobs on jobs.id = employees.job_id where jobs.title like '%CLERK'"""
# make_query(task, query)

task50 = "Таблица Employees. Получить максимальную зарплату среди всех средних зарплат по департаменту"
query = """SELECT MAX(avg(salary)) FROM employees group by department_id"""
# make_query(task, query)

task51 = "Таблица Employees. Получить количество сотрудников с одинаковым количеством букв в имени. При этом показать только тех у кого длина имени больше 4 и количество сотрудников с таким именем больше 3. Сортировать по длинне имени"
query = """SELECT length(first_name) FROM employees group by length(first_name) having length(first_name) > 2 AND count(*) > 2 ORDER BY length(first_name);"""
# make_query(task, query)

task52 = "Таблица Employees, Departaments, Locations, Countries, Regions. Получить список регионов и количество сотрудников в каждом регионе"
query = """SELECT regions.name, count(employees.first_name) FROM regions LEFT JOIN countries on regions.id = countries.region_id LEFT JOIN locations on locations.country_id = countries.id LEFT JOIN departments on departments.location_id = locations.id LEFT JOIN employees on employees.department_id = departments.id group by regions.name"""
# make_query(task, query)

task53 = "Таблица Employees, Departaments, Locations, Countries, Regions. Получить детальную информацию о каждом сотруднике:
First_name, Last_name, Departament, Job, Street, Country, Region"
query = """SELECT first_name, last_name, departments.name, jobs.title, countries.name, regions.name FROM employees LEFT JOIN jobs on employees.job_id = jobs.id LEFT JOIN departments ON employees.department_id = departments.id LEFT JOIN locations ON departments.location_id = locations.id LEFT JOIN countries ON locations.country_id = countries.id LEFT JOIN regions ON countries.region_id = regions.id"""
# make_query(task, query)

task54 = "Таблица Employees. Показать всех менеджеров которые имеют в подчинении больше 6ти сотрудников"
query = """SELECT employees.manager_id, count(*) FROM employees LEFT JOIN jobs on employees.job_id = jobs.id group by employees.manager_id HAVING count(*) > 5"""
# make_query(task, query)

task55 = "Таблица Employees. Показать всех сотрудников которые ни кому не подчиняются"
query = """SELECT * FROM employees where manager_id is null"""
# make_query(task, query)

task56 = "
Таблица Employees, Job_history. В таблице Employee хранятся все сотрудники. В таблице Job_history хранятся сотрудники которые покинули компанию. Получить репорт о всех сотрудниках и о его статусе в компании (Работает или покинул компанию с датой ухода)
Пример:
first_name | status
Jennifer | Left the company at 31 of December, 2006
Clara | Currently Working"
# query = """
# SELECT first_name,
#        NVL2 (
#            end_date,
#            TO_CHAR (end_date, 'fm""Left the company at"" DD ""of"" Month, YYYY'),
#            'Currently Working')
#            status
#   FROM employees e LEFT JOIN job_history j ON (e.employee_id = j.employee_id);"""
# make_query(task, query)

task57 = "Таблица Employees, Departaments, Locations, Countries, Regions. Получить список сотрудников которые живут в Europe (region_name)"
query = """SELECT first_name FROM employees LEFT JOIN jobs on employees.job_id = jobs.id LEFT JOIN departments ON employees.department_id = departments.id LEFT JOIN locations ON departments.location_id = locations.id LEFT JOIN countries ON locations.country_id = countries.id LEFT JOIN regions ON countries.region_id = regions.id WHERE regions.name = 'Europe'"""
# make_query(task, query)

task58 = "Таблица Employees, Departaments. Показать все департаменты в которых работают больше 30ти сотрудников"
query = """SELECT departments.name, count(employees.first_name) FROM employees LEFT JOIN jobs on employees.job_id = jobs.id LEFT JOIN departments ON employees.department_id = departments.id group by departments.name having count(employees.first_name) > 20"""
# make_query(task, query)

task59 = "Таблица Employees, Departaments. Показать всех сотрудников которые не состоят ни в одном департаменте"
query = """SELECT first_name FROM employees WHERE department_id IS NULL"""
# make_query(task, query)

task60 = "Таблица Employees, Departaments. Показать все департаменты в которых нет ни одного сотрудника"
query = """SELECT departments.name FROM employees RIGHT JOIN departments ON employees.department_id = departments.id where department_id is null"""
# make_query(task, query)

task61 = "Таблица Employees. Показать всех сотрудников у которых нет ни кого в подчинении"
# SELECT man.first_name
#   FROM employees  emp
#        RIGHT JOIN employees man ON (emp.manager_id = man.employee_id)
#  WHERE emp.FIRST_NAME IS NULL;
# query = """ """
# make_query(task, query)

task62 = "Таблица Employees, Jobs, Departaments. Показать сотрудников в формате: First_name, Job_title, Department_name."
query = """SELECT first_name, j.title, departments.name FROM employees as e LEFT JOIN jobs as j ON e.job_id = j.id LEFT JOIN departments ON departments.id = e.department_id;"""
# make_query(task, query)

task63 = "Таблица Employees. Получить список сотрудников менеджеры которых устроились на работу в 2005ом году но при это сами эти работники устроились на работу до 2005 года"
query = """SELECT employees.first_name FROM employees LEFT JOIN employees as manager on employees.id = manager.manager_id WHERE to_char(employees.hire_date, 'YYYY') < '2005' AND to_char(manager.hire_date, 'YYYY') = '2005'"""
# make_query(task, query)

task64 = "Таблица Employees. Получить список сотрудников менеджеры которых устроились на работу в январе месяце любого года и длина job_title этих сотрудников больше 15ти символов"
query = """SELECT employees.first_name FROM employees LEFT JOIN employees as manager on employees.id = manager.manager_id LEFT JOIN jobs on manager.job_id = jobs.id WHERE to_char(manager.hire_date, 'Month') = 'January' AND length(jobs.title) > 15"""
# make_query(task, query)

# with subquery
task65 = "Таблица Employees. Получить список сотрудников с самым длинным именем"
query = """SELECT first_name FROM employees WHERE LENGTH(first_name) = (SELECT MAX(LENGTH(first_name)) FROM employees)"""
# make_query(task, query)

task66 = "Таблица Employees. Получить список сотрудников с зарплатой большей средней зарплаты всех сотрудников."
query = """SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees)"""
# make_query(task, query)

task67 = "Таблица Employees. Получить список сотрудников у которых менеджер получает зарплату больше 15000"
query = """SELECT * FROM employees LEFT JOIN employees as managers on managers.id = employees.manager_id WHERE managers.salary > 15000"""
# make_query(task, query)

task68 = "Таблица Employees, Departaments. Показать все департаменты в которых нет ни одного сотрудника"
query = """SELECT * FROM departments WHERE department_id NOT IN (SELECT department_id FROM employees WHERE department_id IS NOT NULL)"""
# make_query(task, query)

task69 = "Таблица Employees. Показать всех сотрудников которые не являются менеджерами"
query = """SELECT * FROM employees WHERE employees.id not in (SELECT manager_id FROM employees WHERE manager_id IS NOT NULL)"""
# make_query(task, query)

task70 = "Таблица Employees, Departaments. Показать сотрудников которые работают в департаменте IT"
query = """SELECT * FROM employees WHERE department_id = (SELECT department_id FROM departments WHERE departments.name = 'IT')"""
# make_query(task, query)
