import './App.css';
import React, {useEffect, useState} from 'react';
import Form from "./Components/Form";
import Reviews from './Components/Reviews';
import Restaurants from './Components/Restaurants';


function App() {

  const [reviews, setReviews] = useState([]);
  //const [restaurants, setRestaurants] = useState([]);


  useEffect(() => {
    fetch("http://localhost:9292/reviews")
      .then(res => res.json())
      .then(data => setReviews(data))
  }, []);

  function AddReview(NewReview) {
    setReviews([...reviews, NewReview]);
  }

 
  
return (
    <div className="App">
      <div className='sidebar'>
      <header className="App-header">
      
        <h1>Review and give feedback on your favorite restaurants!!!</h1>
        
      </header>
      
      <Form AddReview= {AddReview}/>
      <Reviews/>
      <Restaurants />
</div>
</div>

);
}

export default App;
