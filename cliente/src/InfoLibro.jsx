import React, { useState, useEffect } from 'react';
import Constantes from './Constantes';
import Autor from './Autor';
import { Link, useParams } from 'react-router-dom';


const InfoLibro = () => {
    const params = useParams();
    const [libro, setLibro] = useState({
        areas: [],
        etiquetas: [],
        autores: []
    });
    useEffect(() => {
        const fetchLibro = async () => {
            const respuesta = await fetch(`${Constantes.RUTA_API}/verLibro.php?id=${params.id}`);
            const libroRes = await respuesta.json();
            setLibro(libroRes[0]);
        };
        fetchLibro();
    }, [params.id]);
    return (
        <div className='container'>
            {console.log(libro)}
            <h1 className="title has-text-centered">{libro.titulo}</h1>
            <div className="columns">
                <div className="column is-one-quarter">
                    <div className="card">
                        <div className="card-image">
                            <figure className="image is-2by3">
                                <img src={"./../."+libro.portada} alt={libro.titulo} />
                            </figure>
                        </div>
                    </div>
                    
                    <button className="button is-warning is-dark is-fullwidth mb-3">
                        <p className='mr-4'>PDF  </p>
                        <i className="fa-regular fa-file-pdf"></i>
                    </button>
                    <div className="box">
                        <p className="subtitle is-5">Resumen :</p>
                        <p>{libro.resumen}</p>
                    </div> 
                </div>
                <div className="column">
                    <div className="box">
                        <p className="subtitle is-5">Descripción  :</p>
                        <p>{libro.descripcion}</p>
                    </div>                   
                    <div className="box">
                        <p className="subtitle is-5">Areas :</p>
                        {libro.areas.map((area, index) => (
                            <Link to={`/libros/tag/${area}`} className='button is-inverted is-warning is-outlined m-1' key={index}>{area}</Link>
                        ))}
                    </div>
                    <div className="box">
                        <p className="subtitle is-5">Etiquetas :</p>
                        {libro.etiquetas.map((etiqueta, index) => (
                            <Link to={`/libros/tag/${etiqueta}`} className='button is-inverted is-warning is-outlined m-1' key={index}>{etiqueta}</Link>
                        ))}
                    </div>
                    <div className="box">
                        <p className="subtitle is-5">Autores :</p>
                        {libro.autores.map((autor, index) => (
                            <Autor key={index} id={autor}></Autor>
                        ))}
                    </div>
                </div>
            </div>
        </div>
    );
};

export default InfoLibro;
