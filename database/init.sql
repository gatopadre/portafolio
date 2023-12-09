SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `database`
--
CREATE DATABASE IF NOT EXISTS `database` CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- --------------------------------------------------------
-- Uso la base de datos `database`
-- --------------------------------------------------------

USE `database`;
-- --------------------------------------------------------
-- Eliminar usuario si existe previamente
-- --------------------------------------------------------
DROP USER 'admin'@'%';

-- --------------------------------------------------------
-- Crear usuario
-- --------------------------------------------------------
CREATE USER 'admin'@'%' IDENTIFIED BY 'Sebastian';

-- --------------------------------------------------------
-- Otorga los privilegios de base de datos al usuario conectandose desde cualquier host
-- --------------------------------------------------------
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(80) NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
);

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`) VALUES
(1, 'username', 'correo@dominio.com');

-- --------------------------------------------------------


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
