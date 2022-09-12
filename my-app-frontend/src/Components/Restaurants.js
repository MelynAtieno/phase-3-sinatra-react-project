import React from "react";

function Restaurants({restaurants, ShowRestaurants}){
    function onSubmitClick(e){
        e.preventDefault();
        
        fetch("http://localhost:9292/restaurant" ,{
          method: "GET",
        });
        ShowRestaurants(restaurants);
      }
    
      
    return (
          <div>
            <button onSubmitClick={onSubmitClick}>SHOW RESTAURANTS</button>
          </div>
    
        );
      }
   

export default Restaurants;