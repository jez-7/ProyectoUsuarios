$(document).ready(function() {
   
    
});

async function registrarUsuario() {
	
	let datos={};
	datos.nombre=document.getElementById('txtNombre').value;
	datos.apellido=document.getElementById('txtApellido').value;
	datos.email=document.getElementById('txtEmail').value;
	datos.telefono=document.getElementById('txtTelefono').value;
	datos.password=document.getElementById('txtPassword').value;
	
	let repetirPassword=document.getElementById('txtPassword').value;
	if(repetirPassword!==datos.password){
		alert("La contraseña es incorrecta")
		return;
	}
	
  const rawResponse = await fetch('api/usuario', {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    
    body: JSON.stringify(datos)
  });
   
   
   alert('Usuario registrado con exito');
   window.location.href='login.html';


}	
