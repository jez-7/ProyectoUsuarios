
$(document).ready(function() {
	cargarUsuarios()
  $('#usuario').DataTable();
});

async function cargarUsuarios() {
	
  const rawResponse = await fetch('api/usuario', {
    method: 'GET',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
   
  });
  
  const usuarios = await rawResponse.json();
  
  let listadoHTML= '';

for(let usuario of usuarios) {
	
	let botonEliminar = '<a href="#" onclick="eliminarUsuario('+ usuario.id +')" class="btn btn-danger btn-circle"><i class="fas fa-trash"></i> </a>';
	
	let usuarioHtml = '<tr><td>' + usuario.id + '</td><td>' + usuario.nombre + ' ' + usuario.apellido + '</td><td>'
	+ usuario.email + '</td><td>' + usuario.telefono+ '</td><td>' +  usuario.password + '</td><td>' + botonEliminar + '</td></tr>';
	
	listadoHTML+=usuarioHtml;
}



document.querySelector('#usuario tbody').outerHTML=listadoHTML
}



async function eliminarUsuario(id){
    if(!confirm('Desea eliminar usuario?')){
        return;
    }
    const request = await fetch('api/usuario/' + id, {
		method: 'DELETE',
		headers: {
			'Accept': 'application/json',
            'Content-Type': 'application/json'
    },
    
  });
  location.reload();
}	

























