import React from "react";
import { NavLink } from "react-router-dom";
import logo from "./assets/images/logo.png";
class Nav extends React.Component {
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
            mostrarMenu: false 
        });
    }
    intercambiarEstado() {
        this.setState({
            mostrarMenu: !this.state.mostrarMenu
        });
    }
    render() {
        return (
            <>
                <nav className="navbar is-warning" role="navigation" aria-label="main navigation">
                    <div className="navbar-brand">
                        <a className="navbar-item" href="../index.html">
                            <img alt="" src={logo} style={{ maxHeight: "80px" }} />
                        </a>
                        <button onClick={this.intercambiarEstado} 
                        className={`navbar-burger ${this.state.mostrarMenu ? "is-active" : ""} is-warning button`} 
                        aria-label="menu" 
                        aria-expanded="false" 
                        data-target="navbarBasicExample">                                           
                            <span aria-hidden="true"></span>
                            <span aria-hidden="true"></span>
                            <span aria-hidden="true"></span>
                            <span aria-hidden="true"></span>
                        </button>
                    </div>
                    <div id="navbarBasicExample"
                    className={`navbar-menu ${this.state.mostrarMenu ? "is-active" : ""}`}>
                        <div className="navbar-start">
                            <NavLink className="navbar-item" to="/">                            
                                <span className="icon-text">
                                    <span className="icon">
                                    <i className="fas fa-home"></i>
                                    </span>
                                    <span>Inicio</span>
                                </span>
                            </NavLink>                        
                            <NavLink className="navbar-item" to="/libros">                            
                                <span className="icon-text">
                                    <span className="icon">
                                    <i className="fa-solid fa-book"></i>
                                    </span>
                                    <span>Libros</span>
                                </span>
                            </NavLink>
                            <NavLink className="navbar-item" to="/articulos">                            
                                <span className="icon-text">
                                    <span className="icon">
                                    <i className="fa-regular fa-newspaper"></i>
                                    </span>
                                    <span>Articulos</span>
                                </span>
                            </NavLink>
                            <NavLink className="navbar-item" to="/eventos">                            
                                <span className="icon-text">
                                    <span className="icon">
                                    <i className="fa-solid fa-calendar-days"></i>
                                    </span>
                                    <span>Eventos</span>
                                </span>
                            </NavLink>
                        </div>
                        <div id="navbarBasicExample"
                            className={`navbar-end ${this.state.mostrarMenu && 'is-active'}`}>
                            <div className="navbar-item">
                                <div className="buttons">
                                    <NavLink to="/registro" className="button has-background-NavLink-15">
                                        <strong>Registrarse</strong>
                                    </NavLink>
                                    <NavLink to="/login" className="button is-light">
                                        Iniciar Sesión
                                    </NavLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </>
        );
    }
}
export default Nav;


