import React, {Fragment} from 'react'
import styled from 'styled-components'

const RatingContainer = styled.div`
  text-align: center;
  border-radius: 4px;
  font-size: 18px;
  padding: 40px 0 10px 0;
  border: 1px solid #e6e6e6;
  background: #fff;
`

const RatingBox = styled.div`
  display: flex;
  flex-direction: row-reverse;
  background: #fff;
  justify-content: center;
  position: relative;

  input {
      display: none;
  }
  lable {
      cursor: pointer;
      width: 40px;
      height: 40px;
      background-image: url();
  }
`

const RatingTitle = styled.div`
  display: flex;
  flex-direction: row;
`

const ReviewForm = (props) => {
    const ratingOptions = [5,4,3,2,1].map( (score,index) => {
        return (
            <Fragment>
                <input type="radio" value={score} name="rating" onChange={() => console.log('selected:', score)} id={`rating-${score}`} />
                <lable></lable>
            </Fragment>
        )
    })
    return (
        <div className="wrapper">
            <form onSubmit={props.handleSubmit} >
                <div>Have a experience with {props.attributes.name} share your review!</div>
                <div className='field'>
                    <input onChange={props.handleChange}  value={props.review.title} type="text" name="title" placeholder="Review Title" />
                </div>
                <div className='field'>
                    <input onChange={props.handleChange}  value={props.review.description}  type="text" name="description" placeholder="Review Description" />
                </div>
                <div className='field'>
                    <RatingContainer>
                        <div className="rating-title-text">Rate this Airline</div>
                            <div className="rating-box">
                                {ratingOptions}
                            </div> 
                    </RatingContainer>
                </div>
                <button type="submit">Submit your Review</button>
            </form>
        </div>
    )
}

export default ReviewForm