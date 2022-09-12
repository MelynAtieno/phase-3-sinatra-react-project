import React, {useState, useEffect} from 'react'


function Reviews(){

    const [reviews, setReviews] = useState([]);

    useEffect(() => {
        const requestReviews = async () => {
          const response = await fetch("http://localhost:9292/reviews");
          const { data } = await response.json();
          setReviews(data);
        };
        requestReviews();
      }, []);
    
      return reviews.map(<div>{reviews}</div>);
    }

export default Reviews;