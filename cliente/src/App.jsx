import { useState } from 'react';
import { Routes, Route } from 'react-router-dom';
import Nav from './Nav';
import Menu from './Menu';
import Tabla from './Tabla';
import InicioLibro from './InicioLibro';
import InfoLibro from './InfoLibro';
import Herraminetas from './Herramientas';
import Solicitudes from './Solicitudes';
function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <Nav></Nav>
      <div className="section">
        <div className="columns">
          <div>
            <Menu className="column"></Menu>
          </div>
          <div className="column">
            <Routes>
              <Route path="/" element={<div><h1>Inicio</h1></div>} />
              <Route path="/publicaciones" element={<Herraminetas/>} />
              <Route path="/libros" element={<InicioLibro />} />
              <Route path="/libros/:id" element={<InfoLibro/>} />
              <Route path="/publicaciones/libros/solicitudes" element={<Solicitudes />} />
              <Route path="/publicaciones/libros/reporte" element={<Tabla />} />
              <Route path="/articulos" element={<div><h1>Articulos</h1></div>}/>
              <Route path="/eventos" element={<div><h1>Eventos</h1></div>}/>
              <Route path="/login" element={<div><h1>Login</h1></div>}/>
              <Route path="/registro" element={<div><h1>registro</h1></div>}/>
            </Routes>
          </div>
        </div>
      </div>
    </>
  )
}

export default App
