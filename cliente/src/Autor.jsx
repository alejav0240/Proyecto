import React from "react";
import { Link } from "react-router-dom";
import Constantes from "./Constantes";

class Autor extends React.Component {
    constructor(props) {
        super(props);
        this.id = props.id;
        this.state = {
            autor: {},
            isLoading: true,
            error: null
        };
    }

    async componentDidMount() {
        try {
            const respuesta = await fetch(`${Constantes.RUTA_API}/verAutor.php?id=${this.id}`);
            const autorP = await respuesta.json();
            this.setState({ autor: autorP, isLoading: false });
        } catch (error) {
            this.setState({ error, isLoading: false });
        }
    }

    render() {
        const { autor, isLoading, error } = this.state;

        if (isLoading) {
            return <div>Loading...</div>;
        }

        if (error) {
            return <div>Error: {error.message}</div>;
        }

        return (
            <div className="box">
                <Link to={`/autores/${autor.id_autor}`} >
                    <article className="media">
                        <div className="media-left">
                            <figure className="image is-64x64">
                                <img className="is-rounded" src={autor.img ==null? "https://cdn-icons-png.flaticon.com/256/9930/9930399.png":"../."+autor.img } alt="Autor" />
                            </figure>
                        </div>
                        <div className="media-content ">
                            <div className="content">
                                <p className="has-text-warning-15-invert">{console.log(autor)}
                                    <strong>{autor.seudonimo}</strong>
                                </p>
                            </div>
                            <nav className="level is-mobile">
                                <div className="level-left">
                                    <p className="has-text-warning-10-invert">Pais:  {autor.nacionalidad}</p>
                                    <p className="has-text-warning-10-invert">Genero:  {autor.genero=='F'?"Femenino":"Masculino"}</p>
                                </div>
                            </nav>
                        </div>
                    </article>
                </Link>
            </div>
        );
    }
}

export default Autor;
