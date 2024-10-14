USE TESTEDB;


/* QUESTÃO 2*/
CREATE TABLE T (
	ID INT PRIMARY KEY,
    S VARCHAR(40),
    I SMALLINT);
    
/*QUESTÃO 3 */
DESCRIBE T;

/*QUESTÃO 4*/
INSERT INTO T VALUES (1,'PRIMEIRO',0);
INSERT INTO T VALUES (2,'SEGUNDO',0);
INSERT INTO T VALUES (3, 'TERCEIRO',0);

/* QUESTÃO 5*/
SELECT * FROM T;

/* QUESTÃO 6 */
START TRANSACTION;

ROLLBACK;

SELECT * FROM T;

 /* QUESTÃO 7 */
START TRANSACTION;
INSERT INTO T (id, s) VALUES (4, ‘fourth’);
SELECT * FROM T ;
ROLLBACK;
SELECT * FROM T;


/*PARTE 2*/

/* QUESTÃO 8 */
SET AUTOCOMMIT = 0;

/*QUESTÃO 9 */

SET AUTOCOMMIT = 0; 
START TRANSACTION;
DELETE FROM T
WHERE ID != 0;
COMMIT;

UNLOCK TABLES ;
SELECT * FROM T;

DROP TABLE T;

/* QUESTÃO 10*/

INSERT INTO T (ID, S)
VALUES (6, 'Sexto'), (7, 'Setimo');

/* QUESTÃO 11 */

SELECT * FROM T;

/* QUESTÃO 12 */

ROLLBACK;

/* QUESTÃO 13 */

SELECT * FROM T;

/* QUESTÃO 14 */

/* SET AUTOCOMMIT = 0: Usado quando você precisa desabilitar o autocommit para várias transações em uma sessão, por exemplo, em um script ou aplicação que realiza várias operações relacionadas.
	START TRANSACTION: Usado quando você precisa iniciar uma transação específica e controlá-la de forma mais granular. É ideal para operações que envolvem várias instruções SQL e que você deseja garantir que sejam todas bem-sucedidas ou nenhuma seja.
*/

/* QUESTÃO 15 */

	SET AUTOCOMMIT = 0;
    START TRANSACTION;
    INSERT INTO T (ID, S) VALUES (8, 'Será persistido?');
    
/* QUESTÃO 16 */

	CREATE TABLE T2 (
    id INT
);

/* QUESTÃO 17 */
	INSERT INTO T2 (id)
VALUES (1);

/* QUERSTÃO 18 */

SELECT * FROM T2;

/* QUESTÃO 19 */

ROLLBACK;

/* QUESTÃO 20 */

SELECT * FROM T;



/*ATIVIDADE DE ISOLAMENTO*/

/* QUESTÃO 1*/

CREATE TABLE Contas (
idConta INTEGER NOT NULL PRIMARY KEY,
saldo INTEGER NOT NULL,
CONSTRAINT remains_nonnegative CHECK (saldo >= 0)
)ENGINE=InnoDB;


INSERT INTO Contas (idConta, saldo) VALUES (101, 1000);
INSERT INTO Contas (idConta, saldo) VALUES (202, 2000);

/* QUESTÃO 2 */

/*configuracao global*/
SELECT @@GLOBAL.transaction_isolation, @@transaction_isolation;

/*configuracao da sessão*/
SELECT @@SESSION.transaction_isolation,@@SESSION.transaction_read_only;

/* questão 3 */

/*SESSÃO A */


SET AUTOCOMMIT = 0;
SET TRANSACTION ISOLATION LEVEL
READ COMMITTED;
/*Valor a ser transferido por A*/
SET @valorA = 200;
SET @saldoA = 0; -- Init value
SELECT saldo INTO @saldoA
FROM Contas WHERE idConta = 101;
SET @saldoA = @saldoA - @valorA;
SELECT @saldoA;

UPDATE Contas
SET saldo = @saldoA
WHERE idConta = 101;

SELECT idConta, saldo
FROM Contas
WHERE idConta = 101;
COMMIT;


/* SESSÃO B */

SET AUTOCOMMIT = 0;
SET TRANSACTION
ISOLATION LEVEL READ COMMITTED;
-- Valor a ser transferido por B
SET @valorB = 500;
SET @saldoB = 0; -- inicializacao de valor
SELECT saldo INTO @saldoB
FROM Contas WHERE idConta = 101;
SET @saldoB = @saldoB - @valorB;

UPDATE Contas
SET saldo = @saldoB
WHERE idConta = 101;

SELECT idConta, saldo
FROM Contas
WHERE idConta = 101;
COMMIT;


/*a) O sistema se comportou como deveria?*/
/*Não, o sistema não se comportou como deveria. O comportamento observado é um exemplo clássico de problema de lost update (atualização perdida), que ocorre quando duas transações acessam os mesmos dados e os atualizam de forma concorrente.*/

/* b) Há evidência de perda de dados neste caso? Qual o problema? */ 
/* Sim, há evidência de perda de dados. O problema é a falta de isolamento adequado entre as transações. O nível de isolamento READ COMMITTED não é suficiente para evitar esse tipo de problema.*/ 

/* questão 4*/


START TRANSACTION;

COMMIT;

/* Ao utilizar o nível de isolamento SERIALIZABLE, garantimos a consistência das transações, mas pode comprometer o desempenho. A escolha do nível de isolamento ideal depende das necessidades específicas da sua aplicação. */

/* QUESTÃO 5 */

/* SESSÃO A*/

SET AUTOCOMMIT = 0;
SET TRANSACTION
ISOLATION LEVEL 
SERIALIZABLE;
-- Valor a ser transferido por A
SET @valorA = 200;
SET @saldoA = 0; -- Init value
SELECT saldo INTO @saldoA
FROM Contas WHERE 
idConta = 101;
SET @saldoA = @saldoA -
@valorA;
SELECT @saldoA;


UPDATE Contas
SET saldo = @saldoA
WHERE idConta = 101;

SELECT idConta, saldo
FROM Contas WHERE 
idConta = 101;
COMMIT;




/* SESSÃO B */

SET AUTOCOMMIT = 0;
SET TRANSACTION
ISOLATION LEVEL 
SERIALIZABLE;
-- Valor a ser transferido por B
SET @valorB = 500;
SET @saldoB = 0; -- Init value
SELECT saldo INTO @saldoB
FROM Contas WHERE 
idConta = 101;
SET @saldoB = @saldoB -
@valorB;


-- continue sem esperar A!
UPDATE Contas
SET saldo = @saldoB
WHERE idConta = 101;


SELECT idConta, saldo
FROM Contas WHERE 
idConta = 101;
COMMIT;


-- A Quais conclusões você chegou?
	-- Com o nível SERIALIZABLE, as transações serão executadas uma após a outra. Isso significa que, mesmo que as sessões A e B sejam iniciadas simultaneamente, o banco de dados garantirá que uma delas seja concluída antes que a outra comece.O problema de lost updates (atualizações perdidas) é completamente evitado. Isso ocorre porque, enquanto uma transação está em execução, nenhuma outra transação pode modificar os mesmos dados.

-- B – O que acontece de o SERIALIZABLE for substituído por ‘REPEATABLE READ’ em ambas as transações?
	-- Se substituirmos o nível de isolamento para REPEATABLE READ, o problema de lost updates pode ocorrer novamente. Isso porque, com o nível REPEATABLE READ, uma transação não vê as alterações feitas por outra transação enquanto ela estiver em execução. No entanto, se uma transação é interrompida e reiniciada, ela pode ver as alterações feitas por outras transações.
    
/* QUESTÃO 6*/

	/* SESSÃO A */
    
    SET AUTOCOMMIT = 0;
	SET TRANSACTION
	ISOLATION LEVEL 
	REPEATABLE READ;
	UPDATE Contas
	SET saldo = saldo - 100
	WHERE idConta = 101;
	UPDATE Contas
	SET saldo = saldo + 100
	WHERE idConta = 202;
    
    ROLLBACK;
    SELECT * FROM Contas;
    COMMIT;

	/* SESSÃO B*/
    
    SET AUTOCOMMIT = 0;
	SET TRANSACTION
	ISOLATION LEVEL READ 
UNCOMMITTED;
SELECT * FROM Contas;
COMMIT;

-- A – Quais conclusoes você chegou? O que pode ser dito sobre a confiabilidade da transação B?
	-- A transação A é relativamente confiável, desde que não haja outras transações concorrentes que possam interferir no mesmo momento. O nível de isolamento REPEATABLE READ garante que as leituras consistentes sejam feitas, e as atualizações são feitas de forma atômica.
    -- A transação B é altamente problemática. O nível de isolamento READ UNCOMMITTED permite que a transação leia dados não confirmados por outras transações. Isso significa que a Sessão B pode ler um estado inconsistente do banco de dados, especialmente se a Sessão 1 ainda não tiver confirmado suas alterações.


-- B- Como o problema pode ser resolvido?
	-- Para garantir a consistência dos dados e a confiabilidade das transações, é recomendado utilizar um nível de isolamento mais alto, como REPEATABLE READ ou SERIALIZABLE. Esses níveis de isolamento garantem que as transações leiam dados consistentes e evitem problemas como dirty reads (leitura de dados não confirmados).
	
    
 /* QUESTÃO 7 */
 
	/* SESSÃO A */
    
    SET AUTOCOMMIT = 0;
SET TRANSACTION
ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION READ ONLY;

SELECT * FROM Contas
WHERE saldo > 1000;

SELECT * FROM Contas
WHERE saldo > 1000;
COMMIT;

   /* SESSÃO B */
   
   SET AUTOCOMMIT = 0;
INSERT INTO Contas
(idConta,
saldo) VALUES (301,3000);
COMMIT;
    
    INSERT INTO Contas
(idConta,
saldo) VALUES (302,3000);
COMMIT;

 -- a) Qual anomalia de isolamento existe?
	-- A anomalia de isolamento presente neste cenário é a leitura não repetitiva (non-repeatable read).
 -- b) A transação B precisa esperar pela transação A em algum passo?
	-- Não, a transação B não precisa esperar pela transação A em nenhum passo. O nível de isolamento REPEATABLE READ não garante que as transações sejam executadas em uma ordem específica. A Sessão B pode inserir os novos registros enquanto a Sessão A está executando sua consulta.
-- c) As contas novas 301 e/ou 302 são visíveis para a transação A?
		-- Sim, as contas novas 301 e 302 podem ser visíveis para a transação A, dependendo do momento exato em que a consulta é executada na etapa 4. Como a Sessão A está em modo de leitura somente, ela não bloqueia outras transações de fazerem alterações. Se a Sessão B inserir as novas contas antes da Sessão A executar a segunda consulta, então as novas contas serão incluídas no resultado.
-- d) O conjunto de resultados da etapa 4 é afetado se alterarmos a ordem das etapas 2 e 3?
	-- Sim, a ordem das etapas 2 e 3 pode afetar o conjunto de resultados da etapa 4. Se a Sessão B executar a consulta SELECT antes de inserir as novas contas, a Sessão A não verá as novas contas em sua segunda consulta. No entanto, se a Sessão B inserir as novas contas antes da Sessão A executar a segunda consulta, então as novas contas serão incluídas no resultado.