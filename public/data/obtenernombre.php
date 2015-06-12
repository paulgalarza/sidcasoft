<?php 
	function ConexionBD()
	{
	  $conexion = mysql_connect('localhost', 'root', '');
	  mysql_select_db('laravel',$conexion) or die ('Error en la conexión con la BD');
	  return $conexion;
	}

	function NombreProy()
	{
		$conexion = ConexionBD();
		$NumeroProyecto = $_POST["numproy"];
		$respuesta = false;
		$nombre = "";
		$consulta = sprintf("SELECT nombre FROM proyecto WHERE idProyecto=%s", mysql_real_escape_string($NumeroProyecto));
		$resultado = mysql_query($consulta);
				
		while($registro = mysql_fetch_array($resultado))
		{
			$respuesta = true;
			$nombre = $registro["nombre"];
		}
		
		$salidaJSON = array('respuesta' => $respuesta,
                  			'nombre'    => $nombre);
    	print json_encode($salidaJSON);
	}

	//Opciones para el AJAX que obtiene el nombre del proyecto en el que está participando un usuario
	$opcion = $_POST ["opc"];
	switch ($opcion)
	{
		case 'obtenNombreProy':
			NombreProy();
			break;
		default:
			break;
	}
?>