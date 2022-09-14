import React from "react";
import Review from "./Review";

function ReviewsContainer({reviews, RemoveReview}) {
  return (
    <div className="reviews-container">
      {
      reviews.map(rating => {
        return (
          <Review
            RestaurantName={resturant_name} 
            Rating={rating}
            Feedback = {feedback}            
            RemoveReview={RemoveReview} 
          />
        )
        })}
    </div>
  );
}

export default ReviewsContainer;