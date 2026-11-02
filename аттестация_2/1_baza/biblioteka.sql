-- библиотека: рекомендации и просрочка
-- связи: выдача -> читатель, выдача -> книга

DROP VIEW IF EXISTS v_priznaki_prosrochki;
DROP TABLE IF EXISTS vydacha;
DROP TABLE IF EXISTS kniga;
DROP TABLE IF EXISTS chitatel;

CREATE TABLE chitatel (
	chitatel_id INT PRIMARY KEY,
	fio VARCHAR(100) NOT NULL,
	vozrast INT CHECK (vozrast >= 10 AND vozrast <= 80),
	lyubimyy_zhanr VARCHAR(40),
	lyubimaya_tema VARCHAR(40)
);

CREATE TABLE kniga (
	kniga_id INT PRIMARY KEY,
	nazvanie VARCHAR(200) NOT NULL,
	avtor VARCHAR(100),
	zhanr VARCHAR(40),
	tema VARCHAR(40),
	god INT
);

CREATE TABLE vydacha (
	vydacha_id INT PRIMARY KEY,
	chitatel_id INT REFERENCES chitatel(chitatel_id),
	kniga_id INT REFERENCES kniga(kniga_id),
	data_vydachi DATE,
	srok_sdachi DATE,
	data_vozvrata DATE,
	otsenka INT,
	CHECK (otsenka IS NULL OR (otsenka >= 1 AND otsenka <= 5)),
	CHECK (srok_sdachi >= data_vydachi),
	CHECK (data_vozvrata IS NULL OR data_vozvrata >= data_vydachi)
);

-- читатели
INSERT INTO chitatel VALUES (1, 'Соколова Анна Сергеевна', 22, 'фантастика', 'космос');
INSERT INTO chitatel VALUES (2, 'Петров Иван Петрович', 31, 'детектив', 'преступление');
INSERT INTO chitatel VALUES (3, 'Кузнецова Мария Ивановна', 19, 'роман', 'любовь');
INSERT INTO chitatel VALUES (4, 'Орлов Дмитрий Алексеевич', 28, 'учебник', 'компьютеры');
INSERT INTO chitatel VALUES (5, 'Морозова Елена Викторовна', 35, 'публицистика', 'саморазвитие');
INSERT INTO chitatel VALUES (6, 'Волков Павел Николаевич', 41, 'роман', 'война');
INSERT INTO chitatel VALUES (7, 'Новикова Ольга Андреевна', 24, 'приключения', 'путешествия');
INSERT INTO chitatel VALUES (8, 'Лебедев Сергей Игоревич', 29, 'публицистика', 'деньги');
INSERT INTO chitatel VALUES (9, 'Козлова Наталья Дмитриевна', 33, 'биография', 'власть');
INSERT INTO chitatel VALUES (10, 'Смирнов Алексей Романович', 18, 'повесть', 'детство');
INSERT INTO chitatel VALUES (11, 'Белова Виктория Олеговна', 27, 'фантастика', 'космос');
INSERT INTO chitatel VALUES (12, 'Фёдоров Никита Сергеевич', 36, 'детектив', 'преступление');
INSERT INTO chitatel VALUES (13, 'Егорова Татьяна Павловна', 23, 'роман', 'любовь');
INSERT INTO chitatel VALUES (14, 'Павлов Андрей Михайлович', 40, 'учебник', 'компьютеры');
INSERT INTO chitatel VALUES (15, 'Васильева Юлия Александровна', 21, 'публицистика', 'саморазвитие');
INSERT INTO chitatel VALUES (16, 'Михайлов Роман Валерьевич', 45, 'роман', 'война');
INSERT INTO chitatel VALUES (17, 'Александрова Ксения Ильинична', 26, 'приключения', 'путешествия');
INSERT INTO chitatel VALUES (18, 'Николаев Игорь Владимирович', 32, 'публицистика', 'деньги');
INSERT INTO chitatel VALUES (19, 'Степанова Дарья Евгеньевна', 20, 'биография', 'наука');
INSERT INTO chitatel VALUES (20, 'Григорьев Максим Артёмович', 17, 'сказка', 'дружба');

-- книги
INSERT INTO kniga VALUES (1, 'Война и мир', 'Лев Толстой', 'роман', 'война', 1869);
INSERT INTO kniga VALUES (2, 'Анна Каренина', 'Лев Толстой', 'роман', 'любовь', 1877);
INSERT INTO kniga VALUES (3, 'Преступление и наказание', 'Фёдор Достоевский', 'роман', 'преступление', 1866);
INSERT INTO kniga VALUES (4, 'Идиот', 'Фёдор Достоевский', 'роман', 'любовь', 1869);
INSERT INTO kniga VALUES (5, 'Братья Карамазовы', 'Фёдор Достоевский', 'роман', 'семья', 1880);
INSERT INTO kniga VALUES (6, 'Евгений Онегин', 'Александр Пушкин', 'роман', 'любовь', 1833);
INSERT INTO kniga VALUES (7, 'Капитанская дочка', 'Александр Пушкин', 'повесть', 'власть', 1836);
INSERT INTO kniga VALUES (8, 'Мёртвые души', 'Николай Гоголь', 'роман', 'власть', 1842);
INSERT INTO kniga VALUES (9, 'Ревизор', 'Николай Гоголь', 'комедия', 'власть', 1836);
INSERT INTO kniga VALUES (10, 'Герой нашего времени', 'Михаил Лермонтов', 'роман', 'любовь', 1840);
INSERT INTO kniga VALUES (11, 'Отцы и дети', 'Иван Тургенев', 'роман', 'семья', 1862);
INSERT INTO kniga VALUES (12, 'Обломов', 'Иван Гончаров', 'роман', 'семья', 1859);
INSERT INTO kniga VALUES (13, 'Мастер и Маргарита', 'Михаил Булгаков', 'роман', 'власть', 1967);
INSERT INTO kniga VALUES (14, 'Собачье сердце', 'Михаил Булгаков', 'повесть', 'власть', 1925);
INSERT INTO kniga VALUES (15, 'Тихий Дон', 'Михаил Шолохов', 'роман', 'война', 1940);
INSERT INTO kniga VALUES (16, 'Как закалялась сталь', 'Николай Островский', 'роман', 'война', 1934);
INSERT INTO kniga VALUES (17, 'Доктор Живаго', 'Борис Пастернак', 'роман', 'любовь', 1957);
INSERT INTO kniga VALUES (18, 'Архипелаг ГУЛАГ', 'Александр Солженицын', 'публицистика', 'власть', 1973);
INSERT INTO kniga VALUES (19, 'Один день Ивана Денисовича', 'Александр Солженицын', 'повесть', 'власть', 1962);
INSERT INTO kniga VALUES (20, 'Мы', 'Евгений Замятин', 'фантастика', 'власть', 1924);
INSERT INTO kniga VALUES (21, 'Пикник на обочине', 'Аркадий и Борис Стругацкие', 'фантастика', 'космос', 1972);
INSERT INTO kniga VALUES (22, 'Трудно быть богом', 'Аркадий и Борис Стругацкие', 'фантастика', 'власть', 1964);
INSERT INTO kniga VALUES (23, 'Понедельник начинается в субботу', 'Аркадий и Борис Стругацкие', 'фантастика', 'наука', 1965);
INSERT INTO kniga VALUES (24, 'Солярис', 'Станислав Лем', 'фантастика', 'космос', 1961);
INSERT INTO kniga VALUES (25, '451 градус по Фаренгейту', 'Рэй Брэдбери', 'фантастика', 'власть', 1953);
INSERT INTO kniga VALUES (26, 'Марсианские хроники', 'Рэй Брэдбери', 'фантастика', 'космос', 1950);
INSERT INTO kniga VALUES (27, 'Дюна', 'Фрэнк Герберт', 'фантастика', 'космос', 1965);
INSERT INTO kniga VALUES (28, '1984', 'Джордж Оруэлл', 'роман', 'власть', 1949);
INSERT INTO kniga VALUES (29, 'Скотный двор', 'Джордж Оруэлл', 'повесть', 'власть', 1945);
INSERT INTO kniga VALUES (30, 'О дивный новый мир', 'Олдос Хаксли', 'фантастика', 'власть', 1932);
INSERT INTO kniga VALUES (31, 'Игра Эндера', 'Орсон Скотт Кард', 'фантастика', 'космос', 1985);
INSERT INTO kniga VALUES (32, 'Нейромант', 'Уильям Гибсон', 'фантастика', 'компьютеры', 1984);
INSERT INTO kniga VALUES (33, 'Левая рука тьмы', 'Урсула Ле Гуин', 'фантастика', 'космос', 1969);
INSERT INTO kniga VALUES (34, 'Автостопом по Галактике', 'Дуглас Адамс', 'фантастика', 'космос', 1979);
INSERT INTO kniga VALUES (35, 'Марсианин', 'Энди Вейер', 'фантастика', 'космос', 2011);
INSERT INTO kniga VALUES (36, 'Убийство в Восточном экспрессе', 'Агата Кристи', 'детектив', 'преступление', 1934);
INSERT INTO kniga VALUES (37, 'И никого не стало', 'Агата Кристи', 'детектив', 'преступление', 1939);
INSERT INTO kniga VALUES (38, 'Собака Баскервилей', 'Артур Конан Дойл', 'детектив', 'преступление', 1902);
INSERT INTO kniga VALUES (39, 'Этюд в багровых тонах', 'Артур Конан Дойл', 'детектив', 'преступление', 1887);
INSERT INTO kniga VALUES (40, 'Знак четырёх', 'Артур Конан Дойл', 'детектив', 'преступление', 1890);
INSERT INTO kniga VALUES (41, 'Имя розы', 'Умберто Эко', 'детектив', 'преступление', 1980);
INSERT INTO kniga VALUES (42, 'Девушка с татуировкой дракона', 'Стиг Ларссон', 'детектив', 'преступление', 2005);
INSERT INTO kniga VALUES (43, 'Молчание ягнят', 'Томас Харрис', 'триллер', 'преступление', 1988);
INSERT INTO kniga VALUES (44, 'Властелин колец. Братство Кольца', 'Джон Р. Р. Толкин', 'фэнтези', 'путешествия', 1954);
INSERT INTO kniga VALUES (45, 'Хоббит, или Туда и обратно', 'Джон Р. Р. Толкин', 'фэнтези', 'путешествия', 1937);
INSERT INTO kniga VALUES (46, 'Гарри Поттер и философский камень', 'Джоан Роулинг', 'фэнтези', 'детство', 1997);
INSERT INTO kniga VALUES (47, 'Гарри Поттер и Тайная комната', 'Джоан Роулинг', 'фэнтези', 'детство', 1998);
INSERT INTO kniga VALUES (48, 'Последнее желание', 'Анджей Сапковский', 'фэнтези', 'путешествия', 1993);
INSERT INTO kniga VALUES (49, 'Игра престолов', 'Джордж Мартин', 'фэнтези', 'власть', 1996);
INSERT INTO kniga VALUES (50, 'Лев, колдунья и платяной шкаф', 'Клайв Льюис', 'фэнтези', 'детство', 1950);
INSERT INTO kniga VALUES (51, 'Маленький принц', 'Антуан де Сент-Экзюпери', 'сказка', 'дружба', 1943);
INSERT INTO kniga VALUES (52, 'Малыш и Карлсон, который живёт на крыше', 'Астрид Линдгрен', 'повесть', 'детство', 1955);
INSERT INTO kniga VALUES (53, 'Пеппи Длинныйчулок', 'Астрид Линдгрен', 'повесть', 'детство', 1945);
INSERT INTO kniga VALUES (54, 'Винни-Пух и все-все-все', 'Алан Милн', 'сказка', 'дружба', 1926);
INSERT INTO kniga VALUES (55, 'Приключения Тома Сойера', 'Марк Твен', 'повесть', 'детство', 1876);
INSERT INTO kniga VALUES (56, 'Приключения Гекльберри Финна', 'Марк Твен', 'повесть', 'путешествия', 1884);
INSERT INTO kniga VALUES (57, 'Старик Хоттабыч', 'Лазарь Лагин', 'повесть', 'детство', 1938);
INSERT INTO kniga VALUES (58, 'Денискины рассказы', 'Виктор Драгунский', 'рассказы', 'детство', 1966);
INSERT INTO kniga VALUES (59, 'Тимур и его команда', 'Аркадий Гайдар', 'повесть', 'дружба', 1940);
INSERT INTO kniga VALUES (60, 'Чук и Гек', 'Аркадий Гайдар', 'повесть', 'семья', 1939);
INSERT INTO kniga VALUES (61, 'Волшебник Изумрудного города', 'Александр Волков', 'сказка', 'путешествия', 1939);
INSERT INTO kniga VALUES (62, 'Приключения Незнайки и его друзей', 'Николай Носов', 'повесть', 'детство', 1954);
INSERT INTO kniga VALUES (63, 'Незнайка на Луне', 'Николай Носов', 'повесть', 'космос', 1965);
INSERT INTO kniga VALUES (64, 'Конёк-Горбунок', 'Пётр Ершов', 'сказка', 'добро', 1834);
INSERT INTO kniga VALUES (65, 'Остров сокровищ', 'Роберт Льюис Стивенсон', 'приключения', 'путешествия', 1883);
INSERT INTO kniga VALUES (66, 'Три мушкетёра', 'Александр Дюма', 'приключения', 'дружба', 1844);
INSERT INTO kniga VALUES (67, 'Граф Монте-Кристо', 'Александр Дюма', 'приключения', 'месть', 1844);
INSERT INTO kniga VALUES (68, 'Робинзон Крузо', 'Даниель Дефо', 'приключения', 'путешествия', 1719);
INSERT INTO kniga VALUES (69, 'Двадцать тысяч лье под водой', 'Жюль Верн', 'приключения', 'путешествия', 1870);
INSERT INTO kniga VALUES (70, 'Дети капитана Гранта', 'Жюль Верн', 'приключения', 'путешествия', 1868);
INSERT INTO kniga VALUES (71, 'Таинственный остров', 'Жюль Верн', 'приключения', 'путешествия', 1874);
INSERT INTO kniga VALUES (72, 'Белый клык', 'Джек Лондон', 'повесть', 'дружба', 1906);
INSERT INTO kniga VALUES (73, 'Зов предков', 'Джек Лондон', 'повесть', 'путешествия', 1903);
INSERT INTO kniga VALUES (74, 'Копи царя Соломона', 'Генри Райдер Хаггард', 'приключения', 'путешествия', 1885);
INSERT INTO kniga VALUES (75, 'Пётр Первый', 'Алексей Толстой', 'роман', 'власть', 1945);
INSERT INTO kniga VALUES (76, 'Чингисхан', 'Василий Ян', 'роман', 'война', 1939);
INSERT INTO kniga VALUES (77, 'Батый', 'Василий Ян', 'роман', 'война', 1942);
INSERT INTO kniga VALUES (78, 'Слово и дело', 'Валентин Пикуль', 'роман', 'власть', 1974);
INSERT INTO kniga VALUES (79, 'Фаворит', 'Валентин Пикуль', 'роман', 'власть', 1984);
INSERT INTO kniga VALUES (80, 'Август Четырнадцатого', 'Александр Солженицын', 'роман', 'война', 1971);
INSERT INTO kniga VALUES (81, 'Думай медленно... решай быстро', 'Даниэль Канеман', 'публицистика', 'саморазвитие', 2011);
INSERT INTO kniga VALUES (82, 'Психология влияния', 'Роберт Чалдини', 'публицистика', 'саморазвитие', 1984);
INSERT INTO kniga VALUES (83, 'Эмоциональный интеллект', 'Дэниел Гоулман', 'публицистика', 'саморазвитие', 1995);
INSERT INTO kniga VALUES (84, 'Человек в поисках смысла', 'Виктор Франкл', 'публицистика', 'саморазвитие', 1946);
INSERT INTO kniga VALUES (85, 'Игры, в которые играют люди', 'Эрик Берн', 'публицистика', 'семья', 1964);
INSERT INTO kniga VALUES (86, 'Как перестать беспокоиться и начать жить', 'Дейл Карнеги', 'публицистика', 'саморазвитие', 1948);
INSERT INTO kniga VALUES (87, 'Атомные привычки', 'Джеймс Клир', 'публицистика', 'саморазвитие', 2018);
INSERT INTO kniga VALUES (88, 'Поток. Психология оптимального переживания', 'Михай Чиксентмихайи', 'публицистика', 'саморазвитие', 1990);
INSERT INTO kniga VALUES (89, 'Совершенный код', 'Стив Макконнелл', 'учебник', 'компьютеры', 2004);
INSERT INTO kniga VALUES (90, 'Чистый код', 'Роберт Мартин', 'учебник', 'компьютеры', 2008);
INSERT INTO kniga VALUES (91, 'Грокаем алгоритмы', 'Адитья Бхаргава', 'учебник', 'компьютеры', 2016);
INSERT INTO kniga VALUES (92, 'Изучаем Python', 'Марк Лутц', 'учебник', 'компьютеры', 2013);
INSERT INTO kniga VALUES (93, 'Python и анализ данных', 'Уэс Маккинни', 'учебник', 'компьютеры', 2012);
INSERT INTO kniga VALUES (94, 'PostgreSQL изнутри', 'Егор Рогов', 'учебник', 'компьютеры', 2022);
INSERT INTO kniga VALUES (95, 'Алгоритмы. Построение и анализ', 'Томас Кормен', 'учебник', 'компьютеры', 1990);
INSERT INTO kniga VALUES (96, 'Искусство программирования. Том 1', 'Дональд Кнут', 'учебник', 'компьютеры', 1968);
INSERT INTO kniga VALUES (97, 'Богатый папа, бедный папа', 'Роберт Кийосаки', 'публицистика', 'деньги', 1997);
INSERT INTO kniga VALUES (98, 'Капитал. Критика политической экономии', 'Карл Маркс', 'публицистика', 'деньги', 1867);
INSERT INTO kniga VALUES (99, 'Чёрный лебедь', 'Нассим Талеб', 'публицистика', 'деньги', 2007);
INSERT INTO kniga VALUES (100, 'От нуля к единице', 'Питер Тиль', 'публицистика', 'деньги', 2014);
INSERT INTO kniga VALUES (101, 'Экономика всего. Как институты определяют нашу жизнь', 'Александр Аузан', 'публицистика', 'деньги', 2014);
INSERT INTO kniga VALUES (102, 'Стив Джобс', 'Уолтер Айзексон', 'биография', 'компьютеры', 2011);
INSERT INTO kniga VALUES (103, 'Эйнштейн. Его жизнь и его вселенная', 'Уолтер Айзексон', 'биография', 'наука', 2007);
INSERT INTO kniga VALUES (104, 'Дневник Анны Франк', 'Анна Франк', 'биография', 'война', 1947);
INSERT INTO kniga VALUES (105, 'Воспоминания', 'Андрей Сахаров', 'биография', 'наука', 1990);
INSERT INTO kniga VALUES (106, 'Екатерина Великая. Портрет женщины', 'Роберт Мэсси', 'биография', 'власть', 2011);
INSERT INTO kniga VALUES (107, 'Пётр Великий. Жизнь и мир', 'Роберт Мэсси', 'биография', 'власть', 1980);

-- выдачи
INSERT INTO vydacha VALUES (1, 1, 21, '2026-06-14', '2026-06-28', '2026-06-28', 5);
INSERT INTO vydacha VALUES (2, 1, 1, '2026-07-02', '2026-07-16', '2026-07-21', 3);
INSERT INTO vydacha VALUES (3, 1, 4, '2026-07-20', '2026-08-03', '2026-08-08', 2);
INSERT INTO vydacha VALUES (4, 1, 36, '2026-08-09', '2026-08-23', NULL, NULL);
INSERT INTO vydacha VALUES (5, 2, 3, '2026-06-19', '2026-07-03', '2026-07-01', 5);
INSERT INTO vydacha VALUES (6, 2, 15, '2026-07-07', '2026-07-21', '2026-07-19', 3);
INSERT INTO vydacha VALUES (7, 2, 4, '2026-07-25', '2026-08-08', '2026-08-04', 3);
INSERT INTO vydacha VALUES (8, 2, 5, '2026-08-24', '2026-09-07', NULL, NULL);
INSERT INTO vydacha VALUES (9, 3, 2, '2026-06-23', '2026-07-07', '2026-07-12', 4);
INSERT INTO vydacha VALUES (10, 3, 15, '2026-07-11', '2026-07-25', '2026-07-30', 1);
INSERT INTO vydacha VALUES (11, 3, 36, '2026-07-29', '2026-08-12', '2026-08-09', 4);
INSERT INTO vydacha VALUES (12, 3, 12, '2026-08-16', '2026-08-30', '2026-08-29', 3);
INSERT INTO vydacha VALUES (13, 3, 7, '2026-08-08', '2026-08-22', NULL, NULL);
INSERT INTO vydacha VALUES (14, 4, 32, '2026-04-18', '2026-05-02', '2026-04-29', 5);
INSERT INTO vydacha VALUES (15, 4, 1, '2026-05-06', '2026-05-20', '2026-05-19', 3);
INSERT INTO vydacha VALUES (16, 4, 4, '2026-05-24', '2026-06-07', '2026-06-03', 3);
INSERT INTO vydacha VALUES (17, 4, 3, '2026-06-11', '2026-06-25', '2026-06-24', 4);
INSERT INTO vydacha VALUES (18, 5, 82, '2026-04-27', '2026-05-11', '2026-05-09', 4);
INSERT INTO vydacha VALUES (19, 5, 15, '2026-05-15', '2026-05-29', '2026-05-29', 3);
INSERT INTO vydacha VALUES (20, 5, 2, '2026-06-02', '2026-06-16', '2026-06-13', 2);
INSERT INTO vydacha VALUES (21, 5, 36, '2026-08-25', '2026-09-08', NULL, NULL);
INSERT INTO vydacha VALUES (22, 6, 1, '2026-02-13', '2026-02-27', '2026-02-27', 4);
INSERT INTO vydacha VALUES (23, 6, 2, '2026-03-03', '2026-03-17', '2026-03-17', 3);
INSERT INTO vydacha VALUES (24, 6, 36, '2026-03-21', '2026-04-04', '2026-04-02', 3);
INSERT INTO vydacha VALUES (25, 6, 11, '2026-04-08', '2026-04-22', '2026-04-22', 4);
INSERT INTO vydacha VALUES (26, 6, 29, '2026-08-24', '2026-09-07', NULL, NULL);
INSERT INTO vydacha VALUES (27, 7, 45, '2026-03-27', '2026-04-10', '2026-04-15', 4);
INSERT INTO vydacha VALUES (28, 7, 15, '2026-04-14', '2026-04-28', '2026-04-25', 4);
INSERT INTO vydacha VALUES (29, 7, 2, '2026-05-02', '2026-05-16', '2026-05-16', 3);
INSERT INTO vydacha VALUES (30, 7, 36, '2026-08-19', '2026-09-02', NULL, NULL);
INSERT INTO vydacha VALUES (31, 8, 99, '2026-05-25', '2026-06-08', '2026-06-05', 4);
INSERT INTO vydacha VALUES (32, 8, 15, '2026-06-12', '2026-06-26', '2026-06-22', 4);
INSERT INTO vydacha VALUES (33, 8, 4, '2026-06-30', '2026-07-14', '2026-07-11', 5);
INSERT INTO vydacha VALUES (34, 8, 3, '2026-07-18', '2026-08-01', '2026-07-30', 3);
INSERT INTO vydacha VALUES (35, 9, 8, '2026-07-04', '2026-07-18', '2026-07-14', 5);
INSERT INTO vydacha VALUES (36, 9, 15, '2026-07-22', '2026-08-05', '2026-08-04', 2);
INSERT INTO vydacha VALUES (37, 9, 4, '2026-08-09', '2026-08-23', '2026-08-19', 5);
INSERT INTO vydacha VALUES (38, 9, 42, '2026-08-27', '2026-09-10', '2026-09-06', 3);
INSERT INTO vydacha VALUES (39, 9, 5, '2026-08-26', '2026-09-09', NULL, NULL);
INSERT INTO vydacha VALUES (40, 10, 46, '2026-05-04', '2026-05-18', '2026-05-15', 4);
INSERT INTO vydacha VALUES (41, 10, 76, '2026-05-22', '2026-06-05', '2026-06-10', 2);
INSERT INTO vydacha VALUES (42, 10, 17, '2026-06-09', '2026-06-23', '2026-06-28', 2);
INSERT INTO vydacha VALUES (43, 10, 36, '2026-08-07', '2026-08-21', NULL, NULL);
INSERT INTO vydacha VALUES (44, 11, 21, '2026-05-04', '2026-05-18', '2026-05-23', 5);
INSERT INTO vydacha VALUES (45, 11, 1, '2026-05-22', '2026-06-05', '2026-06-03', 4);
INSERT INTO vydacha VALUES (46, 11, 10, '2026-06-09', '2026-06-23', '2026-06-23', 4);
INSERT INTO vydacha VALUES (47, 11, 43, '2026-08-24', '2026-09-07', NULL, NULL);
INSERT INTO vydacha VALUES (48, 12, 36, '2026-03-18', '2026-04-01', '2026-03-30', 5);
INSERT INTO vydacha VALUES (49, 12, 104, '2026-04-05', '2026-04-19', '2026-04-18', 3);
INSERT INTO vydacha VALUES (50, 12, 2, '2026-04-23', '2026-05-07', '2026-05-05', 4);
INSERT INTO vydacha VALUES (51, 12, 5, '2026-05-11', '2026-05-25', '2026-05-24', 5);
INSERT INTO vydacha VALUES (52, 12, 106, '2026-05-29', '2026-06-12', '2026-06-12', 4);
INSERT INTO vydacha VALUES (53, 13, 4, '2026-05-26', '2026-06-09', '2026-06-09', 4);
INSERT INTO vydacha VALUES (54, 13, 80, '2026-06-13', '2026-06-27', '2026-06-23', 2);
INSERT INTO vydacha VALUES (55, 13, 3, '2026-07-01', '2026-07-15', '2026-07-15', 2);
INSERT INTO vydacha VALUES (56, 13, 5, '2026-08-21', '2026-09-04', NULL, NULL);
INSERT INTO vydacha VALUES (57, 14, 93, '2026-04-15', '2026-04-29', '2026-04-26', 5);
INSERT INTO vydacha VALUES (58, 14, 16, '2026-05-03', '2026-05-17', '2026-05-17', 5);
INSERT INTO vydacha VALUES (59, 14, 2, '2026-05-21', '2026-06-04', '2026-06-04', 5);
INSERT INTO vydacha VALUES (60, 14, 36, '2026-08-26', '2026-09-09', NULL, NULL);
INSERT INTO vydacha VALUES (61, 15, 83, '2026-06-12', '2026-06-26', '2026-07-01', 5);
INSERT INTO vydacha VALUES (62, 15, 1, '2026-06-30', '2026-07-14', '2026-07-19', 3);
INSERT INTO vydacha VALUES (63, 15, 2, '2026-07-18', '2026-08-01', '2026-07-28', 4);
INSERT INTO vydacha VALUES (64, 15, 36, '2026-08-05', '2026-08-19', '2026-08-19', 4);
INSERT INTO vydacha VALUES (65, 15, 5, '2026-08-06', '2026-08-20', NULL, NULL);
INSERT INTO vydacha VALUES (66, 16, 1, '2026-06-17', '2026-07-01', '2026-06-27', 4);
INSERT INTO vydacha VALUES (67, 16, 4, '2026-07-05', '2026-07-19', '2026-07-19', 5);
INSERT INTO vydacha VALUES (68, 16, 3, '2026-07-23', '2026-08-06', '2026-08-06', 4);
INSERT INTO vydacha VALUES (69, 16, 11, '2026-08-10', '2026-08-24', '2026-08-20', 5);
INSERT INTO vydacha VALUES (70, 17, 44, '2026-06-16', '2026-06-30', '2026-06-30', 5);
INSERT INTO vydacha VALUES (71, 17, 1, '2026-07-04', '2026-07-18', '2026-07-18', 5);
INSERT INTO vydacha VALUES (72, 17, 10, '2026-07-22', '2026-08-05', '2026-08-02', 3);
INSERT INTO vydacha VALUES (73, 17, 36, '2026-08-24', '2026-09-07', NULL, NULL);
INSERT INTO vydacha VALUES (74, 18, 98, '2026-06-13', '2026-06-27', '2026-06-26', 5);
INSERT INTO vydacha VALUES (75, 18, 1, '2026-07-01', '2026-07-15', '2026-07-13', 4);
INSERT INTO vydacha VALUES (76, 18, 4, '2026-07-19', '2026-08-02', '2026-07-31', 4);
INSERT INTO vydacha VALUES (77, 18, 3, '2026-08-06', '2026-08-20', '2026-08-20', 4);
INSERT INTO vydacha VALUES (78, 18, 11, '2026-08-19', '2026-09-02', NULL, NULL);
INSERT INTO vydacha VALUES (79, 19, 103, '2026-04-30', '2026-05-14', '2026-05-14', 4);
INSERT INTO vydacha VALUES (80, 19, 1, '2026-05-18', '2026-06-01', '2026-05-30', 5);
INSERT INTO vydacha VALUES (81, 19, 4, '2026-06-05', '2026-06-19', '2026-06-16', 4);
INSERT INTO vydacha VALUES (82, 19, 37, '2026-08-27', '2026-09-10', NULL, NULL);
INSERT INTO vydacha VALUES (83, 20, 51, '2026-02-18', '2026-03-04', '2026-03-04', 5);
INSERT INTO vydacha VALUES (84, 20, 16, '2026-03-08', '2026-03-22', '2026-03-27', 2);
INSERT INTO vydacha VALUES (85, 20, 4, '2026-03-26', '2026-04-09', '2026-04-14', 1);
INSERT INTO vydacha VALUES (86, 20, 36, '2026-04-13', '2026-04-27', '2026-04-24', 2);
INSERT INTO vydacha VALUES (87, 1, 11, '2026-01-31', '2026-02-14', '2026-02-13', 4);
INSERT INTO vydacha VALUES (88, 2, 54, '2026-03-14', '2026-03-28', '2026-03-24', 4);
INSERT INTO vydacha VALUES (89, 3, 21, '2026-03-27', '2026-04-10', '2026-04-07', 4);
INSERT INTO vydacha VALUES (90, 4, 23, '2026-04-19', '2026-05-03', '2026-05-02', 5);
INSERT INTO vydacha VALUES (91, 5, 8, '2026-01-19', '2026-02-02', '2026-02-01', 3);
INSERT INTO vydacha VALUES (92, 8, 21, '2026-03-24', '2026-04-07', '2026-04-03', 4);
INSERT INTO vydacha VALUES (93, 9, 23, '2026-02-14', '2026-02-28', '2026-02-27', 4);
INSERT INTO vydacha VALUES (94, 10, 54, '2025-12-23', '2026-01-06', '2026-01-04', 5);
INSERT INTO vydacha VALUES (95, 11, 5, '2025-12-28', '2026-01-11', '2026-01-08', 4);
INSERT INTO vydacha VALUES (96, 12, 15, '2026-04-06', '2026-04-20', '2026-04-20', 3);

DROP VIEW IF EXISTS v_priznaki_prosrochki;
CREATE VIEW v_priznaki_prosrochki AS
SELECT
	v.vydacha_id,
	v.chitatel_id,
	c.fio,
	c.vozrast,
	c.lyubimyy_zhanr,
	c.lyubimaya_tema,
	k.kniga_id,
	k.nazvanie,
	k.avtor,
	k.zhanr,
	k.tema,
	v.data_vydachi,
	v.srok_sdachi,
	v.data_vozvrata,
	v.otsenka,
	(v.srok_sdachi - v.data_vydachi) AS srok_dney,
	CASE
		WHEN v.data_vozvrata IS NOT NULL AND v.data_vozvrata > v.srok_sdachi THEN 1
		WHEN v.data_vozvrata IS NULL AND v.srok_sdachi < CURRENT_DATE THEN 1
		ELSE 0
	END AS prosrochka,
	CASE
		WHEN v.data_vozvrata IS NULL THEN 1
		ELSE 0
	END AS na_rukah,
	CASE
		WHEN k.zhanr = c.lyubimyy_zhanr THEN 1
		ELSE 0
	END AS zhanr_sovpal,
	CASE
		WHEN k.tema = c.lyubimaya_tema THEN 1
		ELSE 0
	END AS tema_sovpala,
	COUNT(v.vydacha_id) OVER (PARTITION BY k.kniga_id) AS skok_brali,
	AVG(v.otsenka) OVER (PARTITION BY k.kniga_id) AS sred_ocenka_knigi
FROM vydacha AS v
JOIN chitatel AS c ON c.chitatel_id = v.chitatel_id
JOIN kniga AS k ON k.kniga_id = v.kniga_id;
