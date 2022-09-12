import React ,{useState} from "react"


function Form({AddReview}){
    const [restaurant_name, setRestaurant_name] = useState("");
    const [rating, setRating] = useState("");
    const [feedback, setFeedback] = useState("");

            function handleSubmit(e) {
                e.preventDefault();
                fetch("http://localhost:9292/reviews", {
                  method: "POST",
                  headers: {
                    "Content-Type": "application/json",
                  },
                  body: JSON.stringify({
                    restaurant_name,
                    rating,
                    feedback,
                  }),
                })
                  .then((r) => r.json())
                  .then((NewReview) => AddReview(NewReview));
            
                setRestaurant_name("");
                setRating("");
                setFeedback("");
              }
        

    
      return(
        <div>
            <h1>Add a review</h1>
          <form onSubmit={handleSubmit} >
            <label>Restaurant Name: </label>
                <input type='text' value={restaurant_name} onChange={(e) => setRestaurant_name(e.target.value)}></input>
            <label>Rating(Out of 5):</label>
                <input type='integer' value={rating} onChange={(e) => setRating(e.target.value)}></input>
            <label >Feedback:</label>
                <textarea type='text' value={feedback} onChange={(e) => setFeedback(e.target.value)}></textarea> 
            <input type="submit" value="Share your review" />
                   
            
          </form>
          
        </div>
      );
}
export default Form;

