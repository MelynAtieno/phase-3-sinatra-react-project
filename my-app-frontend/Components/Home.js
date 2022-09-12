import React, {useState, useEffect} from "react"
import Restaurants from "./Restaurants"
import Reviews from "./Reviews"

function Home(){

    const [allReviews, setReviews] = useState([])

    function handleNewReview(review){
        setCompanies([...allReviews, review])
    }
    function deleteReview({id}){
        setReviews(allReviews.filter(restaurant => restaurant.id !== id))

        fetch(`http://localhost:9292/reviews/${id}`,{
            method: 'DELETE'
        })
            .then(resp => resp.json())
            .then()
    }

    useEffect(()=>{
        fetch("http://localhost:9292/reviews")
        .then(resp => resp.json())
        .then(reviews => setReviews(reviews))
    },[])


    return(
        <div>
          <h1>Restaurant Reviews</h1>
          <Reviews handleNewReview={handleNewReview} deleteReview={deleteReview} allReviews={allReviews}/>
          <Restaurants allReviews={allReviews}/>
        </div>
    )
}

export default Home;

