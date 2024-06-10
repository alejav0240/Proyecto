import React from "react";
import { Link, redirect, redirectDocument} from "react-router-dom";
import InfoLibro from "./InfoLibro";

class Libro extends React.Component {
    constructor(props) {
        super(props);
        this.Libro = props["libro"];
        this.state = {
            mostrar: true,
        };
        this.cambiarEstado = this.cambiarEstado.bind(this);      
    }
    cambiarEstado() {
        this.setState({ mostrar: !this.state.mostrar });
        console.log(this.state.mostrar);
    }

    render() {
        return (
            <div className="cell is-1">
                <div className="card " onClick={this.cambiarEstado}>
                    <div className={"card-content " }>
                        <a >
                            <div className="card-image">
                                <figure className="image is-2by3">
                                <img
                                    src={"../."+this.Libro.portada}
                                    alt="Portada image"
                                />
                                </figure>
                            </div>
                        </a>
                        <div className="media-content">
                                <p className="title is-4">{this.Libro.titulo}</p>
                                <p className="subtitle is-6">{this.Libro.autores}</p>
                        </div>
                        <div className={`content ${!this.state.mostrar ? "":"is-hidden"}`}> 
                            {this.Libro.resumen}<br/>
                            <time>Publicaion {this.Libro.fecha}</time>
                        </div>
                    </div>
                    <footer className="card-footer">
                        <Link to={`/libros/${this.Libro.id_libro}`} className="card-footer-item">
                            Abrir
                        </Link>
                        <a to={"../."+this.Libro.archivo}  className="card-footer-item">
                            PDF
                        </a>
                    </footer>
                </div>
            </div>
        );
    }
}

export default Libro;