import React, { Component } from 'react';


const GiphysIndex = props => {
  const giphysIndexItems = props.giphys.map((giphy, i) => (
    <li key={i} className="giphy-li">
      <img src={giphy.images.fixed_height.url}></img>
    </li>
  ));

  return (
    <ul>
      {giphysIndexItems}
    </ul>
  );
};



export default GiphysIndex;
