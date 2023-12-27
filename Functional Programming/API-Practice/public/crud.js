/* CRUD functions module */
/*http://localhost:3001/crudB.js*/

export const usersUrl = 'http://localhost:3001/users';

export async function createFetch(updatedUser){
  try{
    const response = await fetch(usersUrl, {
      method: 'POST',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify(updatedUser)
    });

    if(!response.ok) {throw new Error(`Bad response: ${response.status}`);}

    return response;
  } catch (error) {
    console.error('Create fetch failed:', error);
    throw error;
  }
}

export async function readFetch(){
  try{
    const response = await fetch(usersUrl,{
      method: 'GET',
      headers: {'Content-Type': 'application/json'}
    })

    if(!response.ok) {throw new Error(`Bad response: ${response.status}`);}

    return response;
  } catch (error) {
    console.error('Read fetch failed:', error);
    throw error;
  }
}

export async function updateFetch(userId, updatedUser){
  try{
    const response = await fetch(`${usersUrl}/${userId}`,{
      method: 'PATCH',
      headers: {'Content-Type': 'application/json'},
      body: JSON.stringify({ userId: parseInt(userId), userName: updatedUser })
    })
    

    if(!response.ok) {
      throw new Error(`Bad response: ${response.status}`);
    }

    return response;
  } catch (error) {
    console.error('Update fetch failed:', error);
    throw error;
    
  }
}

export async function deleteFetch(input) {
  const url = input ? `${usersUrl}/${input}` : usersUrl;

  try {
    const response = await fetch(url, {
      method: 'DELETE',
      headers: { 'Content-Type': 'application/json' },
    });

    if (!response.ok) {throw new Error(`Bad response: ${response.status}`);}

    return response;
  } catch (error) {
    console.error('Delete fetch failed:', error);
    throw error; 
  }
}


export async function findId(userId, crudAction) {
  try {
    const response = await readFetch();

    if (!response.ok) {throw new Error('Bad response');}

    const users = await response.json();

    if (/^\d+$/.test(userId) && userId > 0) {
      const user = users.find(u => u.userId === parseInt(userId));

      if (user) {
        crudAction(user);
      } else {
        alert(`User with ID ${userId} not found.`);
      }
    } else {
      alert('Invalid ID.');
    }
  } catch (error) {
    console.error('Error retrieving user:', error);
    alert('Error retrieving user');
  }
}


export function specifyUserData(promptMessage, alertMessage, action){
  const userData = prompt(promptMessage);

  if (userData !== null && userData.trim() !== '') {
    action(userData)
  } else {
    alert(alertMessage);
  }
}
