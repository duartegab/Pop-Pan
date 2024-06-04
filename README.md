# Pop-Pan
Nesse projeto, te mostro como fazer uma modelagem de dados para um festival de música (Pop Pan) do início ao fim. De acordo com todos os meus conhecimentos em DER, MER e Modelagem de Dados Física, que aprendi ao decorrer do semestre.


## 🚀 Parte 1 - Criando nosso cenário...

Para começarmos uma Modelagem de Banco de Dados, o primeiro passo é fazer o cenário, para assim entender quais serão as Entidades (futuras tabelas), Atributos (futuros campos) e os Relacionamentos. Como já disse meu Banco de Dados 'Pop Pan', organizará toda a estrutura de um festival de música, se liga nele:

# Festival de Música "Pop Pan"

O Banco Pan está organizando um festival de música no Rio de Janeiro, chamado "Pop Pan". Os ingressos são vendidos online, no app do Banco e são validados na entrada do show pela equipe de segurança digital, para evitar fraudes. O sistema de banco de dados para o festival gerencia todas as edições do evento, incluindo artistas, agenda, locais, equipe, patrocinadores e setlists. A seguir, alguns detalhes e requisitos do sistema:

# 1. Edições do Festival:
   
• Cada edição possui um ID único, tema, data e hora de início, data e hora de término, criador da edição (com nome, telefone e email), duração da edição e patrocinadores.
  
# 2. Local:
   
• Cada local possui um ID único, nome, endereço (com rua, número e bairro), CEP, equipe, ID da Edição e quantidade de pessoas estimadas.
  
# 3. Artistas:
 
• Cada artista possui um ID único, nome, descrição, data de nascimento, detalhes da apresentação (como local, data e hora), idade, ID da Edição e redes sociais.
  
# 4. Apresentação:

• Cada apresentação possui um ID único, nome do artista, detalhes da apresentação (como nome do local, data e hora), apresentações por edição, ID da Edição e atividades extras.
  
# 5. Equipes:

• Cada equipe possui um ID único, nome do membro, quantidade de membros, tarefas, ID da Edição e localização (composto por uma descrição, latitude, longitude).

# 6. Ingressos:

• Cada ingresso possui um ID único, nome do comprador, idade, data de nascimento, CPF, forma de pagamento, ID da Edição, contato (composto por telefone, email e conta no app do banco) e quais shows irá participar.


Para um melhor relacionamento entre esses fatores, seguem mais alguns detalhes:

1. Cada edição é abrigada em um único local e cada local é abrigado para uma única edição.
2. Um artista pode se apresentar em várias edições e uma edição pode apresentar vários artistas.
3. Uma apresentação possui somente um artista, mas cada artista pode ter várias apresentações.
4. Um local pode ter múltiplas equipes ao seu gerenciamento, mas cada equipe está gerenciando um único lugar.
5. Uma apresentação pode gerar muitos ingressos, e cada ingresso pode ser gerado apenas para várias apresentações.
6. Uma equipe pode validar inúmeros ingressos e um ingresso pode ser validado somente por uma equipe.
 

É tanta coisa, tanta informação né?! Mas relaxe, agora vamos começar a organizar tudo isso! =)



### 📋 Parte 2 - Criando nosso Modelagem Conceitual de Dados:

Agora é a hora que pegamos todas essas informações, e convertemos num diagrama, com entidades, atributos e relacionamentos. Lembre-se das diferenças dos atributos (simples, composto, multivalorado, derivado e identificador) bem como os relacionamentos entre entidades (1 para 1, 1 para N e N para N), essas informações serão importantes mais tarde! 😉

Se liga no exemplo:

![DER](https://github.com/duartegab/Pop-Pan/blob/main/PrintsPopPan/modeloconceitual.png)

Ah, outro detalhe importante é saber que as Entidades são representadas por retângulos, os Atributos por elipses, os Relacionamentos por Losangos (sendo todos interligados por linha, tá bom?!)



### 🔧 Parte 3 - Transicionando para o Modelo Lógico:

Bom, mesmo com o Diagrama, ainda não chegamos perto o suficiente da modelagem física. Para isso acontecer, as entidades se tornarão tabelas (com chaves primárias e estrangeiras), e os atributos se tornarão campos de valores para receber os dados (sendo int, varchar ou etc). Dessa forma, Já nos organizamos melhor para em breve migrarmos para a Modelagem Física.

Será como o exemplo abaixo:

![DER](https://github.com/duartegab/Pop-Pan/blob/main/PrintsPopPan/modelologico.png)

Não se esqueça também dos relacionamentos (alguns virarão tabelas intermediárias, outros serão interligados por chaves estrangeiras, caso tenha alguma dúvida, dê uma aprofundada na Modelagem Lógica de Dados)!



## ⚙️ Executando os testes

Explicar como executar os testes automatizados para este sistema.

### 🔩 Analise os testes de ponta a ponta

Explique que eles verificam esses testes e porquê.

```
Dar exemplos
```

### ⌨️ E testes de estilo de codificação

Explique que eles verificam esses testes e porquê.

```
Dar exemplos
```

## 📦 Implantação

Adicione notas adicionais sobre como implantar isso em um sistema ativo

## 🛠️ Construído com

Mencione as ferramentas que você usou para criar seu projeto

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - O framework web usado
* [Maven](https://maven.apache.org/) - Gerente de Dependência
* [ROME](https://rometools.github.io/rome/) - Usada para gerar RSS

## 🖇️ Colaborando

Por favor, leia o [COLABORACAO.md](https://gist.github.com/usuario/linkParaInfoSobreContribuicoes) para obter detalhes sobre o nosso código de conduta e o processo para nos enviar pedidos de solicitação.

## 📌 Versão

Nós usamos [SemVer](http://semver.org/) para controle de versão. Para as versões disponíveis, observe as [tags neste repositório](https://github.com/suas/tags/do/projeto). 

## ✒️ Autores

Mencione todos aqueles que ajudaram a levantar o projeto desde o seu início

* **Um desenvolvedor** - *Trabalho Inicial* - [umdesenvolvedor](https://github.com/linkParaPerfil)
* **Fulano De Tal** - *Documentação* - [fulanodetal](https://github.com/linkParaPerfil)

Você também pode ver a lista de todos os [colaboradores](https://github.com/usuario/projeto/colaboradores) que participaram deste projeto.

## 📄 Licença

Este projeto está sob a licença (sua licença) - veja o arquivo [LICENSE.md](https://github.com/usuario/projeto/licenca) para detalhes.

## 🎁 Expressões de gratidão

* Conte a outras pessoas sobre este projeto 📢;
* Convide alguém da equipe para uma cerveja 🍺;
* Um agradecimento publicamente 🫂;
* etc.


---
⌨️ com ❤️ por [Armstrong Lohãns](https://gist.github.com/lohhans) 😊
