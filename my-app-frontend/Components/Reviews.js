import React from 'react'


//import CreateCompany from "./CreateCompany";

function Reviews({ handleNewReview, deleteReview, allReviews}){

    return(
        <div>
            <div >
                <p><button onClick={()=>allReviews(review)}>Show Reviews</button></p>
                
            </div>
            
        </div>
    )
}
export default Reviews;