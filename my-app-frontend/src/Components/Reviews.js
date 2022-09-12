import React from 'react'


function Reviews({reviews, ShowReviews}){

  function onSubmitClick(e){
    e.preventDefault();
    
    fetch("http://localhost:9292/reviews" ,{
      method: "GET",
    });
    ShowReviews(reviews);
  }

  

  return (
      <div>
        <button onSubmitClick={onSubmitClick}>SHOW REVIEWS</button>
      </div>

    );
  }

export default Reviews;