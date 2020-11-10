
function ajax(Method, Url, callback){
	console.log('ajax');
	var xhr = new XMLHttpRequest();
	xhr.open(Method, Url);

	xhr.addEventListener('load', function(e){
		if (e.target.status == 200){
			callback(e.target.response);
		}
	});
	xhr.send();
}

function render(data){	
	var datos = document.createElement('div');
	datos.innerHTML = data;
	console.log(datos.querySelector('form'));
	var contenedor = document.createElement('div');	
	contenedor.className="contenedorEmergente"
	var div = document.createElement('div');	
	div.appendChild(datos.querySelector('form'));
	div.className = 'ventanaEmergente';
	contenedor.appendChild(div);
	var scripts = datos.querySelectorAll('script');
	console.dir(scripts);
	document.body.appendChild(contenedor);
	
	for(var i = 0, lg = scripts.length; i<lg; i++){
		let script = window.document.createElement('script');				
		script.src = scripts[i].src;
		scripts[i].remove();
		console.dir(script);
		datos.appendChild(script);
		/*datos.removeChild(scripts[i]);*/
	}
	

}

function removeWindow(){
	var div = document.querySelector(".contenedorEmergente");
	document.body.removeChild(div);
}

function ocultar_grilla(item){
            var grilla = document.getElementById(item)
            if (grilla.style.visibility == 'hidden')
                grilla.style.visibility = 'visible';
            else
                grilla.style.visibility = 'hidden';
        }