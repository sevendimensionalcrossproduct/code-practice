import * as crud from './crud(1).js';

//FETCH USER
function fetchUsers(){
  fetch('http//localhost:3001/users')
    .then(response => response.json())
    .then (data => document.getElementById('output').innerText = JSON.stringify(data, null, 2))
}

//CREATE NEW USER
function createUser(){
  const newUsername = prompt('Enter username: ');
  const newUser = { userId: -1, userName: newUsername };
  
  crud.createFetch()
    .then(fetchUsers);
}

//DISPLAY userName
function getUsername() {
  const userId = prompt('Enter user ID: ');

  crud.findId(userId, () => {
    alert(`Username for user ID ${userId}: ${user.userName}`)
  })
}

//UPDATE userName
function updateUsername() {
  const userId = prompt('Enter user ID to update: ');

  crud.findId(userId, () =>{
    const updatedUser = prompt('new username');

    crud.updateFetch()
      .then(response => {
        if(!response.ok){
          throw new Error(`bad ${response.status}`);
        }
        return response.json();
      })
      
      .then(updatedUser => {
        alert(`Username updated successfully: ${updatedUser.userName}`);
      })
  })
}

function deleteUsername() {
  const userId = prompt('Enter user ID to delete: ');

  crud.findId(userId, () =>{
    crud.deleteFetch()
      .then(response => {
        if (!response.ok){
          throw new Error(`bad response ${response.status}`)
        }
        return response.json();
      })
      
      .catch(error =>{
        console.error('error:', error);
      })
      
      .then(fetchUsers())

      alert(`username ${user.userName} was successfully deleted`);
  })
}

//WIPE JSON STORAGE
function wipe(){
  crud.deleteFetch()
    .then(alert('userbase wiped successfully'))
    .then(fetchUsers());
}

//Hide JSON div
function hideUsers() {
  document.getElementById('output').innerText = ''
}
