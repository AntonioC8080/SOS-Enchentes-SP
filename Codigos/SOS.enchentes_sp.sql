CREATE DATABASE sos_enchentes_sp;
USE sos_enchentes_sp;

CREATE TABLE zona (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE nivel_risco (
    id_nivel_risco INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL
);

CREATE TABLE classificacao_territorio (
    id_classificacao INT AUTO_INCREMENT PRIMARY KEY,
    rendimento_medio VARCHAR(50),
    tipo_territorio VARCHAR(100)
);




CREATE TABLE regiao (
    id_regiao INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_zona INT NOT NULL,
    id_nivel_risco INT NOT NULL,
    id_classificacao INT NOT NULL,
    corrego_bacia VARCHAR(150),
    populacao_risco VARCHAR(20),
    FOREIGN KEY (id_zona) REFERENCES zona(id_zona),
    FOREIGN KEY (id_nivel_risco) REFERENCES nivel_risco(id_nivel_risco),
    FOREIGN KEY (id_classificacao) REFERENCES classificacao_territorio(id_classificacao)
);

-- ============================
-- HISTÓRICO DE ENCHENTES
-- ============================

CREATE TABLE historico_enchentes (
    id_historico INT AUTO_INCREMENT PRIMARY KEY,
    id_regiao INT NOT NULL,
    ponto_critico VARCHAR(150),
    frequencia_eventos VARCHAR(80),
    tipo_evento VARCHAR(100),
    tempo_escoamento VARCHAR(50),
    fator_agravante VARCHAR(200),
    FOREIGN KEY (id_regiao) REFERENCES regiao(id_regiao)
);

-- ============================
-- INSERTS DE TABELAS DE REFERÊNCIA
-- ============================

INSERT INTO zona (nome) VALUES
('Zona Leste'), ('Zona Sul'), ('Zona Norte'),
('Zona Oeste'), ('Zona Central');

INSERT INTO nivel_risco (descricao) VALUES
('R4 - Muito Alto'), ('R3 - Alto'),
('R2 - Médio'), ('R1 - Baixo / Nulo');

-- Classificação territorial (extraída do documento)
INSERT INTO classificacao_territorio (rendimento_medio, tipo_territorio) VALUES
('Menos de 1,5 SM','Favela / Ocupação Informal'),
('Entre 1,5 e 2 SM','Loteamento Irregular / Favela'),
('Menos de 1,5 SM','Favela / Encostas de Vale'),
('Menos de 1 SM','Várzea de Rio (Informal)'),
('Entre 1,5 e 2 SM','Periferia Consolidada / Encosta'),
('Entre 1,5 e 2 SM','Favela / Loteamento'),
('Menos de 1,5 SM','Favela'),
('Menos de 1,5 SM','Conjunto Habitacional / Favela'),
('Menos de 1,5 SM','Área de Manancial / Rural'),
('Mais de 10 SM','Bairro Nobre / Estruturado'),
('Mais de 12 SM','Bairro Nobre / Estruturado'),
('Entre 3 e 5 SM','Bairro Estruturado'),
('Entre 2 e 3 SM','Bairro Médio'),
('Entre 5 e 8 SM','Bairro Estruturado'),
('Entre 1,5 e 2 SM','Periferia'),
('Entre 3 e 5 SM','Bairro Médio'),
('Entre 2 e 3 SM','Bairro Comercial'),
('Entre 5 e 8 SM','Centro Histórico'),
('Entre 3 e 5 SM','Bairro Estruturado'),
('Mais de 10 SM','Bairro Nobre'),
('Menos de 1,5 SM','Periferia / Manancial'),
('Menos de 1,5 SM','Rural / Manancial');

-- ============================
-- INSERTS DE REGIÕES (51 linhas)
-- ============================

INSERT INTO regiao (id_regiao, nome, id_zona, id_nivel_risco, id_classificacao, corrego_bacia, populacao_risco) VALUES
(1,'Lajeado / Itaim Paulista',1,1,1,'Córrego Itaim / Bacia do Rio Tietê','18500'),
(2,'Campo Limpo',2,1,2,'Córrego Pirajussara','13000'),
(3,'M\'Boi Mirim (Jardim Ângela)',2,1,3,'Córrego Cabuçu de Baixo','12000'),
(4,'Jardim Pantanal (Vila Itaim)',1,1,4,'Várzea do Rio Tietê','14500'),
(5,'Brasilândia',3,2,5,'Córrego Bananal / Vertentes','9800'),
(6,'Capão Redondo',2,2,6,'Córrego Moenda','11200'),
(7,'Vila Prudente (Favela da Vila)',1,2,7,'Rio Tamanduateí / Córrego da Vila','6400'),
(8,'Cidade Tiradentes',1,2,8,'Córrego Itaquera','8100'),
(9,'Parelheiros',2,3,9,'Córrego Parelheiros / Guarapiranga','4300'),
(10,'Pinheiros',4,4,10,'Rio Pinheiros (Marginal)','< 100'),
(11,'Moema',2,4,11,'Bacia do Rio Uberabinha','< 50'),
(12,'Sapopemba',1,2,12,'Córrego Sapopemba','7200'),
(13,'Guaianases',1,1,1,'Córrego Lajeado','16800'),
(14,'São Mateus',1,2,5,'Córrego Aricanduva','9100'),
(15,'Aricanduva',1,2,6,'Rio Aricanduva','7800'),
(16,'Tatuapé',1,3,12,'Rio Tietê','1200'),
(17,'Belém',1,3,12,'Rio Tamanduateí','950'),
(18,'Penha',1,2,15,'Córrego Penha','6400'),
(19,'Ermelino Matarazzo',1,2,7,'Córrego Jacu-Pêssego','10200'),
(20,'Vila Formosa',1,3,13,'Córrego Rapadura','2100'),
(21,'Vila Carrão',1,3,13,'Córrego Carrão','1800'),
(22,'Jabaquara',2,3,12,'Córrego Água Espraiada','1300'),
(23,'Santo Amaro',2,3,14,'Rio Pinheiros','900'),
(24,'Socorro',2,2,15,'Rio Guarapiranga','5200'),
(25,'Pedreira',2,2,7,'Córrego Pedreira','8400'),
(26,'Jardim São Luís',2,1,3,'Córrego São Luís','15000'),
(27,'Jardim Ângela',2,1,7,'Córrego Piraporinha','13200'),
(28,'Grajaú',2,2,21,'Represa Billings','9800'),
(29,'Marsilac',2,3,22,'Córrego Capivari','3100'),
(30,'Vila Sônia',4,3,12,'Córrego Pirajussara','1400'),
(31,'Butantã',4,3,14,'Rio Pinheiros','700'),
(32,'Jaguaré',4,2,15,'Rio Pinheiros','4800'),
(33,'Rio Pequeno',4,2,15,'Córrego Rio Pequeno','5200'),
(34,'Vila Leopoldina',4,3,14,'Rio Tietê','600'),
(35,'Limão',3,2,15,'Córrego Cabuçu de Cima','7700'),
(36,'Casa Verde',3,3,13,'Rio Tietê','1300'),
(37,'Freguesia do Ó',3,2,15,'Córrego do Bispo','6900'),
(38,'Santana',3,4,14,'Córrego Carandiru','< 200'),
(39,'Tucuruvi',3,3,13,'Córrego Tremembé','900'),
(40,'Jaçanã',3,2,3,'Córrego Jaçanã','8200'),
(41,'Vila Maria',3,2,15,'Córrego Maria','7100'),
(42,'Vila Guilherme',3,3,13,'Rio Tietê','1100'),
(43,'Pari',5,3,17,'Rio Tamanduateí','900'),
(44,'Brás',5,3,17,'Rio Tamanduateí','1000'),
(45,'Sé',5,4,18,'Galerias Subterrâneas','< 150'),
(46,'Liberdade',5,3,12,'Córrego Lavapés','800'),
(47,'Bela Vista',5,3,12,'Córrego Saracura','700'),
(48,'Consolação',5,4,14,'Galerias Subterrâneas','< 100'),
(49,'Higienópolis',5,4,20,'Galerias Subterrâneas','< 50'),
(50,'Vila Medeiros',3,2,15,'Córrego Medeiros','6800'),
(51,'Vila Matilde',1,2,15,'Córrego Aricanduva','7200');

-- ============================
-- HISTÓRICO DE ENCHENTES (51 linhas)
-- ============================

INSERT INTO historico_enchentes (id_regiao, ponto_critico, frequencia_eventos, tipo_evento, tempo_escoamento, fator_agravante) VALUES
(1,'Av. Marechal Tito / Córrego Itaim','Muito Alta (> 10 vezes/ano)','Enchente Fluvial (Transbordo)','> 6 horas','Calha do rio assoreada e topografia plana de várzea.'),
(2,'Estrada do Campo Limpo / Av. Carlos Caldeira Filho','Alta (5 a 10 vezes/ano)','Enxurrada Rápida / Alagamento','2 a 4 horas','Alta impermeabilização do solo e declividade acentuada.'),
(3,'Estrada do M\'Boi Mirim / Córrego Cabuçu','Alta (5 a 10 vezes/ano)','Inundação e Deslizamento','3 a 5 horas','Ocupação de encostas e gargalos nas galerias pluviais.'),
(4,'Ruas internas da Vila Itaim','Crítica (Constante no verão)','Inundação de Longa Duração','Dias a semanas','Nível das casas abaixo do leito do rio; bombeamento insuficiente.'),
(5,'Av. Inajar de Souza / Córrego Bananal','Média (3 a 5 vezes/ano)','Enxurrada e Alagamento','1 a 2 horas','Declive acentuado provoca descida violenta de água da chuva.'),
(6,'Av. Ellis Maas / Córrego Moenda','Alta (5 a 10 vezes/ano)','Alagamento de Vias','2 a 4 horas','Lixo em bueiros e subdimensionamento da rede subterrânea.'),
(7,'Av. Prof. Luiz Ignácio Anhaia Mello','Muito Alta (> 10 vezes/ano)','Inundação Urbana Intransitável','4 a 6 horas','Estrangulamento da bacia do Tamanduateí.'),
(8,'Av. dos Têxteis','Média (2 a 4 vezes/ano)','Enxurrada / Erosão de Solo','< 1 hora','Rompimento de tubulações sob vias.'),
(9,'Estrada da Colônia','Média (2 a 4 vezes/ano)','Alagamento Rural e de Vias','> 8 horas','Falta total de drenagem estruturada.'),
(10,'Marginal Pinheiros / Av. Faria Lima','Baixa (Rara / Controlada)','Alagamento Transitório','< 30 minutos','Piscinões funcionais e rápido bombeamento.'),
(11,'Av. Ibirapuera / Av. Santo Amaro','Baixa (Eventual)','Alagamento Localizado','< 20 minutos','Rede de bueiros ampla.'),
(12,'Av. Sapopemba','Alta','Enxurrada','2 a 3 horas','Encostas sem drenagem.'),
(13,'Estrada de Guaianases','Muito Alta','Enchente Fluvial','6 a 8 horas','Assoreamento.'),
(14,'Av. Mateo Bei','Média','Alagamento','1 a 2 horas','Bueiros obstruídos.'),
(15,'Av. Aricanduva','Alta','Enxurrada','2 a 4 horas','Canal estreito.'),
(16,'Radial Leste','Baixa','Alagamento Transitório','< 30 minutos','Boa drenagem.'),
(17,'Av. Celso Garcia','Média','Alagamento','1 a 2 horas','Gargalos.'),
(18,'Av. Amador Bueno','Alta','Enxurrada','2 a 3 horas','Declive acentuado.'),
(19,'Av. Paranaguá','Alta','Enchente','4 a 6 horas','Assoreamento.'),
(20,'Av. Cotching','Média','Alagamento','1 a 2 horas','Captação insuficiente.'),
(21,'Av. Carrão','Média','Alagamento','1 a 2 horas','Bueiros antigos.'),
(22,'Av. Armando Arruda','Baixa','Alagamento','< 30 minutos','Rede eficiente.'),
(23,'Av. Guido Caloi','Baixa','Alagamento','< 20 minutos','Piscinões.'),
(24,'Av. Atlântica','Média','Inundação','3 a 5 horas','Marginal baixa.'),
(25,'Estrada do Alvarenga','Alta','Enxurrada','2 a 4 horas','Loteamentos irregulares.'),
(26,'Estrada do M\'Boi Mirim','Muito Alta','Inundação','4 a 6 horas','Encostas ocupadas.'),
(27,'Av. Piraporinha','Alta','Enxurrada','2 a 3 horas','Gargalos pluviais.'),
(28,'Av. Belmira Marin','Alta','Inundação','5 a 7 horas','Proximidade da Billings.'),
(29,'Estrada da Barragem','Média','Alagamento Rural','> 8 horas','Sem drenagem.'),
(30,'Av. Francisco Morato','Média','Alagamento','1 a 2 horas','Volume de tráfego.'),
(31,'Av. Vital Brasil','Baixa','Alagamento','< 30 minutos','Boa drenagem.'),
(32,'Av. Jaguaré','Alta','Inundação','3 a 5 horas','Próximo ao Pinheiros.'),
(33,'Av. Rio Pequeno','Alta','Enxurrada','2 a 3 horas','Encostas urbanizadas.'),
(34,'Av. Gastão Vidigal','Média','Alagamento','1 a 2 horas','Encontro de bacias.'),
(35,'Av. Inajar de Souza','Alta','Enxurrada','2 a 3 horas','Declive acentuado.'),
(36,'Av. Casa Verde','Média','Alagamento','1 a 2 horas','Captação insuficiente.'),
(37,'Av. Itaberaba','Alta','Enxurrada','2 a 3 horas','Encostas ocupadas.'),
(38,'Av. Cruzeiro do Sul','Baixa','Alagamento','< 20 minutos','Rede moderna.'),
(39,'Av. Tucuruvi','Média','Enxurrada','1 a 2 horas','Declividade.'),
(40,'Estrada do Jaçanã','Alta','Enxurrada','2 a 3 horas','Encostas.'),
(41,'Av. Guilherme','Alta','Inundação','3 a 5 horas','Próximo ao Tietê.'),
(42,'Av. Conceição','Média','Alagamento','1 a 2 horas','Gargalos.'),
(43,'Av. Rangel Pestana','Média','Alagamento','1 a 2 horas','Topografia baixa.'),
(44,'Av. Celso Garcia','Média','Alagamento','1 a 2 horas','Rede antiga.'),
(45,'Praça da Sé','Baixa','Alagamento','< 20 minutos','Galerias subterrâneas.'),
(46,'Av. Liberdade','Média','Alagamento','1 a 2 horas','Rede antiga.'),
(47,'Av. Paulista','Baixa','Alagamento','< 20 minutos','Drenagem eficiente.'),
(48,'Rua da Consolação','Baixa','Alagamento','< 20 minutos','Captação moderna.'),
(49,'Av. Higienópolis','Baixa','Alagamento','< 20 minutos','Rede ampla.'),
(50,'Av. Júlio Buono','Alta','Enxurrada','2 a 3 horas','Encostas.'),
(51,'Av. Waldemar Carlos Pereira','Alta','Enxurrada','2 a 3 horas','Gargalos pluviais.');
