import React from "react";
import Aside from "./Aside";
class Menu extends React.Component {
    render(){
        return (
            <div className="dropdown is-hoverable mg-small">
                <div className="dropdown-trigger">
                    <button className="button" aria-haspopup="true" aria-controls="dropdown-menu4">
                    <span className="icon is-small">
                        <i className="fa-solid fa-toolbox"></i>
                        <i className="fas fa-angle-down" aria-hidden="true"></i>
                    </span>
                    </button>
                </div>
                <div className="dropdown-menu" id="dropdown-menu4" role="menu">
                    <div className="dropdown-content">
                    <div className="dropdown-item">
                        <Aside></Aside>
                    </div>
                    </div>
                </div>
            </div>
        )
    }
}

export default Menu;