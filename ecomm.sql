-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17-Nov-2019 às 23:27
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ecomm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(1, 'Artigos', '01'),
(2, 'Acessorios para Trilha', '02'),
(3, 'Protetores e repelentes ', '04'),
(4, 'Diversos', '05');

-- --------------------------------------------------------

--
-- Estrutura da tabela `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb4 NOT NULL,
  `description` text CHARACTER SET utf8mb4 NOT NULL,
  `slug` varchar(200) CHARACTER SET utf8mb4 NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `date_view`, `counter`) VALUES
(30, 1, 'CAMINHOS E TRILHAS DA ILHA GRANDE - JOSE BERNARDO', '<p>Caminhos e Trilhas da Ilha Grande, pela singularidade dos assuntos nela contidos, &eacute; obra de real valor aos excursionistas que gostam de caminhar pelo mato. N&atilde;o h&aacute; na literatura brasileira, e qui&ccedil;&aacute; na internacional, livro que re&uacute;na tantas e importantes informa&ccedil;&otilde;es &uacute;teis como as que Bernardo soube coletar e ele mesmo colheu em sua pr&aacute;tica de palmilhar as trilhas da Ilha Grande.</p>\r\n', 'caminhos-e-trilhas-da-ilha-grande-jose-bernardo', 60, 'livro.jpg', '2019-11-17', 15),
(31, 4, 'Caneca Ilha Grande ', '<p>Caneca em porcelana personalizada - Caneca de alta qualidade!!!<br />\r\nUMA &Oacute;TIMA OP&Ccedil;&Atilde;O PARA PRESENTEAR QUEM VOC&Ecirc; AMA!!!<br />\r\nDESCONTO ESPECIAL para quantidade superior a 10 unidades, consulte-nos!!!</p>\r\n', 'caneca-ilha-grande', 22, 'caneca.jpg', '2019-11-17', 10),
(32, 4, 'Lembrancinha da ilha Grande ', '<p>Leve um peda&ccedil;o de Parnaioca com voc&ecirc;</p>\r\n', 'lembrancinha-da-ilha-grande', 10, 'barquinho.jpg', '2019-11-17', 2),
(33, 2, 'Tênis para Trilha', '<p>Caminhar ao livre &eacute; a sua praia? Tamb&eacute;m conhecida como&nbsp;<em><a href=\"https://www.zoom.com.br/tenis?q=trekking&amp;shortcut=1&amp;pagenumber=2\" target=\"_blank\">trakking</a></em>, a pr&aacute;tica pode ser in&iacute;cio da rotina di&aacute;ria de exerc&iacute;cio de muitas pessoas e at&eacute; mesmo um treino para quem quer come&ccedil;ar a fazer&nbsp;<strong>trilhas com intensidade leve</strong>&nbsp;por a&iacute;.</p>\r\n', 'tenis-para-trilha', 100, 'sapato.jpg', '0000-00-00', 0),
(34, 2, 'Aculos de sol', '<p>Com arma&ccedil;&otilde;es quadradas, redondas, no estilo aviador ou com lentes espelhadas, os &oacute;culos de sol masculinos complementa qualquer estilo.</p>\r\n', 'aculos-de-sol', 20, 'raiban.jpg', '2019-11-17', 2),
(35, 3, 'Repelente corporal ', '<p>Repelente corporal em spray com 12 horas de prote&ccedil;&atilde;o. Possui Icaridina em sua f&oacute;rmula sendo eficaz contra o mosquito do Zika, da Dengue e do Chikungunya, sendo eficaz tamb&eacute;m contra pernilongos e muri&ccedil;ocas.Testado dermatologicamente.Repelente corporal em spray com 12 horas de prote&ccedil;&atilde;o. Possui Icaridina em sua f&oacute;rmula sendo eficaz contra o mosquito do Zika, da Dengue e do Chikungunya, sendo eficaz tamb&eacute;m contra pernilongos e muri&ccedil;ocas.Testado dermatologicamente.</p>\r\n', 'repelente-corporal', 40, 'sbp.jpg', '0000-00-00', 0),
(36, 3, 'Protetor Solar ', '<p>O Nivea Sun &eacute; um protetor solar facial para uso di&aacute;rio, com textura ultraleve, que oferece muito alta prote&ccedil;&atilde;o imediata UVA/UVB</p>\r\n', 'protetor-solar', 40, 'protetor.jpg', '2019-11-17', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(1, 'admin@admin.com', '$2y$10$F0CyO.qGvMBocf8pbjFuJO2feEOOMYseqCv.UfkGGMUpo9AX6XkLi', 1, 'Obito', 'Uchira', '', '', '585debbbbf0795.89186372Obito-Uchiha.png', 1, '', '', '2018-05-01'),
(13, 'adm@hudson.com', '$2y$10$cGVdqxKuPryyYVFdIij5fudjYkqD4x4IyXOJDCILHA.IjeA7NZcry', 1, 'Hudson', 'gay', 'Viado', '', '', 1, '', '', '2019-11-12'),
(14, 'adm@danilo.com', '$2y$10$cGVdqxKuPryyYVFdIij5fudjYkqD4x4IyXOJDCILHA.IjeA7NZcry', 1, 'Itachi', 'Uchira', '', '', 'itachi-uchiha-705.jpg', 1, '', '', '2019-11-12'),
(15, 'douglas-oliveira12@hotmail.com', '$2y$10$G2mFnBGqIizc1i8a1qcQD.XH1XFGJSaNS9kNjoBqQiLxszuF2fa4u', 0, 'Douglas', 'Oliveira', '', '', '', 1, '329rnSNkXPou', '', '2019-11-13');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de tabela `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
