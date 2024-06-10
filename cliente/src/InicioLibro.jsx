import React from "react";
import Libro from "./Libro";
import Constantes from "./Constantes";

class Inicio extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            libros: [],
        };
        this.title = "Catalogo de Libros";
    }
    async componentDidMount() {
        const respuesta = await fetch(`${Constantes.RUTA_API}/libros.php`);
        const libros = await respuesta.json();
        this.setState({ libros: libros });
    }
    render() {
        return (
            <div >
                <h1 className="title has-text-centered">{this.title}</h1>
                <div className="grid is-col-min-10 container">
                        {this.state.libros.map(libro => {
                            {var ic = libro.id_libro}
                                return <Libro key={ic} libro={libro}></Libro>
                            })}
                </div>
            </div>
        );
    }
}

export default Inicio;