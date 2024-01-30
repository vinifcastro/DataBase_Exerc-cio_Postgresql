SELECT
		pessoa.cpf as "CPF",
	 	pessoa.nome as "Nome Completo",
		pessoa.nome_pai as "Nome do Pai",
		pessoa.nome_mae as "Nome da Mãe",
		to_char(pessoa.data_nascimento,'DD/MM/YYYY') as "Data de Nascimento",
		dependente.tipo_dependente as "Tipo de Dependente",
		dependente.nome_dependente as "Nome do Dependente",
		to_char(dependente.data_nascimento,'DD/MM/YYYY') as "Data de Nascimento do Dependente",
		tipodeendereco.nome_tipo_end as "Nome do Tipo de Endereço",
		endereco.quadra as Quadra,
		endereco.lote as Lote,
		endereco.numero as "Número",
		endereco.complemento as Complemento,
		logradouro.nome_logradouro as "Nome do Logradouro",
		bairro.nome_bairro as "Nome do Bairro",
		municipio.nome_municipio as "Nome do Municipio",
		uf.nome_uf as "Nome do Estado"
FROM pessoa
	JOIN dependente 	ON pessoa.cpf 			  	  = dependente.cpf
	JOIN possui     	ON pessoa.cpf 			  	  = possui.cpf
	JOIN tipodeendereco ON possui.codigo_tipo_end 	  = tipodeendereco.codigo_tipo_end
	JOIN endereco 		ON possui.id_endereco	  	  = endereco.id_endereco
	JOIN logradouro		ON endereco.codigo_logradouro = logradouro.codigo_logradouro
	JOIN bairro			ON logradouro.codigo_bairro	  = bairro.codigo_bairro
	JOIN municipio		ON bairro.codigo_municipio	  = municipio.codigo_municipio
	JOIN uf				ON municipio.sigla_uf		  = uf.sigla_uf
ORDER BY pessoa.cpf, pessoa.nome;