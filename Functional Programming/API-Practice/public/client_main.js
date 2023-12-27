/*Main client-side script*/
/*http://localhost:3001/client_main.js*/

import * as crud from './crud.js';
window.crud = crud;

const showUsers = async() => {
  try {
    const response = await fetch(crud.usersUrl)
    const data = await response.json()
    document.getElementById('output').innerText = JSON.stringify(data, null, 2);
  } catch (error) {
    console.error('bad: ', error);
  }
}

const promptAndCreateUser = async() => {
  crud.specifyUserData('Enter new username', 'Invalid username', async(newUsername) => {
      const newUser = { userId: -1, userName: newUsername }; //ID calculated by API
      
      try{
        await crud.createFetch(newUser)
        alert(`User ${newUsername} created successfully`);
        await showUsers();
      } catch (error) {
        console.error('bad: ',error);
      }
  })
};

const promptAndGetUsername = async() => {
  crud.specifyUserData('Enter ID to get:', 'No ID provided', async (userId) => {
    try{
      await crud.findId(userId, user => alert(`Username for user ID ${userId}: ${user.userName}`));
    } catch (error) {
      console.error('bad: ', error);
    }
  })
};

const promptAndUpdateUsername = async() => {
  crud.specifyUserData('Enter ID to update:','No ID provided' , async (userId) =>{
    try {
      await crud.findId(userId, async() => {

        crud.specifyUserData('Enter updated username', 'Invalid username', async(updatedUser) => {
          const response = await crud.updateFetch(userId, updatedUser)
          if (response.ok) {
            const updatedUserData = await response.json();
            alert(`Username updated successfully: ${updatedUserData.userName}`);
            await showUsers();
          } else {
            throw new Error(`bad ${response.status}`)
          }
        })
      });
    } catch (error) {
      console.error('bad: ', error);
    }
  })
};

const promptAndDeleteUsername = async() => {
  crud.specifyUserData('Enter ID to delete:', 'No ID provided', async(userId) => {
    try{
      await crud.findId(userId, async (user) => {
        await crud.deleteFetch(parseInt(userId))
        await showUsers();
        alert(`Username ${user.userName} was successfully deleted`);
      });
    } catch (error) {
      console.error('bad: ', error);
    }
  })
};

const wipeUsers = async() => {
  try{
    await crud.deleteFetch();
    alert('Userbase wiped successfully');
    await showUsers();
  } catch (error) { 
    console.error(`bad: `, error)
  }
};

const hideUsers = () => {
  document.getElementById('output').innerText = '';
};

window.showUsers = showUsers;
window.createUser = promptAndCreateUser;
window.getUsername = promptAndGetUsername;
window.updateUsername = promptAndUpdateUsername;
window.deleteUsername = promptAndDeleteUsername;
window.wipe = wipeUsers;
window.hideUsers = hideUsers;
