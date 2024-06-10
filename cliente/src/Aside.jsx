import React from "react";
import { NavLink } from "react-router-dom";
import logo from "./assets/images/logo.png";
class Aside extends React.Component {
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
            <aside className="menu ">
                <ul className="menu-list is-warning">
                <li>
                    <NavLink to="/user_info">
                        <figure className="image is-64x64 container">
                            <img
                                className="is-rounded"
                                src="https://png.pngtree.com/png-vector/20220817/ourlarge/pngtree-manager-icon-business-man-symbol-profile-vector-png-image_19530578.jpg"
                            />
                        </figure>
                        <p className="title is-5">Username</p>
                        <p className="subtitle is-5">Subject</p>
                    </NavLink>
                </li>
                <li>
                    <NavLink className="is-active" to="/publicaciones">Publicaciones</NavLink>
                </li>
                <li>
                    <ul className="menu-list">
                    <li className="menu-label">
                        <i className="fa fa-book" aria-hidden="true"></i>Libros
                    </li>
                    <li>
                        <ul className="menu-list">
                            <li>
                                <NavLink to="/publicaciones/libros/solicitudes">Solicitudes</NavLink>
                            </li>
                            <li>
                                <NavLink to="/publicaciones/libros/rechazados">Rechazados</NavLink>
                            </li>
                            <li>
                                <NavLink to="/publicaciones/libros/aprobados">Aprobados</NavLink>
                            </li>
                            <li>
                                <NavLink to="/publicaciones/libros/reporte">Reporte</NavLink>
                            </li>
                        </ul>
                    </li>
                    <li className="menu-label">
                        <i className="fa-solid fa-newspaper"></i>Articulos
                    </li>
                    <li>
                        <ul className="menu-list">
                            <li>
                                <NavLink to="/publicaciones/articulos/solicitudes">Solicitudes</NavLink>
                            </li>
                            <li>
                                <NavLink to="/publicaciones/articulos/rechazados">Rechazados</NavLink>
                            </li>
                            <li>
                                <NavLink to="/publicaciones/articulos/aprobados">Aprobados</NavLink>
                            </li>
                        </ul>
                    </li>
                    <li className="menu-label">
                        <i className="fa-regular fa-calendar-days"></i>Eventos
                    </li>
                    <li>
                        <ul className="menu-list">
                            <li>
                                <NavLink to="/publicaciones/eventos/futuros">Futuros</NavLink>
                            </li>
                            <li>
                                <NavLink to="/publicaciones/eventos/pasados">Pasados</NavLink>
                            </li>
                        </ul>
                    </li>
                    </ul>
                </li>
                <li>
                    <a className="is-active">
                    <i className="fa-solid fa-user"></i>Usuarios
                    </a>
                </li>
                <li>
                    <ul className="menu-list">
                    <li className="menu-label">
                        <i className="fa-solid fa-user-tie"></i> Comite
                    </li>
                    <li>
                        <ul className="menu-list">
                        <li>
                            <a>Miembros Activos</a>
                        </li>
                        <li>
                            <a>Miembros Inactivos</a>
                        </li>
                        <li>
                            <a>Nuevos Miembros</a>
                        </li>
                        </ul>
                    </li>
                    <li className="menu-label">
                        <i className="fa-solid fa-user"></i> Colaboradores
                    </li>
                    <ul className="menu-list">
                        <li>
                        <a>Miembros Activos</a>
                        </li>
                        <li>
                        <a>Miembros Inactivos</a>
                        </li>
                        <li>
                        <a>Nuevos Miembros</a>
                        </li>
                    </ul>
                    <li className="menu-label">
                        <i className="fa-solid fa-graduation-cap"></i> Pasantes
                    </li>
                    <ul className="menu-list">
                        <li>
                        <a>Miembros Activos</a>
                        </li>
                        <li>
                        <a>Miembros Inactivos</a>
                        </li>
                        <li>
                        <a>Nuevos Miembros</a>
                        </li>
                    </ul>
                    <li className="menu-label">
                        <i className="fa-solid fa-address-card"></i> Investigadores
                    </li>
                    <ul className="menu-list">
                        <li>
                        <a>Miembros Activos</a>
                        </li>
                        <li>
                        <a>Miembros Inactivos</a>
                        </li>
                        <li>
                        <a>Nuevos Miembros</a>
                        </li>
                    </ul>
                    </ul>
                </li>
                </ul>
            </aside>
        );
    }
}

export default Aside;