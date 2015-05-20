<?php 
	function NombreProy()
	{
		$NumeroProyecto = $_POST["numproy"];
		$respuesta = true;
		print json_encode($respuesta);
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