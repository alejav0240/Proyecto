import React from "react";
import { Link, NavLink } from "react-router-dom";

class Herraminetas extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            mostrarMenu: false,
        };
        this.intercambiarEstado = this.intercambiarEstado.bind(this);
        this.ocultarMenu = this.ocultarMenu.bind(this);
    }
    ocultarMenu() {
        this.setState({
            mostrarMenu: false,
        });
    }
    intercambiarEstado() {
        this.setState({
            mostrarMenu: !this.state.mostrarMenu,
        });
    }
    render() {
        return (
            <div className="container ">
                <h1 className="title has-text-centered">Herramientas de Publicaciones </h1>
                <p className="subtitle is-4">Libros</p> 
                <div className="grid is-col-min-12 is-gap-2.5">
                    <div className="cell">
                        <Link to="libros/reporte" className="button is-large is-fullwidth is-warning is-inverted">Solicitudes</Link>
                    </div>
                    <div className="cell">
                        <Link to="libros/reporte" className="button is-large is-fullwidth is-warning is-inverted">Rechazados</Link>
                    </div>
                    <div className="cell">
                        <Link to="libros/reporte" className="button is-large is-fullwidth is-warning is-inverted">Aprobados</Link>
                    </div>
                    <div className="cell">
                        <Link to="libros/reporte" className="button is-large is-fullwidth is-warning is-inverted">Reporte</Link>
                    </div>
                    <div className="cell">
                        <Link to="libros/reporte" className="button is-large is-fullwidth is-warning is-inverted">Large</Link>
                    </div>
                    <div className="cell">
                        <Link to="libros/reporte" className="button is-large is-fullwidth is-warning is-inverted">Large</Link>
                    </div>
                    <div className="cell">
                        <Link to="libros/reporte" className="button is-large is-fullwidth is-warning is-inverted">Large</Link>
                    </div>
                </div>
            </div>
        )
    }
}

export default Herraminetas;
