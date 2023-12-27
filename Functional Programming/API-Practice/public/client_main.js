/*Main client-side script*/
/*http://localhost:3001/client_main.js*/

import * as crud from './crud.js';
window.crud = crud;

const fetchUsers = async() => {
  try {
    const response = await fetch('http://localhost:3001/users')
    const data = await response.json()
    document.getElementById('output').innerText = JSON.stringify(data, null, 2);
  } catch (error) {
    console.error('bad: ', error);
  }
}

const promptAndCreateUser = async() => {
  const newUsername = prompt('Enter username: ');
  
  if (newUsername !== null){
    const newUser = { userId: -1, userName: newUsername };
    
    try{
      await crud.createFetch(newUser)
      await fetchUsers();
    } catch (error) {
      console.error('bad: ',error);
    }
  } else {
    alert('Nothing created.')
  }
};

const promptAndGetUsername = async() => {
  const userId = prompt('Enter user ID: ');
  
  if(userId !== null){
    try{
      await crud.findId(userId, user => alert(`Username for user ID ${userId}: ${user.userName}`));
    } catch (error) {
      console.error('bad: ', error);
    }
  } else {
    alert('ID not specified');
  }
};

const promptAndUpdateUsername = async() => {
  const userId = prompt('Enter user ID to update: ');
  
  if (userId !== null){
    try {
      await crud.findId(userId, async() => {
        const updatedUser = prompt('New username');

        const response = await crud.updateFetch(userId, updatedUser)
        if (response.ok) {
          const updatedUserData = await response.json();
          alert(`Username updated successfully: ${updatedUserData.userName}`);
          await fetchUsers();
        } else {
          throw new Error(`bad ${response.status}`)
        }
      });
    } catch (error) {
      console.error('bad: ', error);
    }
  } else {
    alert('No ID provided.');
  }
};

const promptAndDeleteUsername = async() => {
  const userId = prompt('Enter user ID to delete: ');
  
  if (userId !== null){
    try{
      await crud.findId(userId, async (user) => {
      await crud.deleteFetch(parseInt(userId))
      await fetchUsers();

      alert(`Username ${user.userName} was successfully deleted`);
      });
    } catch (error) {
      console.error('bad: ', error);
    }
  } else {
    alert('User ID not provided')
  }
};

const wipeUsers = async() => {
  try{
    await crud.deleteFetch();
    alert('Userbase wiped successfully');
    await fetchUsers();
  } catch (error) { 
  console.error(`bad: `, error)
  }
};

const hideUsers = () => {
  document.getElementById('output').innerText = '';
};

// Attach functions to the window object
window.fetchUsers = fetchUsers;
window.createUser = promptAndCreateUser;
window.getUsername = promptAndGetUsername;
window.updateUsername = promptAndUpdateUsername;
window.deleteUsername = promptAndDeleteUsername;
window.wipe = wipeUsers;
window.hideUsers = hideUsers;
