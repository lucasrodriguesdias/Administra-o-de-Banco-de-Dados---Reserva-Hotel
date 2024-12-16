
#####################DDL#########################################################
DROP SCHEMA IF EXISTS HOSPEDAGEM;
CREATE SCHEMA HOSPEDAGEM;
USE HOSPEDAGEM;

CREATE TABLE Enderecos(
idEndereco  INT Primary key auto_increment,
logradouro  VARCHAR(100) NOT NULL,
numero VARCHAR(8) NOT NULL,
complemento VARCHAR(20) NOT NULL,
bairro VARCHAR(30) NOT NULL,
cep VARCHAR(10) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado VARCHAR(2) NOT NULL,
pais VARCHAR(30) NOT NULL
);
CREATE TABLE Hospedes(
idHospede  INT Primary key auto_increment,
nome VARCHAR(100) NOT NULL,
cpf  VARCHAR(20) NOT NULL,
dataNascimento  DATE NOT NULL,
telefone  VARCHAR(30) NOT NULL,
email VARCHAR(100) NOT NULL,
DataCadastro DATE NOT NULL,
fk_idEndereco INT NOT NULL,
FOREIGN KEY (fk_idEndereco) REFERENCES Enderecos(idEndereco)
);
CREATE TABLE Fornecedores(
idFornecedor INT Primary key auto_increment,
nome VARCHAR(100) NOT NULL,
cnpj  VARCHAR(20) NOT NULL,
contato VARCHAR(50) NOT NULL
);
CREATE TABLE Quartos(
idQuarto INT Primary key auto_increment,
nQuarto INT NOT NULL,
tipoQuarto VARCHAR(100) NOT NULL,
capacidade INT NOT NULL,
valorDiaria  DECIMAL(10,2) NOT NULL,
statusQuarto ENUM('Disponível','Indisponível')
);
CREATE TABLE Produtos(
idProduto INT Primary key auto_increment,
descricao VARCHAR(100) NOT NULL,
valorUnitario DECIMAL(10,2)
);
CREATE TABLE Pagamentos(
idPagamento  INT Primary key auto_increment,
metodoPagamento  ENUM('Cartão', 'Dinheiro', 'Transferência','Pix') NOT NULL
);
CREATE TABLE CheckIn(
idCheckIn  INT Primary key auto_increment,
dataCheckIn  DATE NOT NULL,
dataCheckOut  DATE NOT NULL,
qtdePessoas  INT NOT NULL,
fk_idHospede INT NOT NULL,
fk_idQuarto INT NOT NULL,
FOREIGN KEY (fk_idHospede) REFERENCES Hospedes(idHospede),
FOREIGN KEY (fk_idQuarto) REFERENCES Quartos(idQuarto)
);
CREATE TABLE Colaboradores(
idColaborador  INT Primary key auto_increment,
nomeColaborador  VARCHAR(100) NOT NULL,
cpf  VARCHAR(14) NOT NULL,
cargo  ENUM('Recepcionista','Limpeza','Gerente','Ajudante','Outro') NOT NULL,
dataAdmissao  DATE NOT NULL,
telefone  VARCHAR(15) NOT NULL,
email  VARCHAR(100) NOT NULL,
salario  DECIMAL(10,2) NOT NULL,
fk_idEndereco INT NOT NULL,
FOREIGN KEY (fk_idEndereco) REFERENCES Enderecos(idEndereco)
);
CREATE TABLE Servicos(
idServico  INT Primary key auto_increment,
nomeServico  VARCHAR(50) NOT NULL,
descricaoServico  VARCHAR(200) NOT NULL,
Valor  DECIMAL(10,2) NOT NULL,
fk_idColaborador  INT NOT NULL,
FOREIGN KEY (fk_idColaborador) REFERENCES Colaboradores(idColaborador)
);
CREATE TABLE CheckOut(
idChekOut INT Primary key auto_increment,
fk_idCheckIn INT NOT NULL,
fk_idPagamento INT NOT NULL,
total DECIMAL(10,2) NOT NULL,
FOREIGN KEY (fk_idCheckIn) REFERENCES CheckIn(idCheckIn),
FOREIGN KEY (fk_idPagamento) REFERENCES pagamentos(idPagamento)
);
CREATE TABLE ConsumoProdutos(
idConsumo INT Primary key auto_increment,
fk_idQuarto INT NOT NULL,
fk_idProduto INT NOT NULL,
quantidade  INT NOT NULL,
valorUnitario DECIMAL(10,2)
);
CREATE TABLE ConsumoServicos(
idConsumo INT Primary key auto_increment,
fk_idQuarto INT NOT NULL,
fk_idServico INT NOT NULL,
quantidade  INT NOT NULL,
valorUnitario DECIMAL(10,2)
);

CREATE TABLE LOGcheck (
idLOGReserva INT PRIMARY KEY AUTO_INCREMENT,
user_ VARCHAR(30) NOT NULL,
data_ DATETIME NOT NULL,
totalReserva DECIMAL(10,2) NOT NULL
);

##############################DML#########################################################


INSERT INTO ENDERECOS(logradouro,numero,complemento,bairro,cep,cidade,estado,pais)VALUES
('Av dos Magnatas',123,'Casa','CENTRO','12.333-234','BH','MG','Brasil'),
('Rua da Glória',23,'Ap303','GLÓRIA','99.333-111','BH','MG','Brasil'),
('Rua Carmo Sintra',10,'Casa','LOURDES','22.311-111','BH','MG','Brasil'),
('Praça do forró',19,'Casa','LOURDES','34.566-665','BETIM','MG','Brasil'),
('AV Amazonas',290,'Ap202','GUTIERREZ','45.988-666','BH','MG','Brasil'),
('Rua da Placa Quebrada',23,'Ap405','CENTRO','44.555-231','CONTAGEM','MG','Brasil'),
('Av do Contorno',98,'Ap101','CENTRO','77.344-766','BH','MG','Brasil'),
('Rua Melo Azevedo',66,'Casa','VENDA NOVA','32.455-345','BH','MG','Brasil'),
('Av Rude Campos',44,'Casa','CENTRO','42.133-234','BH','MG','Brasil'),
('Av Stone Street',2345,'Ap303','GLÓRIA','19.665-111','BH','MG','Brasil'),
('Rua Frederico Moura',2,'Casa','LOURDES','44.544-545','CONTAGEM','MG','Brasil'),
('Rua dos Carijós',121,'Casa','CENTRO','33.111-654','BH','MG','Brasil'),
('Praça da República',366,'Casa','GUTIERREZ','23.122-145','BH','MG','Brasil'),
('Rua Maria Luísa do Val Penteado',55,'Ap405','CENTRO','33.888-677','BH','MG','Brasil'),
('Av Tocantins',787,'Ap303','CENTRO','88.690-878','BETIM','MG','Brasil'),
('Pereira Travessa',111,'Ap301','CENTRO','57.048-572','Santa Efigênia de Minas','PB','Brasil'),
('Moreira Alameda',2323,'Ap903','CENTRO','13.082-709', 'Santa Cruz do Piauí','GO','Brasil'),
('Fabiano Marginal',3456,'Casa','TROVADOR','19.915-620','Irapuru','TO','Brasil'),
('Rua Eloá',444,'Ap103','LADOB','41.342-664','Duas Estradas','PE' ,'Brasil'),
('Emanuel Travessa',3290,'Casa','CASA AMARELA','25.570-840','Oeiras','MG' ,'Brasil'),
('Rua Madre Silva',587,'Casa','VIA UM','14.804-304','Capão Bonito','SP','Brasil'),
('Rua José de Barros Lima',43,'Casa','DIAS SANTOS','14.406-890','São Paulo','SP','Brasil'),
('Rua Waldery Uchôa',980,'Ap401','CENTRO','75.900-188','Fortaleza','CE','Brasil'),
('Rua Miguel Negri',345,'Ap502','SÃO MIGUEL','24.877-720','Araçatuba','SP','Brasil'),
('Rua Domingos Alves de Lima',435,'Ap605','CASTELO','89.234-255','Tianguá','CE','Brasil'),
('Rua do Lago',342,'Ap803','CASA NOVA','79.612-481','São Paulo','SP','Brasil'),
('Praça São Sebastião',33,'Ap104','CENTRO','80.220-191','Baldim','MG','Brasil'),
('Rua Edgar Corrêa dos Santos',32,'Casa','VILA OESTE','30.270-110','Palhoça','SC','Brasil'),
('Quadra QNM 22',78,'Casa','CONJUNTO DOIS','13.170-690','Brasília' ,'DF','Brasil'),
('Rua Dez de Fevereiro',43,'Casa','CARVALHO','30.710-060','Fortaleza' ,'CE','Brasil'),
('Rua Projetada',896,'Ap1003','ANTERES I','72.308-508','Maceió','AL','Brasil'),
('Rua 8',656,'Ap303','RIBAMAR','41.515-208','Fortaleza','CE','Brasil'),
('Quadra Quadra 3',34,'Ap109','CENTRO','82.930-460','Valparaíso de Goiás','GO','Brasil'),
('Rua Edgar Corrêa dos Santos',786,'Ap101','VILA SERRA','70.675-811','Palhoça','SC','Brasil'),
('Rua Jair Coelho',781,'Ap303','COMENDADOR','78.606-428','São Mateus','ES','Brasil'),
('Av Esbert de Souza',35,'Casa','VENDA NOVA','78.665-976','BH','MG','Brasil'),
('Av Tuana Cardoso',345,'Casa','NOVA MORADA','55.555-888','BH','MG','Brasil'),
('Av Barbosa Gomes',34,'Casa','ARVOREDO','33.555-443','BH','MG','Brasil'),
('Av Rubens Saleiro',234,'Casa','REPRESA','33.444-555','BH','MG','Brasil'),
('Av Mentreu Bonus',654,'Casa','CENTRO','34.333-222','BH','MG','Brasil'),
('Rua Castro Azevedo',768,'Casa','LESTE','88.888-000','BH','MG','Brasil'),
('Rua Azevedo',1234,'Casa','MORADA','78.888-555','BH','MG','Brasil'),
('Rua Clarice Mathias',654,'Casa','MORADA VELHA','55.666-777','BH','MG','Brasil'),
('Rua Neves Costa',777,'Ap403','FLORESTA','67.433-555','BH','MG','Brasil'),
('Rua Abanildo Azevedo',453,'Ap404','CAPIM VERDE','22.444-555','BH','MG','Brasil'),
('Rua Otero Militante',21,'Casa','FLORESTA','33.333-444','BH','MG','Brasil'),
('Rua Maria Gomes Raposo',12367,'Casa','VENDA NOVA','21.665-000','BH','MG','Brasil'),
('Rua das Flores',451,'Casa','CENTRO','75.665-100','BH','MG','Brasil'),
('Av Esbertalina Barbosa',333,'Ap202','CENTRO','73.665-222','BH','MG','Brasil'),
('Av Cardoso Santos',177,'Casa','CASA AMARELA','22.665-111','BH','MG','Brasil'),
('Rua Mentilinia Rapouso',890,'Casa','HORIZONTE','10.665-109','BH','MG','Brasil'),
('Av Alvaro Socio',765,'Casa','PERPETUO','22.665-960','BH','MG','Brasil'),
('Rua das Estrelas',437,'Ap101','CASCATA','78.665-982','BH','MG','Brasil'),
('Av Calca Bonomo',666,'Casa','VILA SERRA','44.665-980','BH','MG','Brasil'),
('Rua Tentei Vulto',2555,'Ap108','VENDA NOVA','33.665-919','BH','MG','Brasil'),
('Av Rubens Alvoroco',335,'Ap1201','CAIM ABREU','29.665-918','BH','MG','Brasil'),
('Rua Maritaca Bueno',47,'Casa','ORILANDIA','22.665-981','BH','MG','Brasil'),
('Av Principal',666,'Casa','SEMEAR','21.665-981','BH','MG','Brasil'),
('Rua Marco Dualito',34,'Ap508','CENTRO','28.665-982','BH','MG','Brasil'),
('Av Parada Meia',11,'Ap201','MORADA','78.661-980','BH','MG','Brasil'),
('Rua Ontem Firme',60,'Casa','SERRA','08.165-989','BH','MG','Brasil'),
('Av Esperança Barbosa',790,'Ap301','SERRA','18.665-979','BH','MG','Brasil'),
('Av Mendes JR',790,'Ap301','SERRA','13476-601','BH','MG','Brasil'),
('Av Costa e Silva',342,'Ap601','COSME NOVO','18116-430','Betim','MG','Brasil'),
('Av Lavinia Conde',55,'Ap308','CENTRO','13806-701','BH','MG','Brasil'),
('Rua Estrada Sul',216,'Ap302','PIRAÍ','12947-460','BH','MG','Brasil'),
('Rua Freira Maria',556,'Casa','VERDE FLOR','13737-271','BH','MG','Brasil'),
('Rua Topico Verde',3776,'Casa','CAPITAL','05142-040','BH','MG','Brasil'),
('Rua Tamoios',564,'Casa','ORTO','18275-264','Betim','MG','Brasil'),
('Av Ceará',32,'Casa','PARTE NOVA','13218-455','Betim','MG','Brasil'),
('Rua Clovis', '345', 'Casa', 'Centro', '12344-999', 'Betim', 'MG', 'Brasil');


INSERT INTO hospedes(nome,cpf,dataNascimento,telefone,email,DataCadastro,fk_idEndereco) VALUES 
('Isac Cordeiro Jr.','858.221.013-21','2004-10-28','(95) 96986-8983','euquerio3624@uorak.com','2015-01-10',1),
('Ashley Godói','152.671.543-00','1990-06-23','(84) 98544-8126','ayram3268@uorak.com','2015-03-21',2),
('Ashley Taís Delgado Faria de Castro','276.573.123-35','1999-06-14','(64) 97687-5741','teotista8342@uorak.com','2014-05-16',3),
('Carlos Aldo de Dávila Jr.','972.768.443-23','2007-01-06','(89) 98064-4854','delfino3815@uorak.com','2016-11-01',4),
('Amália Luzinete Ávila de Casanova','176.643.142-91','1998-03-19','(63) 99730-8329','ghlana3918@uorak.com','2015-01-13',5),
('Lívia Samanta Brito','662.914.158-01','2001-07-22','(32) 97519-8859','anika7177@uorak.com','2014-04-01',6),
('Alberto Pereira Ramires','854.743.728-25','2003-03-26','(92) 98963-9638','damiana3528@uorak.com','2014-03-03',7),
('Abgail Camacho Barroso','568.213.146-08','2004-07-26','(99) 97157-3967','najla4210@uorak.com','2016-08-07',8),
('Abgail Mônica Campos de Corona','991.077.424-01','2000-06-14','(22) 98436-1126','junli5703@uorak.com','2014-05-05',9),
('Nivaldo Pablo de Azevedo Jr.','867.327.246-73','1995-04-09','(49) 96773-2321','nazariy36@uorak.com','2016-04-09',10),
('Aparecida Gil de Almeida','296.861.662-54','2000-02-15','(61) 98728-3827','laurinda7680@uorak.com','2015-10-07',11),
('Neila Violeta Ferraz de Mendes','143.048.125-05','1992-04-03','(19) 98852-1111','mohan4305@uorak.com','2016-10-06',12),
('Caroline Valeska de Camacho','263.357.169-76','1995-07-05','(92) 98043-0988','naufel1890@uorak.com','2016-01-24',13),
('Thalissa Célia Madeira de Serra','536.676.559-59','1997-08-09','(51) 97981-8795','leonido7926@uorak.com','2015-02-14',14),
('Ashley Benites Marinho','279.272.504-42','1993-11-08','(89) 99292-7283','hafiwi6131@merotx.com','2014-09-19',15),
('Pedro Damião de Barros Filho','963.848.828-09','2004-05-01','(79) 98559-3684','used.peacock.hrcu@flashpost.net','2014-06-12',16),
('Cristiano Ferminiano Neto','164.440.117-79','2004-04-28','(96) 99621-5503','jerome714@mytempmail.org','2016-08-18',17),
('Márcio Aguiar Filho','353.671.886-80','1991-03-13','(87) 98113-6185','ce3f1834d7@emailvb.pro','2015-04-04',18),
('André Beltrão Dávila','254.220.495-00','1998-09-26','(55) 99151-7757','resc7@emailvb.pro','2016-02-15',19),
('Mike Paulo Fontes Filho','185.585.595-03','1999-05-08','(48) 99879-3350','hafiwi6131@merotx.com','2015-02-14',20),
('Leopoldo Sebastião de Azevedo Filho','374.005.187-63','1991-10-09','(85) 98752-4057','6131@merotx.com','2014-04-03',21),
('Denis Lovato de Antunes','289.588.968-68','1990-07-22','(99) 97305-3659','mateuscardosocarvalho@rhyta.com','2015-05-03',22),
('Joaquim Benites','873.397.434-99','1994-02-28','(28) 98489-3241','marypmilburn@armyspy.com','2015-03-11',23),
('Silvana Dominato','552.275.769-80','2006-03-20','(79) 98283-8458','wendyshernandez@gustr.com','2015-01-01',24),
('Antônio Galvão de Gonçalves','125.246.967-58','2009-09-24','(86) 99773-5462','a_vanessinha_1990@hotmail.com','2016-03-13',25),
('Arnaldo Elano Chaves','877.716.686-82','2006-01-18','(64) 98855-2875','a3sign@pandora.be','2016-04-05',26),
('Salomé Keyla Ferreira Galhardo','231.104.888-09','1999-06-13','(53) 99479-1745','aaanika2@hotmail.com','2016-06-11',27),
('Valentin Otto de Escobar','988.526.723-97','1991-06-24','(81) 98186-1696','aaron2003s@bol.com.br','2015-05-11',28),
('Isabella Zulmira Fidalgo de Alvim','339.512.722-28','2000-08-10','(98) 97431-6540','aaron--21@hotmail.com','2016-07-16',29),
('Lara Barros','370.866.257-10','2001-09-06','(79) 99198-3412','abidoral@hotmail.com','2014-08-07',30),
('Helena Paes Pedrosa','334.213.063-62','1994-12-07','(85) 98562-3675','abk_333@hotmail.com','2015-03-02',31),
('Daniela Joana de Aguiar','628.824.563-10','1992-05-22','(96) 98742-7748','abner_bim@hotmail.com','2015-04-27',32),
('Eliomar Joelma Ferreira','933.062.768-47','2008-10-01','(54) 96767-7750','abner_bim@hotmail.com','2014-06-01',33),
('Leonara Paula Rivera de Sales','636.449.233-96','2006-04-15','(71) 98883-4429','acacio_divix@hotmail.com','2016-09-05',34),
('Edinaldo Ávila','149.549.420-98','1991-08-07','(86) 99226-1116','academia.boaforma@yahoo.com.br','2016-05-13',35),
('José Nilton de Oliveira Sobrinho','676.764.706-33','2009-07-22','(34) 97945-8131','ac-ferian@bol.com.br','2014-07-05',36),
('Alberto Aranda Jr.','423.986.210-81','1998-07-28','(18) 98840-3416','acordarsono@hotmail.com','2014-11-13',37),
('Luigi Assunção','428.479.619-41','2001-04-14','(37) 99409-1786','acsa_lim@yahoo.com.br','2016-06-26',38),
('Estêvão Abreu de Bezerra','745.247.745-64','2008-11-19','(84) 98742-7634','adamyth@gmail.com','2015-12-24',39),
('Graziele Franco Maciel','077.614.483-96','2001-01-15','(88) 97467-9945','add_ae_jente@yahoo.com.br','2015-06-02',40),
('Luciana Burgos de Lima','221.503.877-27','1998-12-20','(97) 99534-5380','addgeral@gmail.com','2016-05-07',41),
('Eugênio Campos Rico','888.532.784-20','1994-02-01','(77) 99378-1648','addyevusk@yahoo.com.br','2014-05-23',42),
('Marcela Mônica Cruz Neves','353.624.688-55','1992-07-10','(88) 96775-1263','adeozemir@yahoo.com.br','2014-08-05',43),
('Luciano Colaço Delatorre','757.238.478-13','2006-01-24','(54) 98233-2261','adhaha@gmail.com','2016-09-02',44),
('Ana Zilda Dias de Gomes','951.883.418-08','1995-10-05','(34) 98028-7731','adhaha@gmail.com','2014-07-09',45),
('Luís Pacheco','648.697.397-80','2007-08-01','(79) 98167-3181','adilio-vidaloka@yahoo.com.br','2016-05-08',46),
('Walderice Balestero Furtado de Barbosa','497.682.736-40','2000-02-23','(67) 98038-4439','adilson.mariano5@terra.com.br','2014-05-06',47),
('Felipe Leo Delvalle Sobrinho','957.167.101-07','2008-04-18','(18) 98776-0736','admgerald1@yahoo.com.br','2016-10-09',48),
('Hugo Benjamin Matias da Silva','552.756.623-86','2006-07-07','(63) 97374-0708','adri_barboza@hotmail.com','2014-04-20',49),
('Alfredo Fábio Azevedo Carmona','324.862.113-30','2008-04-21','(96) 99797-3161','adriaens@pandora.be','2016-04-15',50),
('Marcela Mel Furtado Ramires de Almeida','577.916.593-95','2006-03-24','(87) 96987-1083','adrian_boyzinhu@yahoo.com.br','2016-11-04',51),
('Denise Paula Batista Camacho','190.342.727-45','1990-03-08','(35) 99723-9348','adriana_lemes_farias@hotmail.com','2014-06-23',52),
('Jasmin Burgos Grego','316.643.549-21','2003-07-30','(45) 98844-7721','adrianacpx@yahoo.com.br','2016-07-08',53),
('Horácio Inácio Delgado Quintana de Chaves','863.528.244-20','1999-04-03','(63) 98675-8777','adriane_do_prado@yahoo.com.br','2016-01-01',54),
('Edinaldo Aguiar de Alvarenga','443.831.147-09','2009-11-09','(97) 98666-6742','adrianinhaim@bol.com.br','2016-07-27',55),
('Rodrigo Carrara','962.848.983-63','1990-04-05','(63) 99426-6113','adriano.fariasnascimento@yahoo.com.br','2014-07-24',56),
('Ricardo Milton Fernandes Flores de Almeida','891.236.763-37','1991-02-15','(85) 99164-8593','adriano_wolf1@hotmail.com','2015-09-11',57), 
('Fabiano Paes de Souza','593.551.764-73','1995-05-29','(64) 98527-3027','adrianogato.2007@hotmail.com','2016-09-14',58), 
('Ivan Severino Aguiar','321.610.511-30','1997-12-22','(82) 97961-0881','adrianojareck@hotmail.com','2015-06-05',59),
('Eleonora Jimenes de Meireles','863.346.864-61','2008-08-13','(71) 98134-3156','adrianonev3s@gmail.com','2015-05-22',60);

INSERT INTO fornecedores(nome,cnpj,contato)VALUES
('Distribuidora Cosme Valter','67.484.267/0001-72','cosmevalter@yahoo.com.br'),
('Lavanderia Malta','57.561.156/0001-69','lavamalta@yahoo.com.br'),
('Casa dos Alimentos SA','32.181.668/0001-79','casaali@yahoo.com.br'),
('Festas Amil','54.304.552/0001-12','famil@gmail.com'),
('Bebidas LoveDrink','08.460.866/0001-97','lovedrink@gmail.com'),
('Supermercados Atacado','91.032.541/0001-57','superatacado@gmail.com');


INSERT INTO colaboradores(nomeColaborador,cpf,cargo,dataAdmissao,telefone,email,salario,fk_idEndereco)VALUES
('Fernando Gusmão','882.892.851-40','Recepcionista','2019-10-22','31-998722390','agricesar@yahoo.com.br',3999,61),
('Aline Susan Cordeiro Ortega','251.611.963-19','Limpeza','2018-01-07','31-998722880','aguia_fenix@hotmail.com',2890,62),
('Ismael Dominato de Britto','097.765.225-48','Gerente','2014-05-24','31-998721234','aguinaldo4789@hotmail.com',8321,63),
('Charles Nilton Campos Pedrosa','549.388.598-07','Ajudante','2024-04-24','31-977622390','ai_@hotmail.com',1890,64),
('Camila Brito de Gonçalves','456.723.828-19','Outro','2024-04-24','31-998722100','Aiacos.Kyoto@gmail.com',1412,65),
('Abigail Nair Balestero Perez','027.940.916-89','Limpeza','2020-08-26','31-998722311','aim.vip2@hotmail.com',2890,66),
('Hélio Delatorre Frias','437.736.456-19','Limpeza','2020-05-17','31-998720900','hujtd@hotmail.com',2890,67),
('Bianca Oliveira','117.197.943-67','Recepcionista','2020-12-04','31-998878390','aiopam@hotmail.com',3999,68),
('Ariana Rosimeire Mendonça do Rio','468.858.537-39','Recepcionista','2020-08-06','31-988722390','aislyn14@yahoo.com.br',3999,69),
('Bárbara Telma Rico Torres','345.291.184-52','Limpeza','2024-10-08','31-9987223896','ajudasystemonline@gmail.com',2890,70),
('Amanda Torres','222.291.184-44','Outro','2024-10-08','31-9987223098','spahotel@gmail.com',3890,71);

INSERT INTO produtos(descricao,valorUnitario)VALUES
('Almoço - prato do dia',98),
('Jantar - prato do dia',96),
('Refrigerante - Lata',5),
('Cerveja - Garrafa',15),
('Cerveja - Long Neck',10),
('Sucos - Naturais',10),
('Sobremesa do dia',20),
('Agua Mineral - 1Litro',7);

INSERT INTO quartos(nQuarto,tipoQuarto,Capacidade,ValorDiaria,statusQuarto)VALUES
(101,'Standart',1,120,'Disponivel'),
(102,'Standart',1,120,'Disponivel'),
(103,'Standart',1,120,'Disponivel'),
(104,'Standart',1,120,'Disponivel'),
(201,'Standart',2,320,'Disponivel'),
(202,'Standart',2,320,'Disponivel'),
(203,'Standart',2,320,'Disponivel'),
(204,'Standart',2,320,'Disponivel'),
(301,'Master',2,420,'Disponivel'),
(302,'Master',2,420,'Disponivel'),
(303,'Master',4,550,'Disponivel'),
(304,'Master',4,550,'Disponivel'),
(401,'Deluxe',2,590,'Disponivel'),
(402,'Deluxe',2,590,'Disponivel'),
(403,'Deluxe',4,690,'Disponivel'),
(404,'Deluxe',4,690,'Disponivel'),
(501,'Master Superior',2,790,'Disponivel'),
(501,'Master Superior',2,790,'Disponivel'),
(501,'Master Superior',4,1120,'Disponivel'),
(501,'Master Superior',4,1120,'Disponivel'),
(601,'Suite Master Superior',4,2120,'Disponivel'),
(602,'Suite Master Superior',6,2120,'Disponivel');

INSERT INTO servicos (nomeServico,descricaoServico,valor,fk_idColaborador) VALUES
('Passeio a Cavalo','O hospede pode passear em todo o parque de charrete com o apoio de um instrutor',100,5),
('SPA','O hospede pode fazer varias massagens para relaxar',300,11),
('Brinquedoteca','O hospede pode deixar os filhos menores de idade brincando com apoio de tutores',10,5),
('Lavanderia','O hospede pode lavar suas roupas no proprio hotel',10,5);

INSERT INTO pagamentos(metodoPagamento)VALUES
('Cartão'),
('Dinheiro'),
('Transferência'),
('Pix');

INSERT INTO CheckIn (dataCheckIn,dataCheckOut,qtdePessoas,fk_idHospede,fk_idQuarto) VALUES 
('2024-01-01','2024-01-07',2,1,5),
('2024-01-01','2024-01-05',2,2,6),
('2024-02-02','2024-02-07',2,3,7),
('2024-03-01','2024-03-07',3,4,11),
('2024-04-10','2024-04-15',4,5,12);

INSERT INTO consumoprodutos(fk_idQuarto,fk_idProduto,quantidade,valorUnitario)VALUES
(5,1,1,98),
(6,1,2,98),
(7,2,1,96),
(11,1,1,98);

INSERT INTO consumoservicos(fk_idQuarto,fk_idServico,quantidade,valorUnitario)VALUES
(5,1,1,100),
(6,2,1,300),
(7,1,2,100),
(11,2,1,300),
(12,1,1,100);

INSERT INTO CheckOut(fk_idCheckIn,fk_idPagamento,total)VALUES
(1,1,2534),
(2,1,1998);

##################################DQL#########################################################
/*
/* 1 - Crie uma procedure que insere um endereco na tabela de Enderecos.*/

USE HOSPEDAGEM;
DELIMITER $$
CREATE PROCEDURE sp_insereEndereco(IN logradouroIN VARCHAR(100), numeroIN
VARCHAR(8), complementoIN VARCHAR(20), bairroIN VARCHAR(30),
cepIN VARCHAR(10), cidadeIN VARCHAR(50), estadoIN VARCHAR(2), paisIN VARCHAR(30))
BEGIN
INSERT INTO enderecos(logradouro, numero, complemento, bairro, cep, cidade, estado,
pais)
VALUES(logradouroIN, numeroIN, complementoIN, bairroIN, cepIN, cidadeIN, estadoIN,
paisIN);
END $$
DELIMITER ;
CALL sp_insereEndereco('Rua Frei Antonio do Desterro', 187, 'Casa', 'NOVA
CACHOEIRINHA','31.250-620','BH','MG','Brasil');
SELECT * FROM enderecos; -- Testar o funcionamento da procedure criada

/* 2 - Crie uma trigger que TORNE indisponivel o quarto reservado
Você deve fazer um checkIn para isso*/

DELIMITER $$
CREATE TRIGGER atualizaQuarto
AFTER INSERT ON checkin
FOR EACH ROW
BEGIN
UPDATE quartos
SET statusQuarto = 'Indisponível'
WHERE idQuarto = NEW.fk_idQuarto;
END $$
DELIMITER ;
-- Testar a trigger criando o insert.
INSERT INTO CheckIn (dataCheckIn,dataCheckOut,qtdePessoas,fk_idHospede,fk_idQuarto)
VALUES ('2024-11-25','2024-12-02',2,1,5);
SELECT * FROM quartos
WHERE idQuarto = 5;

/* 3 - Usando apenas um comando :
Crie um novo usuario local com a senha 123123.
A senha deve expirar em 180 dias.
O número Máximo tentativas de login = 3
O tempo de bloqueio em dias = 1 */

CREATE USER 'lucasRodrigues'@'localhost' IDENTIFIED BY '123123'
PASSWORD EXPIRE INTERVAL 180 DAY
FAILED_LOGIN_ATTEMPTS 3 PASSWORD_LOCK_TIME 1;

/* 4 - Voce deve realizar um CheckOut. Ao realizar esse insert na tabela
uma trigger deve monitorar a tabela checkOut para verificar
se tem produto consumido pelo quarto que está fazendo checkOut.
A trigger deve inserir na tabela logcheck as seguintes informações:
O usuario logado na hora do checkOut
a data e hora da inserção
O valor do produto que o quarto que esta fazendo checkOut consumiu. */

INSERT INTO CheckOut(fk_idCheckIn,fk_idPagamento,total) VALUES (4,1,2534);
DELIMITER $$
CREATE TRIGGER monitoraCheckout
BEFORE INSERT ON checkout
FOR EACH ROW
BEGIN
DECLARE produtoConsumido VARCHAR(50);
SET produtoConsumido = (SELECT P.idProduto FROM produtos P
INNER JOIN consumoprodutos CP
ON CP.fk_idProduto = P.idProduto
INNER JOIN quartos Q
ON CP.fk_idQuarto = Q.idQuarto
INNER JOIN checkin CI
ON CI.fk_idQuarto = Q.idQuarto
WHERE CI.idCheckIn = NEW.fk_idCheckIn);
IF(produtoConsumido IS NOT NULL)THEN
INSERT INTO logcheck(user_, data_, totalReserva) VALUES (user(), )
END $$
DELIMITER ;

/* 5 - Crie uma role e insira os privilegios:
Pode visualizar todas as tabelas do schema Hospedagem.
Pode inserir na tabela hospedes.
Pode inserir na tabela enderecos. */

CREATE ROLE 'nivel1'@'localhost';
GRANT SELECT ON hospedagem.* TO 'nivel1'@'localhost';
GRANT INSERT ON hospedagem.hospedes TO 'nivel1'@'localhost';
GRANT INSERT ON hospedagem.enderecos TO 'nivel1'@'localhost';
SHOW GRANTS FOR 'nivel1'@'localhost';

/* 6 - Crie um indice para a tabela hospedes para:
ler mais rapido os nomes dos hospedes.
Ler mais rapido o email dos hospedes. */

CREATE INDEX hospedes_nomeEmail ON hospedes(nome, email);

/* 7 - Crie um select que ao ser chamada apresente
quais os hospedes cadastrados fizeram ao menos uma reserva. */

SELECT H.* FROM hospedes H
LEFT JOIN checkin CI
ON H.idHospede = CI.fk_idHospede
WHERE CI.idCheckIn IS NOT NULL;

/* 8 - Crie um select que ao ser chamada apresente
quais os tipos de pagamentos que nunca foram utilizados. */

SELECT P.metodoPagamento FROM pagamentos P
LEFT JOIN checkout CO
ON P.idPagamento = CO.fk_idPagamento
WHERE P.idPagamento NOT IN (SELECT P.metodoPagamento FROM pagamentos P
INNER JOIN checkout CO
ON P.idPagamento = CO.fk_idPagamento);

/* 9 - Crie uma procedure onde voce passa o id do quarto
e ela soma o valor do produto consumido + valor do servico realizado
para o quarto. Use uma variavel para apresentar a soma
Ex: Select @somaQuarto. */

DELIMITER $$
CREATE PROCEDURE sp_totalGastosQuarto(IN idQuartoIN INT, OUT somaQuarto DOUBLE)
BEGIN
SET somaQuarto =(SELECT ((CP.valorUnitario*CP.quantidade) +
(CS.valorUnitario*CS.quantidade)) FROM consumoprodutos CP
INNER JOIN quartos Q
ON CP.fk_idQuarto = Q.idQuarto
INNER JOIN consumoservicos CS
ON CS.fk_idQuarto = Q.idQuarto
WHERE idQuarto = idQuartoIN);
END $$
DELIMITER ;
CALL sp_totalGastosQuarto(5, @somaQuarto);
SELECT @somaQuarto;