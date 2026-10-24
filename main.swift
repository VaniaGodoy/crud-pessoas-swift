
import Foundation

// Dicionário: nome -> [email, celular, idade]
var pessoas: [String: [String]] = [:]

// Função para ler textos do teclado
func lerTexto(_ mensagem: String) -> String {
    print(mensagem, terminator: ": ")
    return readLine() ?? ""
}

// Função para cadastrar uma pessoa
func criarPessoa() {
    let nome = lerTexto("Digite o nome")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    // Verifica se o nome está vazio
    if nome.isEmpty {
        print("O nome não pode ficar vazio!")
        return
    }

    // Não permite repetir o nome, mesmo com letras diferentes
    let nomeExiste = pessoas.keys.contains {
        $0.lowercased() == nome.lowercased()
    }

    if nomeExiste {
        print("Já existe uma pessoa com esse nome!")
        return
    }

    let email = lerTexto("Digite o e-mail")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    let celular = lerTexto("Digite o celular")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    let idade = lerTexto("Digite a idade")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    // Verifica se algum campo está vazio
    if email.isEmpty || celular.isEmpty || idade.isEmpty {
        print("Todos os campos devem ser preenchidos!")
        return
    }

    pessoas[nome] = [email, celular, idade]

    print("Pessoa cadastrada com sucesso!")
}

// Função para alterar uma pessoa
func alterarPessoa() {
    let nome = lerTexto("Digite o nome da pessoa que deseja alterar")

    // Procura o nome ignorando maiúsculas e minúsculas
    guard let nomeCadastrado = pessoas.keys.first(where: {
        $0.lowercased() == nome.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).lowercased()
    }) else {
        print("Pessoa não encontrada!")
        return
    }

    // Solicita novamente todos os dados
    let novoEmail = lerTexto("Digite o novo e-mail")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    let novoCelular = lerTexto("Digite o novo celular")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    let novaIdade = lerTexto("Digite a nova idade")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    // Não permite alterar com campos vazios
    if novoEmail.isEmpty || novoCelular.isEmpty || novaIdade.isEmpty {
        print("Todos os campos devem ser preenchidos!")
        return
    }

    pessoas[nomeCadastrado] = [novoEmail, novoCelular, novaIdade]

    print("Dados alterados com sucesso!")
}

// Função para apagar uma pessoa
func apagarPessoa() {
    let nome = lerTexto("Digite o nome da pessoa que deseja apagar")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    // Procura o nome ignorando maiúsculas e minúsculas
    guard let nomeCadastrado = pessoas.keys.first(where: {
        $0.lowercased() == nome.lowercased()
    }) else {
        print("Pessoa não encontrada!")
        return
    }

    pessoas.removeValue(forKey: nomeCadastrado)
    print("Pessoa apagada com sucesso!")
}

// Função para buscar e exibir uma pessoa
func buscarPessoa() {
    let nome = lerTexto("Digite o nome da pessoa que deseja buscar")
        .trimmingCharacters(in: .whitespacesAndNewlines)

    // Busca ignorando maiúsculas e minúsculas
    if let nomeCadastrado = pessoas.keys.first(where: {
        $0.lowercased() == nome.lowercased()
    }), let dados = pessoas[nomeCadastrado] {
        print("\n--- Dados da Pessoa ---")
        print("Nome: \(nomeCadastrado)")
        print("E-mail: \(dados[0])")
        print("Celular: \(dados[1])")
        print("Idade: \(dados[2])")
    } else {
        print("Pessoa não encontrada!")
    }
}

// Função para exibir todas as pessoas
func exibirTodasPessoas() {
    if pessoas.isEmpty {
        print("Nenhuma pessoa cadastrada.")
        return
    }

    print("\n--- Todas as Pessoas ---")

    for (nome, dados) in pessoas {
        print("----------------------")
        print("Nome: \(nome)")
        print("E-mail: \(dados[0])")
        print("Celular: \(dados[1])")
        print("Idade: \(dados[2])")
    }
}

// Menu principal
func menuPrincipal() {
    var opcao = ""

    repeat {
        print("""

        ===== MENU PRINCIPAL =====
        1 - Criar pessoa
        2 - Alterar pessoa
        3 - Apagar pessoa
        4 - Buscar pessoa pelo nome
        5 - Exibir todas as pessoas
        0 - Sair
        """)

        opcao = lerTexto("Escolha uma opção")

        switch opcao {
        case "1":
            criarPessoa()
        case "2":
            alterarPessoa()
        case "3":
            apagarPessoa()
        case "4":
            buscarPessoa()
        case "5":
            exibirTodasPessoas()
        case "0":
            print("Programa encerrado.")
        default:
            print("Opção inválida!")
        }

    } while opcao != "0"
}

// Inicia o programa
menuPrincipal()
