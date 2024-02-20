
---- 1. FACULTATE ----
create table facultate (
 cod_facultate number(4) primary key,
 denumire varchar2(40),
 email varchar2(40)
);

---- 2. STUDENT ----
create table student (
 cod_student number(6) primary key,
 cod_facultate number (4),
 an number(1),
 serie char(1),
 grupa number (4),
 media number(3,1), -- intre 0.0 si 10.0
 constraint cod_fac_stud_FK foreign key (cod_facultate) references facultate(cod_facultate)
);
---- 3. MATERIE ----
create table materie (
    cod_materie number(4),
    denumire varchar2(35),
    nume_profesor varchar2(20),
    prenume_profesor varchar2(25),
    constraint cod_mat_PK primary key (cod_materie)
);
---- 4. NOTE ----
create table note (
 cod_nota number(7) primary key, 
 cod_student number(6),
 cod_materie number(4),
 nota_obt number(3,2),  -- intre 0.00 si 10.00
 data date,
 constraint cod_mat_FK foreign key (cod_materie) references materie(cod_materie),
 constraint cod_stud_FK foreign key (cod_student) references student(cod_student)
);

---- 5. DATE PERSONALE ----
create table date_personale (
 cod_student number(6) primary key,
 cnp number (13) unique,
 nume varchar2(25),  
 initiala_tata char(1),
 prenume varchar2(25),
 data_nasterii date,
 localitate varchar2(20),
 judet varchar2(20),
 email varchar2(40),
 constraint cod_stud_dp_FK foreign key (cod_student) references student(cod_student)
);

--- adaugare facultati ---
insert into facultate values (507, 'CSIE', 'csie.ase@ase.ro');
insert into facultate values (514, 'FABIZ', 'fabiz.ase@ase.ro');
insert into facultate values (418, 'REI', 'rei.ase@ase.ro');
insert into facultate values(588,'MAN', 'man.ase@ase.ro');
insert into facultate values (433,'FAMP','famp.ase@ase.ro');
insert into facultate values(221,'BT','bt.ase@ase.ro');
insert into facultate values(101,'CIG','cig.ase@ase.ro');
insert into facultate values(788,'DREPT','drept.ase@ase.ro');
insert into facultate values(341,'ECONOMIE','economie.ase@ase.ro');
insert into facultate values(565,'EAM','eam.ase@ase.ro');
insert into facultate values(321,'FABBV','fabbv.ase@ase.ro');
select * from facultate;
 

--Adăugarea de înregistrări în fiecare tabelă
-- inreg nr 1 --
insert into student values (609, 507, 2, 'A', 1570, 9.4);
insert into materie values (15, 'PSM', 'Ionescu', 'Daniel');
insert into note values (123456, 609, 15, 7.0, TO_DATE('15-11-2022', 'DD-MM-YYYY'));
insert into date_personale values (609, 1234567891234, 'Iordache', 'C', 'Andrei', TO_DATE('15-11-2003', 'DD-MM-YYYY'), 'Brasov', 'Brasov', 'iordache_a@stud.nase.aro');

-- inreg 2 --
insert into student values (610, 507, 2, 'C', 1579, 8.4);
insert into materie values (18, 'Statistica', 'Popescu', 'Rodica');
insert into note values (123457, 610, 18, 8.65, TO_DATE('18-11-2022', 'DD-MM-YYYY'));
insert into date_personale values (610, 1234567891345, 'Patrocle', 'L', 'Lizuca', TO_DATE('18-11-2002', 'DD-MM-YYYY'), 'Arges', 'Arges', 'patrocle_l@stud.nase.aro');

-- inregistrarea nr 3 --
insert into student values (611, 507, 3, 'E', 1601, 6.2);
insert into materie values (21, 'Practica', 'Sandu', 'Adrian');
insert into note values (123488, 611, 21, 8.5, TO_DATE('10-03-2022', 'DD-MM-YYYY'));
insert into date_personale values (611, 1234567001345, 'Mircea', 'A', 'Anca', TO_DATE('10-07-2002', 'DD-MM-YYYY'), 'Bucuresti', 'Bucuresti', 'mircea_a@stud.nase.aro');

-- inregistrarea nr 4 --
insert into student values (612, 588, 3, 'A', 1001, 8.2);
insert into materie values (28, 'Microeconomie', 'Alexandrini', 'Adam');
insert into note values (123998, 612, 28, 5.5, TO_DATE('01-05-2020', 'DD-MM-YYYY'));
insert into date_personale values (612, 1239467001345, 'Mirea', 'S', 'Alexandru', TO_DATE('23-04-2002', 'DD-MM-YYYY'), 'Campulung', 'Arges', 'mirea_alex@stud.nase.aro');

-- inregistrarea nr 5 --
insert into student values (613, 433, 2, 'B', 1251, 7.0);
insert into materie values (37, 'Matematici-aplicate', 'Andreescu', 'Elena');
insert into note values (132998, 613, 37, 7.5, TO_DATE('05-04-2021', 'DD-MM-YYYY'));
insert into date_personale values (613, 1239468801345, 'Petre', 'B', 'Bianca', TO_DATE('11-04-2002', 'DD-MM-YYYY'), 'Campina', 'Prahova', 'petre_b@stud.nase.aro');

---inregistrarea nr 6---
insert into student values (614, 101, 1, 'A', 1151, 6.0);
insert into materie values (25, 'Intr. in contabilitate', 'Soare', 'Claudia');
insert into note values (144998, 614, 25, 5.5, TO_DATE('03-03-2022', 'DD-MM-YYYY'));
insert into date_personale values (614, 6339468801345, 'Enache', 'D', 'Tudor', TO_DATE('19-02-2004', 'DD-MM-YYYY'), 'Motru', 'Gorj', 'enache_t@stud.nase.aro');

---inregistrarea nr 7---
insert into student values (615, 101, 1, 'B', 1157, 8.3);
insert into materie values (76, 'TAO', 'Achim', 'Otilia');
insert into note values (144008, 614, 76, 9.5, TO_DATE('05-03-2022', 'DD-MM-YYYY'));
insert into date_personale values (615, 6330968801345, 'Popescu', 'L', 'Mihai', TO_DATE('9-08-2004', 'DD-MM-YYYY'), 'Negru Voda', 'Constanta', 'popescu_m@stud.nase.aro');

---inregistrarea nr 8---
insert into student values (616, 341, 2, 'D', 1007, 4.3);
insert into materie values (81, 'Macroeconomie', 'Andronache', 'Iustin');
insert into note values (145608, 616, 81, 4.0, TO_DATE('26-03-2023', 'DD-MM-YYYY'));
insert into date_personale values (616, 6330968321345, 'Doroftei', 'M', 'Augustin', TO_DATE('16-08-2003', 'DD-MM-YYYY'), 'Oradea', 'Oradea', 'doroftei_a@stud.nase.aro');

---inregistrarea nr 9---
insert into student values (617, 321, 2, 'B', 1677, 6.7);
insert into materie values (80, 'Moneda', 'Calota', 'Andreea');
insert into note values (265608, 617, 80, 8.0, TO_DATE('17-01-2023', 'DD-MM-YYYY'));
insert into date_personale values (617, 2430968321345, 'Dragan', 'N', 'Paula', TO_DATE('20-11-2003', 'DD-MM-YYYY'), 'Slatina', 'Olt', 'dragan_p@stud.nase.aro');

---inregistrarea nr 10---
insert into student values (618, 418, 1, 'D', 1123, 8.7);
insert into materie values (66, 'Germana', 'Caliman', 'Petru');
insert into note values (262108, 618, 66, 7.5, TO_DATE('19-01-2022', 'DD-MM-YYYY'));
insert into date_personale values (618, 2430944421345, 'Cezar', 'P', 'Dorian', TO_DATE('25-08-2004', 'DD-MM-YYYY'), 'Buzau', 'Buzau', 'cezar_d@stud.nase.aro');

---inregistrarea nr 11---
insert into student values (619, 507, 2, 'A', 1043, 6.7);
insert into materie values (46, 'Algebra', 'Caliman', 'Sorina');
insert into note values (299108, 619, 46, 6.5, TO_DATE('15-10-2023', 'DD-MM-YYYY'));
insert into date_personale values (619, 2436644421345, 'Fluieras', 'P', 'Robert', TO_DATE('25-08-2003', 'DD-MM-YYYY'), 'Galati', 'Galati', 'fluieras_r@stud.nase.aro');

select * from note;
 
select * from student;
 
select * from materie;
 
select * from date_personale;
 

--5.Actualizarea structurii tabelelor si modificarea restricțiilor de integritate
--5.1 Sa se adauge coloana varsta  in tabela student.
alter table student add (varsta number(2))
select * from student;
 
--5.2 Sa se modifice tipul de date al nume_profesor  din tabela materie
alter table materie modify (nume_profesor varchar2(35))
 
--5.3 Să se realizeze ștergerea coloanei varsta din tabela student.
alter table student drop column varsta
select * from student
 
--5.4 Redenumirea tabelei materie in disciplină.
alter table materie rename to disciplina
/* SAU: rename materie to disciplina */
select * from disciplina
 

--5.5 Adaugarea unei restrictii asupra coloanei nota_obt din note, astfel incat sa nu apara notele mai mici sau egale ca 3.50 si mai mari ca 9.60.
ALTER TABLE note ADD CONSTRAINT ck_nota CHECK (nota_obt>=3.50 and nota_obt <9.60)
select * from note;
 
--5.6 Dezactivarea restrictiei de mai sus.
alter table note disable constraint ck_nota;
select * from note;

 

--5.7 Stergerea unei restrictii.
ALTER TABLE note DROP CONSTRAINT ck_nota;
 

--6. Actualizarea inregistrarilor
/*select-regaseste inregistrari in tabele 
delete-sterge o inregistrare din tabela
insert-insereaza/adauga o noua inregistrare in tabela
update-mofica o inregistrare din baza de date*/

--6.1 Să se actualizeze numele studentului al cărui cod_student este 609.
update date_personale set nume='PATROCLE' where cod_student=609;
select * from date_personale
 
--6.2 Să se steargă studentul al carui prenume este Anca.
delete from date_personale where prenume='Anca';
select * from date_personale
 

--7.Ștergerea și recuperarea unei tabele
--(voi lucra pe o copie a tabelei facultate)
create table tab1 as select * from facultate;
select * from tab1
 
drop table tab1 ;
 
flashback table tab1 to before drop;


--8.	Exemple de interogări variate
--funcţii single-row
--8.1 Sa se afiseze salariatii al caror prenume incepe cu litera A.
SELECT * FROM date_personale WHERE UPPER(prenume) LIKE 'A%';
 
--8.2 Sa se afiseze cu litere mari denumirea materiei/disciplinei al carui cod_materie este 81.
select * from disciplina
SELECT UPPER (denumire) FROM disciplina WHERE cod_materie=81;
 
--8.3 Sa se afiseze codul studentului, numele si email-ul pentru toti studentii cu prenumele Mihai utilizand functiile INITCAP, UPPER,LOWER.
SELECT cod_student, nume, email FROM date_personale WHERE UPPER(prenume)='MIHAI'
SELECT cod_student, nume, email FROM date_personale WHERE LOWER(prenume)='mihai'
SELECT cod_student, nume, email FROM date_personale WHERE initcap(prenume)='Mihai'
 
--8.4 Sa se afiseze notele obtinute  in anii 2021 si 2022.
select * from note;
SELECT nota_obt, data FROM note WHERE EXTRACT(YEAR FROM data) IN (2021, 2022);
 
--8.5 Sa se afiseze notele obtinute in luna martie.
SELECT nota_obt, data FROM note WHERE EXTRACT(MONTH FROM data) IN 3;
 
--8.6 Sa se afiseze lungimea numelui, lungimea prenumelui, daca acestea sunt egale sa se returneze nul ca rezultat, iar daca nu sunt egale se va returna lungimea numelui.
SELECT LENGTH(nume), LENGTH(prenume), NULLIF(LENGTH(nume),LENGTH(prenume)),nume,prenume FROM date_personale
 
--8.7 Să se afişeze notele obtinute cu 3 luni in urma.
SELECT nota_obt FROM note WHERE MONTHS_BETWEEN(sysdate,data)=3
select * from note
 
--Funcții de grup 
--8.8 Să se afişeze data primei note obtinute şi data celei mai vechi note obtinute.
SELECT MIN(data), MAX(data) FROM note;
 
--8.9 Să se afişeze numărul de note daca acestea sunt mai mari sau egale cu 7.50.
select * from note
SELECT COUNT(*) nota_obt FROM note WHERE nota_obt>=7.50
 
--8.10. Să se afișeze numărul total de studenți pentru care initiala tatalui este L.
SELECT COUNT(cod_student) FROM date_personale where initiala_tata='L'
select * from date_personale
 

--Cereri imbricate
--8.11. Sa se selecteze studentii care sunt in aceeasi facultate  cu studentul al carui cod_student este 609.
SELECT * FROM student WHERE cod_facultate IN (SELECT cod_facultate FROM student WHERE cod_student=609);
 
--8.12. Să se selecteze toți studenții care este la facultatea 507 si care au media mai mică decat oricare dintre studentii care sunt la facultatea 588.
SELECT * from student WHERE cod_facultate=507 AND 
media <ANY(SELECT media FROM student WHERE cod_facultate=588)
 
--8.13 Să se afişeze studentii care nu invata in facultatea 507 si a caror medie este mai mica decat fiecare dintre mediile studentilor care  invata in facultatea 507.
SELECT * from student  WHERE media < ALL (SELECT media FROM student WHERE cod_facultate = 507) AND cod_facultate!=507 ORDER BY media DESC;
 

--Joncțiuni
--8.14 Afișează numele și prenumele studenților dintr-o anumită facultate (de exemplu, CSIE).
SELECT dp.nume, dp.prenume FROM date_personale dp JOIN student s ON dp.cod_student = s.cod_student JOIN facultate f ON s.cod_facultate = f.cod_facultate WHERE f.denumire = 'CSIE';
 
--8.15  Sa se selecteze cod_student, anul, seria, grupa, media din tabela student  si nume, prenumele din tabela date_personale si sa se realizeze jonctiunea dintre cele doua tabele
SELECT s.cod_student, dp.nume, dp.prenume, s.an, s.serie, s.grupa, s.media
FROM student s JOIN date_personale dp ON s.cod_student = dp.cod_student;
 
--8.16  Să se afiseze codul, numele, prenumele, anul, seria, grupa și media pentru toți studenții, din tabela 'student', însoțite de datele personale din tabela 'date_personale'.
SELECT s.cod_student, dp.nume, dp.prenume, s.an, s.serie, s.grupa, s.media FROM student s
LEFT JOIN date_personale dp ON s.cod_student = dp.cod_student;
 

--MINUS
--8.17 Sa se afiseze studentii care au media intre 6 si 9 fara cei care au media intre 7.
SELECT * FROM student WHERE media BETWEEN 6 AND 9 MINUS SELECT * FROM student WHERE media IN 7;
 
--UNION
--8.18 Sa se afiseze studentii care au media intre 6.50 si 8.50 impreuna cu cei care au media intre 7 si 9.
SELECT * FROM student WHERE media BETWEEN 6.50 AND 8.50 union SELECT * FROM student WHERE media IN (7,9);
 
--INTERSECT
--8.19 Să se afiseze codurile_facultate care sunt prezente atat in tabela student, cat si in tabela facultate.
SELECT cod_facultate FROM student INTERSECT SELECT cod_facultate
FROM facultate;
 
--DECODE
--8.20 Să se afiseze denumirea facultatii in functie de codul facultatii. In caz contrar, se va afisa un mesaj corespunzator.
SELECT cod_facultate, DECODE(cod_facultate,507, 'CSIE', 514, 'FABIZ',418, 'REI','Alta facultate') AS denumire_facultate FROM facultate;
 
--CASE
--8.21 Să se afiseze denumirea facultatii in functie de codul facultatii. In caz contrar, se va afisa un mesaj corespunzator.
SELECT cod_facultate, 
    CASE cod_facultate
        WHEN 221 THEN 'BT'
        WHEN 514 THEN 'FABIZ'
        WHEN 101 THEN 'CIG'
        ELSE 'Alta facultate'
    END AS denumire_facultate
FROM facultate;
 

--STRUCTURI IERARHICE
--8.22 Sa se afiseze studentii si nivelul ierarhic al acestora pornind de la facultatea cu codul 507 (sa se ordoneze in functie de nivelul ierahic)
SELECT  nume, prenume,email LEVEL FROM date_personale
CONNECT BY PRIOR cod_facultate= cod_materie
START WITH cod_facultate = 507;

/* să se selecteze cod_student și sa numere nota_obt pentru fiecare student din tabelul note, iar apoi să se filtreze  rezultatele pentru a afișa doar studenții cu cel puțin două înregistrări pentru nota_obt.*/
SELECT cod_student, COUNT(nota_obt) FROM note GROUP BY cod_student
HAVING COUNT(nota_obt)>= 2
 

/*să se afiseze  numele, prenumele și denumirea facultății pentru studenții care au o medie generală a notelor mai mare de 7.0.*/
SELECT dp.nume, dp.prenume, f.denumire AS facultate, AVG(n.nota_obt) AS medie_generala
FROM date_personale dp JOIN student s ON dp.cod_student = s.cod_student JOIN note n ON s.cod_student = n.cod_student JOIN facultate f ON s.cod_facultate = f.cod_facultate
GROUP BY dp.nume, dp.prenume, f.denumire
HAVING AVG(n.nota_obt) > 7.0;
 
