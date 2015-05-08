
function cerrarSesion(login){
swal({  
		title: "Estás seguro que deseas cerrar sesión?",  
		text: "",   
		type: "warning",  
 		showCancelButton: true,   
 		confirmButtonColor: "#DD6B55",   
 		confirmButtonText: "Sí, estoy seguro!",  
 		cancelButtonText: "No, cancelar!",   
 		closeOnConfirm: false,   
 		closeOnCancel: true }, 

 	function(){       
 			window.location.href="logout";

 		 });
}