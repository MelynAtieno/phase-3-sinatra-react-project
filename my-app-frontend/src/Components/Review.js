import React from 'react'

function Review({review, RemoveReview}) {
  const {restaurant_name, rating, feedback} = review;
  

  function onDeleteClick(e) {
    e.preventDefault();
    fetch("http://localhost:9292/reviews/:id", {
      method: "DELETE",
    });
    RemoveReview(review);
    
  }


  return (
    <div>
      <h3>{restaurant_name}</h3>
      <p>{rating}</p>
      <p>
        <strong>{feedback}:</strong>
      </p>
      <button onClick={onDeleteClick} >
        Delete Review
      </button>
    </div>
  );
}

export default Review;