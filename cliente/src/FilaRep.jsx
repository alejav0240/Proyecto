import React from "react";
import { Link, redirect } from "react-router-dom";
import { toast } from "react-toastify";
import Swal from "sweetalert2";
import Constantes from "./Constantes";

class FilaRep extends React.Component {
    constructor(props) {
        super(props);
        this.Libro = props["libro"];
        this.state = {
            eliminado: false,
            estado: this.Libro.estado,
        };
        this.eliminar = this.eliminar.bind(this);     
        this.cambiar = this.cambiar.bind(this);   
    }
    async eliminar() {
        //console.log(this.Libro);
        const resultado = await Swal.fire({
            title: "¿Estás seguro?",
            text: `¿Eliminar "${this.Libro.id_libro+" "+this.Libro.titulo}"?`,
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "No, cancelar",
            confirmButtonText: "Sí, bórralo",
        });
        //si no se confirma la eliminacion se detiene
        if (!resultado.value){
            return;
        }{console.log(this.Libro.id_libro)}
        const respuesta = await fetch(`${Constantes.RUTA_API}/eliminar.php?id=${this.Libro.id_libro}`, {
            method: "DELETE",
        });
        const exitoso = await respuesta.json();
        {console.log(respuesta)}
        if (exitoso) {
            toast('Libro Eliminado', 
            { position: "top-left",
                autoClose: 2000,
                hideProgressBar: false,
                closeOnClick: true,
                pauseOnHover: true,
                draggable: true,
                progress: undefined,
            });
            this.setState({ eliminado: true });
        }else{
            toast.error('Error al eliminar');
        }
    }
    async cambiar() {
        console.log(this.Libro);
        const resultado = await Swal.fire({
            title: "¿Estás seguro?",
            text: `¿Cambiar estado de "${this.Libro.id_libro+" "+this.Libro.titulo}"?`,
            icon: "question",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            cancelButtonText: "No, cancelar",
            confirmButtonText: "Sí, Cambiar Estado",
        });
        //si no se confirma la eliminacion se detiene
        if (!resultado.value){
            return;
        }
        {console.log("id "+this.Libro.id_libro)}
        const respuesta = await fetch(`${Constantes.RUTA_API}/cambiarEstado.php?id=${this.Libro.id_libro}`, {
            method: "GET",
        });
        console.log("res"+respuesta);
        const exitoso = await respuesta.json();
        if (exitoso) {
            toast('Estado Cambiado', 
            { position: "top-left",
                autoClose: 2000,
                hideProgressBar: false,
                closeOnClick: true,
                pauseOnHover: true,
                draggable: true,
                progress: undefined,
            });
            this.setState({ estado: !this.state.estado });
        }else{
            toast.error('Error al cambiar estado');
        }
    }
    render() {
        if(this.state.eliminado){
            return null;
        }
        return (
            <tr>
                <td>{this.Libro.id_libro}</td>
                <td>{this.Libro.titulo}</td>
                <td>
                    <figure className="image is-5by6">
                        <img src={"../."+this.Libro.portada} />
                    </figure>
                </td>
                <td>{this.Libro.resumen}</td>
                <td>{this.Libro.descripcion}</td>
                <td>
                    <a href={"../."+this.Libro.archivo} target="_blank" className="button is-warning is-dark">
                        PDF
                    </a>
                </td>
                <td>
                    {this.Libro.estado? "Activo" : "Inactivo"}
                </td>
                <td>{this.Libro.fecha}</td>
                <td>{this.Libro.etiquetas}</td>
                <td>{this.Libro.areas}</td>
                <td>{this.Libro.autores}</td>
                <td>
                    <button onClick={this.cambiar} className="button is-warning is-light">
                        Cambiar Estado
                    </button>
                </td>
                <td>
                    <button onClick={this.eliminar} className="button is-danger is-light">
                        Eliminar
                    </button>
                </td>
            </tr>
        );
    }
}

export default FilaRep; 
