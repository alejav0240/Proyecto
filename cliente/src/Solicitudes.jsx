import React from "react";
import Constantes from "./Constantes";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import FilaRep from "./FilaRep";

class Solicitudes extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            libros: [],
        };
        this.title = "Solicitudes de Libros";
    }
    async componentDidMount() {
        const respuesta = await fetch(`${Constantes.RUTA_API}/repLibros.php`);
        const libros = await respuesta.json();
        this.setState({ libros: libros });
    }
    render() {
        return (
            <div>
                <div className="column">
                    <h1 className="title has-text-centered is-3 ">{this.title}</h1>
                    <ToastContainer />
                </div>
                <button className="button is-warning is-outlined is-inverted mb-5">
                    <i className="fa-solid fa-plus"></i>
                    <p className="ml-3">Nueva Solicitud</p>
                </button>
                <div className="table-container">
                    <table className="table is-fullwidth is-striped is-hoverable">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Titulo</th>
                                <th>Portada</th>
                                <th>Resumen</th>
                                <th>Descripcion</th>
                                <th>Archivo</th>
                                <th>Estado</th>
                                <th>Fecha</th>
                                <th>Etiquetas</th>
                                <th>Areas</th>
                                <th>Autores</th>
                                <th></th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            {this.state.libros.map(libro => {
                                {var ic = libro.id_libro}
                                return <FilaRep key={ic} libro={libro}></FilaRep>;
                            })}
                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
}

export default Solicitudes;