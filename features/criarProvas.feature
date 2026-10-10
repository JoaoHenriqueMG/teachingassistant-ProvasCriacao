O sistema deve ser capaz de permitir a geração de provas individuais pelos professores para
suas turmas.

# -------------------------------------------------------------------------------------- #

Feature: Geração de provas
    Como um professor responsável por uma disciplina
    Eu posso selecionar as questões para uma prova
    Para que posteriormente eu possa aplicar essa prova para a turma

# --------------------------------------------------------------------------------------- #

Scenario: Professor inicia seleção de questões para uma prova
    Given eu estou na página "criação de provas"
    When eu quero criar uma prova
    Then eu vejo questões para serem selecionadas

Scenario: Professor inicia seleção de questões para uma prova mas não há questões no banco de dados
    Given eu estou na página "criação de provas"
    When eu quero criar uma prova
    Then eu vejo a mensagem de que não é possível realizar essa operação pois não há questões existentes

# -------------------------------------------------------------------------------------- #

Scenarios

Scenario: Professor procura por questões de um assunto
    Given eu estou na página "criação de provas"
    And eu vejo "duas" questões de "requisitos"
    And eu vejo "quatro" questões de "gerência de configuração"
    When eu quero ver questões de "requisitos"
    Then eu vejo "duas" questões de "requistos"

Scenario: Professor procura por questões de um assunto e não há questões desse assunto
    Given eu estou na página "criação de provas"
    And eu vejo "quatro" questões de "gerência de configuração"
    When eu quero ver questões de "requisitos"
    Then eu não vejo nenhuma questão
    And a mensagem de que não há questões de "requisitos"

Scenario: Professor procura por questões de um assunto e há somente uma questão desse assunto
    Given eu estou na página "criação de provas"
    And eu vejo "uma" questões de "requisitos"
    When eu quero ver questões de "requisitos"
    Then eu vejo "uma" questões de "requistos"

Scenario: Professor procura por questões de um assunto e não há questões no sistema
    Given eu estou na página "criação de provas"
    And eu não há questões de nenhum assunto
    When eu quero ver questões de "requisitos"
    Then eu não vejo nenhuma questões
    And a mensagem de que não há questões de "requisitos"
    And a mensagem de que não há questões cadastradas
    
# ------------------------------------------------------------------------------------------ #
    
Scenario: Professor seleciona uma questão de um assunto para a prova
    Given eu estou na página "criação de provas"
    And eu vejo "duas" questões de "requisitos"
    And eu vejo "quatro" questões de "gerência de configuração"
    When eu seleciono a questão "um" de "requisitos"
    Then eu vejo a questão "um" de "requisitos" entre as selecionadas para a prova
    And eu vejo que o conjunto aborda questões de "requisitos"

Scenario: Professor seleciona questão de um assunto para a prova que já está selecionada
    Given eu estou na página "criação de provas"
    And eu vejo "duas" questões de "requisitos"
    And eu vejo "quatro" questões de "gerência de configuração"
    And a questão "um" de "requisitos" está selecionada para a prova
    And eu vejo que o conjunto aborda questões de "requisitos"
    When eu seleciono a questão "um" de "requisitos"
    Then eu vejo a mensagem de que a questão "um" de "requisitos" já está selecionada
    Then eu vejo a questão "um" de "requisitos" entre as selecionadas para a prova
    And eu vejo que o conjunto aborda questões de "requisitos"

Scenario: Professor seleciona questões de um assunto para a prova
    Given eu estou na página "criação de provas"
    And eu vejo "duas" questões de "requisitos"
    And eu vejo "quatro" questões de "gerência de configuração"
    When eu seleciono a questão "um" de "requisitos"
    When eu seleciono a questão "dois" de "requisitos"
    Then eu vejo a questão "um" de "requisitos" entre as selecionadas para a prova
    And eu vejo a questão "dois" de "requisitos" entre as selecionadas para a prova
    And eu vejo que o conjunto aborda questões de "requisitos"

Scenario: Professor seleciona questão de um assunto para a prova para a qual uma já está selecionada
    Given eu estou na página "criação de provas"
    And eu vejo "duas" questões de "requisitos"
    And eu vejo "quatro" questões de "gerência de configuração"
    And a questão "um" de "requisitos" está selecionada para a prova
    And eu vejo que o conjunto aborda questões de "requisitos"
    When eu seleciono a questão "um" de "requisitos"
    And eu seleciono a questão "dois" de "requisitos"
    Then eu vejo a mensagem de que a questão "um" de "requisitos" já está selecionada
    And eu vejo a questão "um" de "requisitos" entre as selecionadas para a prova
    And eu vejo a questão "dois" de "requisitos" entre as selecionadas para a prova
    And eu vejo que o conjunto aborda questões de "requisitos"

Scenario: Professor seleciona questões de assuntos diferentes para a prova
    Given eu estou na página "criação de provas"
    And eu vejo "duas" questões de "requisitos"
    And eu vejo "quatro" questões de "gerência de configuração"
    When eu seleciono a questão "um" de "gerência de configuração"
    And eu seleciono a questão "um" de "requisitos"
    Then eu vejo a questão "um" de "requisitos" entre as selecionadas para a prova
    And eu vejo a questão "um" de "gerência de configuração" entre as selecionadas para a prova
    And eu vejo que a conjunto aborda questões de "requisitos"
    And eu vejo que a conjunto aborda questões de "gerência de configuração"

Scenario: Professor seleciona questões de assuntos diferentes para a prova
    Given eu estou na página "criação de provas"
    And eu vejo "duas" questões de "requisitos"
    And eu vejo "quatro" questões de "gerência de configuração"
    And a questão "um" de "requisitos" está selecionada para a prova
    When eu seleciono a questão "um" de "gerência de configuração"
    And eu vejo a questão "um" de "gerência de configuração" entre as selecionadas para a prova
    And eu vejo a questão "um" de "requisitos" entre as selecionadas para a prova
    And eu vejo que a conjunto aborda questões de "requisitos"
    And eu vejo que a conjunto aborda questões de "gerência de configuração"

# -------------------------------------------------------------------------------------------------------------- #

Scenario: Professor finaliza escolha de questões para a prova com uma questão quando não há conjuntos no histórico
    Given eu estou na página "criação de provas"
    And eu vejo a questão "um" de "requisitos" selecionada para a prova
    And eu vejo que o conjunto aborda o assunto "requisitos"
    And não há conjuntos de questões para provas no histórico de conjuntos de questões para provas
    When eu finalizo a escolha de questões
    And eu nomeio esse conjunto de questões como "Prova de requisitos"
    Then eu vejo a mensagem de que o conjunto de questões foi criado
    And vejo o conjunto "Prova de requisitos" no histórico de provas criadas
    And eu vejo a questão "um" de "requisitos" no conjunto "Prova de requisitos"
    And eu vejo a que o conjunto "Prova de requisitos" aborda o assunto "requisitos"
    And eu vejo o conjunto "Prova de requisitos" no histórico de conjuntos de questões de provas

Scenario: Professor finaliza escolha de questões para a prova com duas questões quando não há conjuntos no histórico
    Given eu estou na página "criação de provas"
    And eu vejo a questão "um" de "requisitos" selecionada para a prova
    And eu vejo a questão "um" de "gerência de configuração"
    And eu vejo que o conjunto aborda o assunto "requisitos"
    And eu vejo que o conjunto aborda o assunto "gerência de configuração"
    And não há conjuntos de questões para provas no histórico de conjuntos de questões para provas
    When eu finalizo a escolha de questões
    And eu nomeio esse conjunto de questões como "Prova de requisitos e gerência de configuração"
    Then eu vejo a mensagem de que o conjunto de questões foi criado
    And vejo o conjunto "Prova de requisitos e gerência de configuração" no histórico de provas criadas
    And eu vejo a questão "um" de "requisitos" no conjunto "Prova de requisitos e gerência de configuração"
    And eu vejo a que o conjunto "Prova de requisitos e gerência de configuração" aborda o assunto "requisitos"
    And eu vejo a que o conjunto "Prova de requisitos e gerência de configuração" aborda o assunto "gerência de configuração"
    And eu vejo o conjunto "Prova de requisitos e gerência de configuração" no histórico de conjuntos de questões de provas

Scenario: Professor finaliza escolha de questões para a prova com uma questão quando há conjuntos já criados
    Given eu estou na página "criação de provas"
    And eu vejo a questão "um" de "requisitos" selecionada para a prova
    And eu vejo que o conjunto aborda o assunto "requisitos"
    And há o conjunto "Prova de gerência de configuração" no histórico de conjuntos de questões de provas
    When eu finalizo a escolha de questões
    And eu nomeio esse conjunto de questões como "Prova de requisitos"
    Then eu vejo a mensagem de que o conjunto de questões foi criado
    And vejo o conjunto "Prova de requisitos" no histórico de provas criadas
    And eu vejo a questão "um" de "requisitos" no conjunto "Prova de requisitos"
    And eu vejo a que o conjunto "Prova de requisitos" aborda o assunto "requisitos"
    And eu vejo o conjunto "Prova de requisitos" no histórico de conjuntos de questões de provas
    And eu vejo o conjunto "Prova de gerência de configuração" no histórico de conjuntos de questões de provas

Scenario: Professor finaliza escolha de questões e nomeia o conjunto com um nome de conjunto já existente
    Given eu estou na página "criação de provas"
    And eu vejo a questão "um" de "requisitos" selecionada para a prova
    And eu vejo que o conjunto aborda o assunto "requisitos"
    And há o conjunto "Prova de requisitos" no histórico de conjuntos de questões de provas
    When eu finalizo a escolha de questões
    And eu nomeio esse conjunto de questões como "Prova de requisitos"
    Then eu vejo a mensagem de que o nome "Prova de requisitos" já foi selecionado para outro conjunto
    And eu vejo a mensagem de que não foi possível criar o conjunto
    And eu estou na página "criação de provas"
    And eu vejo a questão "um" de "requisitos" selecionada para a prova
    And eu vejo que o conjunto aborda o assunto "requisitos"
    And há o conjunto "Prova de requisitos" no histórico de conjuntos de questões de provas

Scenario: Professor finaliza escolha de questões com nenhuma questão
    Given eu estou na página "criação de provas"
    And eu não vejo questões selecionadas
    When eu finalizo a escolha de questões
    Then eu vejo a mensagem de que não foi possível criar o conjunto de questões para a prova pois não há questões selecionadas    

# ---------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------------------------------------- #

Scenario: Professor procura por questões de um assunto e há somente uma questão desse assunto
    Given eu estou na página "criação de provas"
    And eu vejo "uma" questões de "requisitos"
    When eu seleciono questões de "requisitos"
    Then eu vejo "uma" questões de "requistos"

Scenario: Professor procura por questões de um assunto e não há questões no sistema
    Given eu estou na página "criação de provas"
    And eu não há questões de nenhum assunto
    When eu seleciono questões de "requisitos"
    Then a mensagem de que não há questões de "requisitos"
    And a mensagem de que não há questões cadastradas

Scenario: Professor inicia o processo de criar prova
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo a opção "criar prova"
    When eu seleciono a opção "criar prova"
    Then eu vejo o campo "criação de prova em andamento"

Scenario: Professor inicia a seleção de questões
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo o campo "criação de prova em andamento"
    When eu seleciono a opção "selecionar de questões"
    Then eu vejo o campo de texto "assunto" vazio
    And eu vejo o campo "questões do assunto" vazio

Scenario: Professor busca por questões de um assunto
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo o campo "criação de prova em andamento"
    And eu vejo o campo de texto "assunto" vazio
    And eu vejo o campo "questões do assunto" vazio
    When eu coloco a palavra "requisitos" no campo "assunto"
    Then eu vejo o campo "assunto" com a palavra "requisitos"
    And eu vejo o campo "questões do assunto" com uma lista de questões sobre "requisitos" 

Scenario: Professor busca por questões de outro assunto
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo o campo "criação de prova em andamento"
    And eu vejo o campo de texto "assunto" com a palavra "requisitos"
    And eu vejo o campo "questões do assunto" com uma lista de questões sobre "requisitos"
    When eu substituo a palavra "requisitos" por "gerência de configuração"
    Then eu vejo o campo "assunto" com a palavra "gerência de configuração"
    And eu vejo o campo "questões do assunto" com uma lista de questões sobre "gerência de configuração"
    And eu estou na página "criação de provas"

Scenario: Professor seleciona uma questão para a prova
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo o campo "criação de prova em andamento"
    And eu vejo o campo de texto "assunto" com a palavra "requisitos"
    And eu vejo o campo "questões do assunto" com uma lista de questões sobre "requisitos"
    When eu seleciono uma questão de número "1" na lista de questões sobre o assunto "requisitos"
    Then eu vejo a lista "questões selecionadas" com a questão número "1" do assunto "requisitos" adicionada

Scenario: Professor finaliza seleção de questões para a prova
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo o campo "criação de prova em andamento"
    And eu vejo a lista "questões selecionadas" com algumas questões
    When eu seleciono a opção finalizar seleção de questões
    Then eu vejo todas as questões selecionadas no campo "questões selecionadas"
    And eu vejo a opção "configurar dados da aplicação da prova"
    And eu estou na página de criação de provas

Scenario: Professor inicia a configuração os dados de aplicação da prova
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo o campo "configurar dados da aplicação da prova"
    When eu seleciono a opção "configurar dados de aplicação"
    Then eu vejo a mensagem "etapa de configuração em andamento"

Scenario: Professor configura os dados de aplicação
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo a mensagem "etapa de configuração em andamento"
    And eu vejo o campo "tipo da avaliação" vazio
    And eu vejo o campo "data da avaliação" vazio
    And eu vejo o campo "quantidade de alunos" vazio
    When eu preencho o campo "tipo de avaliação" com "bimestral"
    And eu preencho o campo "data da avaliação" com "29/09/2026"
    And eu preencho o campo "quantidade de alunos" com "38"
    Then eu vejo o campo "tipo da avaliação" com valor "bimestral"
    And eu vejo o campo "data da avaliação" com valor "29/09/2026"
    And eu vejo o campo "quantidade de alunos" com valor "38"

Scenario: Professor finaliza a configuração de aplicação da prova
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo a mensagem "etapa de configuração em andamento"
    And eu vejo o campo "tipo da avaliação" com valor "bimestral"
    And eu vejo o campo "data da avaliação" com valor "29/09/2026"
    And eu vejo o campo "quantidade de alunos" com valor "38"
    When eu seleciono a opção confirmar configuração
    Then eu vejo a opção "finalizar criação de provas"
    And eu vejo a opção "continuar editando prova"

Scenario: Professor finaliza criação de provas
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo o opção "finalizar criação de provas"
    When eu seleciono a opção "finalizar criação de provas"
    Then eu vejo a mensagem "prova criada"
    And eu estou na página "criação de provas"
    And eu vejo o campo "informações da prova"
    And eu vejo a opção "sair"
    And eu vejo a opção "criar mais provas"
    And eu vejo o campo "provas criadas anteriormente"

Scenario: Profesor visualiza provas criadas
    Given eu estou logado como "professor"
    And eu estou na página "criação de provas"
    And eu vejo a opção "visualizar provas criadas anteriormente"
    When eu seleciono a opção "visualizar provas criadas anteriormente"
    Then eu vejo a lista "provas criadas anteriormente" com "algumas provas"
