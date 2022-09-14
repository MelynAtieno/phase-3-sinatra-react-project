import './App.css';
import React, {useEffect, useState} from 'react';
import Form from "./Components/Form";
import Review from './Components/Review';
import Restaurants from './Components/Restaurants';
import ReviewsContainer from './Components/ReviewsContainer';


function App() {

  const [reviews, setReviews] = useState([]);
  //const reviewsToDisplay = reviews.filter((rating) => || poem.isFavorite);
  //const [formVisible, setFormVisible] = useState(true);
  
  


  useEffect(() => {
    fetch("http://localhost:9292/reviews")
      .then(res => res.json())
      .then(data => setReviews(data))
  }, []);

  function AddReview(NewReview) {
    setReviews([...reviews, NewReview]);
  }

  function RemoveReview(ReviewToRemove) {
    setReviews([...reviews, ReviewToRemove])
  }

  function renderReviewView() {
      return (
        <ReviewsContainer 
          Review = {reviews}
          RemoveReview={RemoveReview} 
        />
      )
    }
  

 
  
return (
    <div className="App">
      <div className='sidebar'>
      <header className="App-header">
      
        <h1>Review and give feedback on your favorite restaurants!!!</h1>
        
      </header>
      
      <Form AddReview= {AddReview}/>
      <Review/>
      <Restaurants />
</div>
  {renderReviewView()}
</div>

);
}

export default App;
