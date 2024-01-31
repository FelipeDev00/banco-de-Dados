CREATE DATABASE hospital;

CREATE TABLE medico (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80),
    cpf VARCHAR(14) UNIQUE
);

CREATE TABLE especialidade (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50)
);

CREATE TABLE medico_especialidade (
	id INT NOT NULL AUTO_INCREMENT,
    medico_id INT NOT NULL,
    especialidade_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (medico_id) REFERENCES medico (id),
    FOREIGN KEY (especialidade_id) REFERENCES especialidade (id)
);
    
CREATE TABLE pacientes (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
	email VARCHAR(100),
    cpf VARCHAR(14) NOT NULL UNIQUE,
    rg VARCHAR(12) NOT NULL UNIQUE
);
    
CREATE TABLE convenio (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    tempo_carencia INT NOT NULL
);
    
ALTER TABLE pacientes ADD convenio_id INT; 

ALTER TABLE pacientes ADD FOREIGN KEY (convenio_id) REFERENCES convenio(id);
    
CREATE TABLE consulta (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME,
    medico_id INT,
    pacientes_id INT,
    valorconsulta DECIMAL(10,2),
    convenio_id INT,
    carteiranumero VARCHAR(20),
    especialidade_id INT,
    FOREIGN KEY (medico_id) REFERENCES medico(id),
    FOREIGN KEY (convenio_id) REFERENCES convenio(id),
    FOREIGN KEY (pacientes_id) REFERENCES pacientes(id)
);
    
CREATE TABLE receitas (
	id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	consulta_id INT,
	medicamentos VARCHAR(45),
	quantidade INT,
	instrucoes VARCHAR(150),
	FOREIGN KEY (consulta_id) REFERENCES consulta(id)
);

CREATE TABLE Internacao (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_entrada DATE,
    data_prevista_alta DATE,
    data_alta DATE,
    procedimentos TEXT,
    medico_id INT,
    pacientes_id INT,
    FOREIGN KEY (medico_id) REFERENCES medico(id),
    FOREIGN KEY (pacientes_id) REFERENCES pacientes(id)
);

CREATE TABLE quarto (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero VARCHAR(3)
);

ALTER TABLE Internacao ADD quarto_id INT;

ALTER TABLE Internacao ADD FOREIGN KEY (quarto_id) REFERENCES quarto(id);

CREATE TABLE tipo_quarto (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(45),
    valor_diaria DECIMAL(3,2)
);

ALTER TABLE quarto ADD tipo_quarto_id INT;

ALTER TABLE quarto ADD FOREIGN KEY (tipo_quarto_id) REFERENCES tipo_quarto(id);

CREATE TABLE enfermeiro (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(14) UNIQUE,
    cre VARCHAR(45) UNIQUE
);

CREATE TABLE enfermeiro_internacao (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    enfermeiro_id INT NOT NULL,
    Internacao_id INT NOT NULL,
    FOREIGN KEY (enfermeiro_id) REFERENCES enfermeiro(id),
    FOREIGN KEY (Internacao_id) REFERENCES Internacao(id)
);








    
    
    
    


