<?php
include "conexao.php";

$idVaga = isset($_GET['id']) ? (int)$_GET['id'] : 0;
$consultaVaga = "select * from tbl_vagas where vaga_id = :id and status = 'ativa'";
$prepararConsulta = $cn->prepare($consultaVaga);
$prepararConsulta->bindValue(':id', "$idVaga", PDO::PARAM_INT);
$prepararConsulta->execute();
$filtrarVaga = $prepararConsulta->fetch();

if(!$filtrarVaga){
    header("location:index.php");
    exit;
}
// O comando 'echo print_r' que estava aqui foi removido para limpar a tela!
?>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalhes da Vaga - AgênciaJobs</title>
    <link rel="stylesheet" href="css/estilo.css">
</head>
<body>

    <!-- TOPNAV -->
    <header class="header">
        <div class="container">
            <nav class="navbar">
                <a href="index.php" class="logo">AgênciaJobs</a>
                <ul class="nav-menu">
                    <li><a href="index.php" class="nav-link">Início</a></li>
                    <li><a href="index.php#vagas" class="nav-link">Vagas</a></li>
                    <li><a href="login.php" class="btn-login">Entrar / Cadastrar</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- CONTEÚDO PRINCIPAL DA VAGA -->
    <main class="container details-container">
        
        <!-- Botão para retornar à listagem -->
        <a href="index.php" class="btn-back">&larr; Voltar para as vagas</a>

        <article class="job-detail-card">
            
            <!-- Cabeçalho do Card -->
            <header class="job-detail-header">
                <span class="badge">Vaga Ativa</span>
                <h1 class="job-detail-title"><?= htmlspecialchars($filtrarVaga['titulo'])?></h1>
                <p class="job-detail-company">Verificar com selecionador</p>
            </header>

            <!-- Painel de Metadados (Grade com Informações Rápidas) -->
            <div class="job-meta-grid">
                <div class="job-meta-item">
                    <span class="meta-label">Localização</span>
                    <span class="meta-value"><?=htmlspecialchars($filtrarVaga['localizacao'])?></span>
                </div>
                <div class="job-meta-item">
                    <span class="meta-label">Salário</span>
                    <span class="meta-value">R$: <?= number_format($filtrarVaga['salario'], 2, ",", ".")?></span> 
                </div>
                <div class="job-meta-item">
                    <span class="meta-label">Publicado em</span>
                    <span class="meta-value"><?php $data = date_create($filtrarVaga['data_criacao']);
                                echo date_format($data, "d/m/Y");?></span>
                </div>
            </div>

            <hr class="divider">

            <!-- Descrição Completa -->
            <section class="job-section">
                <h2>Descrição da Vaga</h2>
                <p><?= htmlspecialchars($filtrarVaga['descricao'])?></p>
            </section>

            <!-- Requisitos do Cargo -->
            <section class="job-section">
                <h2>Requisitos Necessários</h2>
                <p><?= htmlspecialchars($filtrarVaga['requisitos'])?></p>
            </section>

            <!-- Caixa de Ação -->
            <div class="job-action-box">
                <!-- ID tornado dinâmico para enviar o ID correto para a página de candidatura -->
                <a href="candidatar.php?id=<?= $filtrarVaga['vaga_id'] ?>" class="btn-apply-large">Candidatar-se a esta Vaga</a>
            </div>

        </article>
    </main>

    <!-- RODAPÉ -->
    <footer class="footer">
        <div class="container">
            <p>&copy; 2026 AgênciaJobs. Desenvolvido para fins didáticos nas aulas de Desenvolvimento de Sistemas.</p>
        </div>
    </footer>

</body>
</html>