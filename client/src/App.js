import './App.css';
import {useEffect, useState} from 'react'

function App() {

  const [formData, setFormData] = useState({
    name: '',
    description: '',
    price: 0,
    box_count: 0
  })

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value
    })
  }
  
  const handleSubmit = (e) => {
    e.preventDefault()
    fetch('http://localhost:3000/products', {
      method: 'POST',
      headers: {
        'content-type': 'application/json'
      },
      body: JSON.stringify({
        name: formData.name, 
        description: formData.description,
        price: parseFloat(formData.price),
        box_count: parseInt(formData.box_count)
      })
    }).then(res => res.json())
    .then((data) => {
      console.log(data)
    })
  }

  return (
    <div className="App">
      <form onSubmit={handleSubmit}>
        <input name='name' onChange={handleChange}/>
        <input name='description' onChange={handleChange}/>
        <input name='price' type='number' step='.01' onChange={handleChange}/>
        <input name='box_count' type='number' onChange={handleChange}/>
        <input type='submit'/>
      </form>
    </div>
  );
}

export default App;
