import { useEffect, useState } from "react"
import axios from 'axios';
function App() {
  const [users, setUsers] = useState([]);
  const [input,setInput]=useState({name:'',email:''})
  const fetchData = async () => {
    const resp = await axios.get('http://127.0.0.1:5000/users');
    if (resp.status == 200) {
      setUsers(resp.data);
    }
  }
  useEffect(() => {
    fetchData()
  }, [])
  const handleSubmit=async(e)=>{
    e.preventDefault();
    const resp=await axios.post('http://127.0.0.1:5000/users',input);
    if(resp.status==201){
      alert("User added successfully");
      fetchData();
      setInput({name:'',email:''})
    }
  }
  return (
    <div>
      <h1>Python Flask App</h1>
      <table>
        <thead><tr><th>ID</th><th>Name</th><th>Email</th></tr></thead>
        <tbody>
          {
            users.map(user => (
              <tr key={user[0]}>
                <td>{user[0]}</td>
                <td>{user[1]}</td>
                <td>{user[2]}</td>
              </tr>
            ))
          }
        </tbody>
      </table>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Name</label>
          <input type="text" placeholder="Enter name" 
          onChange={(e)=>setInput({...input,name:e.target.value})}
          value={input.name}/>
        </div>
        <div>
          <label>Name</label>
          <input type="email" placeholder="Enter Email"
          onChange={(e)=>setInput({...input,email:e.target.value})}
          value={input.email}/>
        </div>
        <button type="submit">Save Data</button>
      </form>
    </div>
  )
}

export default App
