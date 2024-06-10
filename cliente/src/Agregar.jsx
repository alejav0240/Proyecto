import React from 'react';
import Constantes from "./Constantes";
import { ToastContainer, toast } from 'react-toastify';
import 'react-toastify/dist/ReactToastify.css';
import { Link } from 'react-router-dom';

class Agregar extends React.Component {
    Constructor(props) {
        super(props);
        this.state = {
            libro: {
                libro:{
                    "titulo":"",
                    "portada":"",
                    "resumen":"",
                    "descripcion":"",
                    "archivo":"",
                },
                etiquetas:[],
                areas:[],
                autores:[],
            },
        };
        // Indicarle a las funciones a quién nos referimos con "this"
        this.manejarCambio = this.manejarCambio.bind(this);
        this.manejarEnvioDeFormulario = this.manejarEnvioDeFormulario.bind(this);
    }
    render() {
        return (
            <div className="column is-one-third">
                <h1 className="is-size-3">Agregar Libro</h1>
                <ToastContainer></ToastContainer>
                <form className="field" onSubmit={this.manejarEnvioDeFormulario}>
                    <div className="form-group">
                        <label className="label" htmlFor="nombre">Titulo:</label>
                        <input autoFocus required placeholder="Titulo" type="text" id="nombre" onChange={this.manejarCambio} value={this.state.libro.libro.titulo} className="input" />
                    </div>
                    <div class="file has-name is-boxed form-group">
                        <label class="file-label">
                            <input class="file-input" type="file" name="portada" onChange={this.manejarCambio} value={"./assets/imagenes/sub/"+this.state.libro.libro.portada} />
                            <span class="file-cta">
                            <span class="file-icon">
                                <i class="fas fa-upload"></i>
                            </span>
                            <span class="file-label"> Choose a file… </span>
                            </span>
                            <span class="file-name">{this.state.libro.libro.portada} </span>
                        </label>
                    </div>
                    <div className="form-group">
                        <label className="label" htmlFor="precio">Resumen:</label>
                        <input required placeholder="Resumen" type="number" id="Resumen" onChange={this.manejarCambio} value={this.state.libro.libro.resumen} className="input" />
                    </div>
                    <div className="form-group">
                        <label className="label" htmlFor="calificacion">Calificación:</label>
                        <input required placeholder="Calificación" type="number" id="calificacion" onChange={this.manejarCambio} value={this.state.videojuego.calificacion} className="input" />
                    </div>
                    <div className="form-group">
                        <button className="button is-success mt-2">Guardar</button>
                        &nbsp;
                        <Link to="/videojuegos/ver" className="button is-primary mt-2">Volver</Link>
                    </div>
                </form>
            </div>
        );
    }
    async manejarEnvioDeFormulario(evento) {

        evento.preventDefault();
        // Codificar nuestro videojuego como JSON

        const cargaUtil = JSON.stringify(this.state.videojuego);
        // ¡Y enviarlo!
        const respuesta = await fetch(`${Constantes.RUTA_API}/agregar.php`, {
            method: "POST",
            body: cargaUtil,
        });
        const exitoso = await respuesta.json();
        if (exitoso) {
            toast('Videojuego guardado 🎮', {
                position: "top-left",
                autoClose: 2000,
                hideProgressBar: false,
                closeOnClick: true,
                pauseOnHover: true,
                draggable: true,
                progress: undefined,
            });
            this.setState({
                videojuego: {
                    nombre: "",
                    precio: "",
                    calificacion: "",
                }
            });
        } else {
            toast.error("Error guardando. Intenta de nuevo");
        }
    }
    manejarCambio(evento) {
        // Extraer la clave del estado que se va a actualizar, así como el valor
        const clave = evento.target.id;
        let valor = evento.target.value;
        this.setState(state => {
            const videojuegoActualizado = state.videojuego;
            // Si es la calificación o el nombre, necesitamos castearlo a entero
            if (clave !== "nombre") {
                valor = parseFloat(valor);
            }
            // Actualizamos el valor del videojuego, solo en el campo que se haya cambiado
            videojuegoActualizado[clave] = valor;
            return {
                videojuego: videojuegoActualizado,
            }
        });
    }
}
export default Agregar;