<?php 
	function NombreProy()
	{
		$NumeroProyecto = $_POST["numproy"];
		$respuesta = false;
		$nombre = "";
		$consulta = sprintf("SELECT nombre FROM proyecto WHERE idProyecto=%s", mysql_real_escape_string($NumeroProyecto));
		$resultado = mysql_query($consulta);

		//Resultado == false; hay que hacer la conexión manual a la BD aquí
		print $resultado;
				
		while($registro = mysql_fetch_array($resultado))
		{
			$respuesta = true;
			$nombre = $registro["nombre"];
		}

		print $nombre;
		print json_encode($respuesta);
		
		$salidaJSON = array('respuesta' => $respuesta,
                  			'nombre'    => $nombre);
    	return $salidaJSON;
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