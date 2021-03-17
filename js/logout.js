// seccion de codigo javascript
		// la siguiente linea recupera el valor guardado previamente
		// con sessionStorage funciona solo recargando, con localStorage incluso apagando el PC

		document.getElementById("aqui").innerHTML = sessionStorage.getItem("nomUsr");
		function borraUsr() {
			// elimino la variable nomUsr
			sessionStorage.removeItem("nomUsr");
			// cargar la pagina de login ...
			window.open("index.html");
			window.close();
		}