import React, {useState, useEffect} from "react"
import Restaurants from "./Restaurants"
import Reviews from "./Reviews"

function Form({addReviews, allReviews}){
    function handleSubmit (e){
        e.preventDefault()
        const newReview = {
            rating : e.target[0].value,
            feedback: e.target[2].value
        }
        e.target.reset()
    fetch("http://localhost:9292/reviews",{
        method: "POST",
        headers:{
            "content-type" : "application/json",
            "accept" : "application/json"
        },
        body: JSON.stringify(newReview)
    })
    .then(resp => resp.json())
    .then(resp => addReviews(resp))
    }
    
      return(
        <div>
            <h1>Add a review</h1>
          <form onSubmit={handleSubmit}>
            <label>Launch Name:</label>
                <input type='text' name="launchName" placeholder='Launch Name'></input>
            <label>Flight Success:</label>
            <select>
                    <option value='true'>True</option>
                    <option value ='false'>False</option>
            </select>
            <label>Outcome Details:</label>
                <input type='text' name='outcomeDetails' placeholder="Outcome Details"></input>
            <label>Company Name:</label>
                <select>
                    {allCompanies.map((company, index) => <option key={index}>{company.company_name}</option>)}   
                </select>    
                <input type='submit'></input>
          </form>
        </div>
      )
}
export default Form;

