import './App.css';
import React from 'react';
import Reviews from "../Components/Reviews";
import Form from "../Components/Form";
import Restaurants from "../Components/Restaurants";


function App() {
  const [reviews, setReviews] = useState([]);
  const [form, setForm] = useState({ restaurant: "", review: "", id: uuid() });
  const [editing, setEditing] = useState(false);
  const [restaurants, setRestaurants] = useState([]);

  function handleRestaurants(restaurants) {
            setRestaurants([...allRestaurants, restaurants])
  }

  return (
    <div className="App">
      <header className="App-header">
      
        <h1>Review and give feedback on your favorite restaurants!!!</h1>
        
      </header>
      <div className='app-body'>
      <Restaurants
          
      />
      <Form
        editing={editing}
        form={form}
        reviews={reviews}
        setEditing={setEditing}
        setForm={setForm}
        setReviews={setReviews}
      />
      <Reviews
        reviews={reviews}
        setForm={setForm}
        setEditing={setEditing}
        setReviews={setReviews}
      />

      </div>

      
    </div>
  );
}

export default App;
