// seccion de codigo javascript
		function guardaUsr() {
			// guardo la variable nomUsr con el usuario ingresado en el formulario
			sessionStorage.setItem("nomUsr", document.forms["miFormulario"]["usuario"].value);
			// carga la pagina de logout...
			window.open("logoutindex.html");
			window.close();
		}